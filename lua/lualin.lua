local colors = {
    bg = '#202328',
    fg = '#bbc2cf',
    yellow = '#ECBE7B',
    cyan = '#008080',
    darkblue = '#081633',
    green = '#98be65',
    orange = '#FF8800',
    violet = '#a9a1e1',
    magenta = '#c678dd',
    blue = '#51afef',
    red = '#ec5f67'
}

local function timee()
    return os.date('%H:%M')
end

local function tsicon()
    if next(vim.treesitter.highlighter.active) ~= nil then
        return ' '
    end
end

require'lualine'.setup {

    options = {
        icons_enabled = true,
        theme = 'PaperColor',
        component_separators = { '', '' },      --  
        section_separators = { '', '' },      --   
        disabled_filetypes = { 'startify' }
    },

    sections = {
        lualine_a = { 'mode' },
        lualine_b = { { 'branch', icon = "" } },
        lualine_c = { 'filename' },

        lualine_x = { { tsicon, color = { fg = colors.green } }, 'progress' },
        lualine_y = { timee },
        lualine_z = {  }
    },

    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', file_status = false } } ,

        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },

    tabline = {},
    extensions = {}
}
