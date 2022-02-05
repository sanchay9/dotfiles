vim.g.curr_theme = "onedark"

local M = {}

M.init = function(theme)
    if not theme then
        theme = vim.g.curr_theme
    end

    local present, base16 = pcall(require, "base16")

    vim.g.curr_theme = theme

    if present then
        -- first load the base16 theme
        base16(base16.themes(theme), true)

        -- unload to force reload
        package.loaded["colors.highlights" or false] = nil
        -- then load the highlights
        require "colors.highlights"
    else
        return false
    end
end

M.get = function(theme)
    if not theme then
        theme = vim.g.curr_theme
    end

    return require("hl_themes." .. theme)
end

return M
