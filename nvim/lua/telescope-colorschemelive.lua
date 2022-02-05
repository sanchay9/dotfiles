local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local sorters = require "telescope.sorters"

local function enter(prompt_bufnr)
    local selection = action_state.get_selected_entry()

    local file = vim.fn.expand("~/.config/nvim/lua/colors/init.lua")
    local new = "vim.g.curr_theme = \"" .. selection[1] .. "\""
    local job_cmd = "sed -i '1d' " .. file .. " && sed -i '1s/^/" .. new .. "\\n/' " .. file
    vim.fn.jobstart(job_cmd)

    vim.g.curr_theme = selection[1]
    require"colors".init(selection[1])

    package.loaded["plugins.bufferline"] = nil
    require"plugins.bufferline"
    package.loaded["plugins.statusline"] = nil
    require"plugins.statusline"

    -- change kitty theme
    file = vim.fn.expand("~/.config/kitty/kitty.conf")
    new = "include ./themes/" .. selection[1] .. ".conf"
    job_cmd = "sed -i '$d' " .. file .. "; echo " .. new .. " >> " .. file
    vim.fn.jobstart(job_cmd)
    job_cmd = "xdotool key ctrl+shift+F5"
    vim.fn.jobstart(job_cmd)

    actions.close(prompt_bufnr)
    if vim.bo.filetype == "alpha" then
        vim.cmd"set showtabline=0"
    end
end

local function next_color(prompt_bufnr)
    actions.move_selection_next(prompt_bufnr)
    local selection = action_state.get_selected_entry()

    require"colors".init(selection[1])
    package.loaded["plugins.bufferline"] = nil
    require"plugins.bufferline"
    package.loaded["plugins.statusline"] = nil
    require"plugins.statusline"
end

local function prev_color(prompt_bufnr)
    actions.move_selection_previous(prompt_bufnr)
    local selection = action_state.get_selected_entry()

    require"colors".init(selection[1])
    package.loaded["plugins.bufferline"] = nil
    require"plugins.bufferline"
    package.loaded["plugins.statusline"] = nil
    require"plugins.statusline"
end

local list_themes = function(return_type)
   local themes = {}
   -- folder where theme files are stored
   local themes_folder = vim.fn.stdpath "data" .. "/site/pack/packer/opt/nvim-base16.lua/lua/hl_themes"
   -- list all the contents of the folder and filter out files with .lua extension, then append to themes table
   local fd = vim.loop.fs_scandir(themes_folder)
   if fd then
      while true do
         local name, typ = vim.loop.fs_scandir_next(fd)
         if name == nil then
            break
         end
         if typ ~= "directory" and string.find(name, ".lua$") then
            -- return the table values as keys if specified
            if return_type == "keys_as_value" then
               themes[vim.fn.fnamemodify(name, ":r")] = true
            else
               table.insert(themes, vim.fn.fnamemodify(name, ":r"))
            end
         end
      end
   end
   return themes
end

-- local picker = pickers.new(require"telescope.themes".get_dropdown(), {
local picker = pickers.new({
    prompt_title = "Themes",
    prompt_prefix = "    ",
    -- selection_caret = "  ",
    selection_caret = " ↪ ",
    -- layout_strategy = "vertical",
    -- layout_config = {
    --     height = 0.9,
    --     width = 0.9,
    -- },
    finder = finders.new_table(list_themes()),
    sorter = sorters.get_generic_fuzzy_sorter({}),

    attach_mappings = function(prompt_bufnr, map)
        map("i", "<CR>", enter)
        map("i", "<C-n>", next_color)
        map("i", "<C-p>", prev_color)

        map("n", "<CR>", enter)
        map("n", "j", next_color)
        map("n", "k", prev_color)

        return true
    end,
})

picker:find()
