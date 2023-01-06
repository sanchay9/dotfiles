#!/bin/sh

readonly MUSIC_DIR="/mnt/WindowsD/Music"
readonly SONG_PATH="$(mpc --format '%file%' current)"
readonly SONG_DIR="$(dirname "${SONG_PATH}")"
readonly ALBUM_ART="${MUSIC_DIR}/${SONG_DIR}/cover.jpg"

# # if [[ ! -f "${ALBUM_ART}" ]]; then # file doesn't exist
# # 	ALBUM_ART="" # TODO: insert path to generic icon here
# # fi

notify-send -i "${ALBUM_ART}" "Now Playing" "$(mpc --format '%title% - %artist%' current)"

# execute_on_song_change  = notify-send "Now Playing" "$(mpc --format '%title% \n%artist% - %album%' current)"



# music_library="$HOME/Music"

# fallback_image="/usr/share/icons/Papirus/32x32/apps/gnome-music.svg"

# ffmpeg -y -i "$(mpc --format "$music_library"/%file% | head -n 1)" /tmp/mpd_cover.jpg > /dev/null 2>&1

# if [[ $(mpc | awk 'FNR==2 {print $1}') = "[playing]" ]] || [[ $(mpc | awk 'FNR==2 {print $1}') = "[paused]" ]]
# then
#     exit 0
# fi

# notify-send -i /tmp/mpd_cover.jpg "Now Playing:" "$(mpc current)" || \

# notify-send -i $fallback_image "Now Playing:" "$(mpc current)"

# To avoid having to do this with ncmpcpp, mpc has a subcommand called mpc idle which prints a line whenever there's an mpd event. So you can do something like this:

# while true; do
#     mpc idle player # command will hang until a player event (pause, next, etc)
#     notify-send stuff
# done
# Since `mpc idle` hangs, the script is actually pretty light, and I have mine on all the time.
# before sending the notification, you can parse the mpc output and check whether it is [playing] or [paused] using awk/cut/sed or any other utility

# edit:

# mpc | awk 'FNR==2 {print $1}'
# does what you want so you can use a case statement to check against that
