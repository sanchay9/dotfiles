--[[
    autolyrics.lua by zydezu
	(https://github.com/zydezu/mpvconfig/blob/main/scripts/autolyrics.lua)

	* Based on https://github.com/guidocella/mpv-lrc

    Tries to download lyrics and display them for said file
--]]

mp.utils = require "mp.utils"

local options = {
  musixmatch_token = "2501192ac605cc2e16b6b2c04fe43d1011a38d919fe802976084e7",
  download_for_all = false, -- try to get subtitles for music without metadata
  load_for_youtube = true, -- try to load lyrics on youtube videos
  store_lyrics_seperate = true, -- store lyrics in ~~desktop/mpv/lrcdownloads/
  lyrics_store = "~~desktop/.cache/mpv/lrcdownloads/", -- where to store downloaded lyric files if store_lyrics_seperate is true
  cache_loading = true, -- try to load lyrics that were already downloaded
  strip_artists = true, -- remove lines with the names of the artists from NetEase lyrics
  run_automatically = false, -- run this script without pressing Alt+m
}
require("mp.options").read_options(options)

local manual_run = false
local got_lyrics = false
local without_timestamps = false
local downloading_name = ""
local old_subtitle_count, subtitle_count

local function show_error(message)
  mp.msg.error(message)
  if mp.get_property_native "vo-configured" and manual_run then
    mp.osd_message(message, 5)
  end
end

local function curl(args)
  local r = mp.command_native { name = "subprocess", capture_stdout = true, args = args }

  if r.killed_by_us then
    -- don't print an error when curl fails because the playlist index was changed
    return false
  end

  if r.status < 0 then
    show_error("subprocess error: " .. r.error_string)
    return false
  end

  if r.status > 0 then
    show_error("curl failed with code " .. r.status)
    return false
  end

  local response, error = mp.utils.parse_json(r.stdout)

  if error then
    show_error "Unable to parse the JSON response"
    return false
  end

  return response
end

local function get_metadata()
  local metadata = mp.get_property_native "metadata"
  local title, artist, album
  if metadata then
    if next(metadata) == nil then
      mp.msg.info "Couldn't load metadata!"
    else
      title = metadata.title or metadata.TITLE or metadata.Title
      if options.download_for_all then
        title = mp.get_property "media-title"
        title = title:gsub("%b[]", "") .. " "
      end
      artist = mp.get_property "filtered-metadata/by-key/Album_Artist"
        or mp.get_property "filtered-metadata/by-key/Artist"
        or mp.get_property "filtered-metadata/by-key/Uploader"
      if options.download_for_all and not artist then
        artist = " "
      end
      album = metadata.album or metadata.ALBUM or metadata.Album
    end
  else
    mp.msg.info "Couldn't load metadata!"
  end

  if not title then
    show_error "This song has no title metadata"
    return false
  end

  if not artist then
    show_error "This song has no artist metadata"
    return false
  end

  print(title)
  print(artist)
  print(album)

  return title, artist, album
end

local function save_lyrics(lyrics)
  if lyrics == "" or #lyrics < 100 then
    show_error "Lyrics not found"
    return
  end

  local current_sub_path = mp.get_property "current-tracks/sub/external-filename"

  if current_sub_path and lyrics:find "^%[" == nil then
    show_error "Only lyrics without timestamps are available, so the existing LRC file won't be overwritten"
    return
  end

  -- NetEase's LRCs can have 3-digit milliseconds, which messes up the sub's timings in mpv.
  lyrics = lyrics:gsub("(%.%d%d)%d]", "%1]")
  lyrics = lyrics:gsub("’", "'"):gsub("' ", "'"):gsub("\\", "") -- remove strange characters

  local function is_url(s)
    local url_pattern = "^[%w]+://[%w%.%-_]+%.[%a]+[-%w%.%-%_/?&=]*"
    return string.match(s, url_pattern) ~= nil
  end

  local function check_if_windows()
    local a = os.getenv "windir"
    if a ~= nil then
      return true
    else
      return false
    end
  end

  local is_windows = check_if_windows()

  local function create_directory(directory_path)
    local args = { "mkdir", directory_path }
    if is_windows then
      args = { "powershell", "-NoProfile", "-Command", "mkdir", directory_path }
    end
    local res = mp.utils.subprocess { args = args, cancellable = false }
    if res.status ~= 0 then
      mp.msg.error("Failed to create directory: " .. directory_path)
    else
      mp.msg.info("Directory created successfully: " .. directory_path)
    end
  end

  downloading_name = downloading_name:gsub("\\", " "):gsub("/", " ")

  local path = mp.get_property "path"
  local media = downloading_name .. " [" .. mp.get_property "filename/no-ext" .. "]"
  local pattern = '[\\/:*?"<>|]'

  if (is_url(path) and path or nil) and options.load_for_youtube then
    local youtube_ID = ""
    if not downloading_name then
      youtube_ID = " [" .. mp.get_property("filename"):match "[?&]v=([^&]+)" .. "]"
    end
    local filename = string.gsub(media:sub(1, 100):gsub(pattern, ""), "^%s*(.-)%s*$", "%1") .. youtube_ID
    path = mp.command_native { "expand-path", options.lyrics_store .. filename }
  else
    if options.store_lyrics_seperate then
      path = mp.command_native { "expand-path", options.lyrics_store .. media }
    end
  end

  local lrc_path = (path:gsub("?", "") .. ".lrc")
  local dir_path = lrc_path:match "(.+[\\/])"
  if is_windows then
    lrc_path = lrc_path:gsub("/", "\\")
    dir_path = dir_path:gsub("/", "\\")
  end

  if mp.utils.readdir(dir_path) == nil and options.store_lyrics_seperate then
    if not is_windows then
      local subdir_path = mp.utils.split_path(dir_path)
      create_directory(subdir_path) -- required for linux as it cannot create mpv/lrcdownloads/
    end
    create_directory(dir_path)
  end

  local lrc = io.open(lrc_path, "w")
  if lrc == nil then
    show_error("Failed writing to " .. lrc_path)
    return
  end
  lrc:write(lyrics)
  lrc:close()

  if lyrics:find "^%[" then
    mp.command(current_sub_path and "sub-reload" or "rescan-external-files")
    if manual_run then
      mp.osd_message "Lyrics downloaded"
    end
    got_lyrics = true
    without_timestamps = false
  else
    if manual_run then
      mp.osd_message "Lyrics without timestamps downloaded"
    end
    without_timestamps = true
  end
end

local function musixmatch_download()
  local title, artist = get_metadata()

  if not title then
    return
  end

  mp.msg.info "Fetching lyrics (musixmatch)"
  if manual_run then
    mp.osd_message "Fetching lyrics (musixmatch)"
  end

  if artist then
    mp.msg.info("Requesting: " .. title .. " - " .. artist)
  else
    mp.msg.info("Requesting: " .. title)
  end
  local response = curl {
    "curl",
    "--silent",
    "--get",
    "--cookie",
    "x-mxm-token-guid=" .. options.musixmatch_token, -- avoids a redirect
    "https://apic-desktop.musixmatch.com/ws/1.1/macro.subtitles.get",
    "--data",
    "app_id=web-desktop-app-v1.0",
    "--data",
    "usertoken=" .. options.musixmatch_token,
    "--data-urlencode",
    "q_track=" .. title,
    "--data-urlencode",
    "q_artist=" .. artist,
  }

  if not response then
    return
  end

  if response.message.header.status_code == 401 and response.message.header.hint == "renew" then
    show_error "The Musixmatch token has been rate limited - https://github.com/guidocella/mpv-lrc >>> script-opts/lrc.conf explains how to generate a new one."
    return
  end

  if response.message.header.status_code ~= 200 then
    show_error(
      "Request failed with status code "
        .. response.message.header.status_code
        .. ". Hint: "
        .. response.message.header.hint
    )
    return
  end

  local body = response.message.body.macro_calls
  local lyrics = ""
  if body["matcher.track.get"].message.header.status_code == 200 then
    downloading_name = body["matcher.track.get"].message.body.track.track_name
    if body["matcher.track.get"].message.body.track.has_subtitles == 1 then
      lyrics = body["track.subtitles.get"].message.body.subtitle_list[1].subtitle.subtitle_body
    elseif body["matcher.track.get"].message.body.track.has_lyrics == 1 then -- lyrics without timestamps
      lyrics = body["track.lyrics.get"].message.body.lyrics.lyrics_body
    elseif body["matcher.track.get"].message.body.track.instrumental == 1 then
      show_error "This is an instrumental track"
      return
    end
  end

  save_lyrics(lyrics)
end

local function auto_download()
  if old_subtitle_count ~= subtitle_count and options.cache_loading then
    print "Subs previously downloaded - not downloading again"
  else
    got_lyrics = false
    musixmatch_download()
    if not got_lyrics then
      netease_download()
    end
    if without_timestamps then
      mp.osd_message "Lyrics without timestamps downloaded automatically"
    end
  end
end

local function get_subtitle_count()
  local track_list = mp.get_property_native("track-list", {})
  local subtitle_count = 0
  for _, track in ipairs(track_list) do
    if track["type"] == "sub" then
      subtitle_count = subtitle_count + 1
    end
  end
  return subtitle_count
end

local function check_downloaded_subs()
  old_subtitle_count, subtitle_count = get_subtitle_count(), nil

  if old_subtitle_count > 0 then
    print "Subtitles detected - aborting autolyrics.lua"
    return
  end

  if options.cache_loading then
    -- check if already downloaded lyrics exist and were loaded
    local current_sub_path = mp.get_property "current-tracks/sub/external-filename"
    mp.set_property("sub-file-paths", mp.command_native { "expand-path", options.lyrics_store })
    mp.command(current_sub_path and "sub-reload" or "rescan-external-files")
    subtitle_count = get_subtitle_count()
  end

  if options.run_automatically then
    auto_download()
  end
end

mp.add_key_binding("alt+m", "musixmatch-download", function()
  manual_run = true
  auto_download()
end)

mp.add_key_binding("alt+o", "offset-sub", function()
  local sub_path = mp.get_property "current-tracks/sub/external-filename"

  if not sub_path then
    show_error "No external subtitle is loaded"
    return
  end

  mp.set_property("sub-delay", mp.get_property_number "playback-time")
  mp.command "sub-reload"
  mp.osd_message "Subtitles updated"
end)

check_downloaded_subs()
