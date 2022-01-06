local present, lualine = pcall(require, "lualine")
if not present then
    return
end

local colors = require("colors").get()

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand '%:t') ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 70
    end,
}

local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
        }
    end
end

local config = {
    options = {
        theme = {
            normal = { c = { fg = colors.fg, bg = colors.statusline_bg } },
            inactive = { c = 'StatusLineNC' },
        },
        icons_enabled = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "dashboard", "NvimTree", "Outline", "alpha", "help", "man", "terminal", "minimap" },
    },
    sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
}

local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

ins_left {
    function()
        local mode_color = {
            n = colors.blue,
            i = colors.green,
            v = colors.yellow,
            [''] = colors.yellow,
            V = colors.yellow,
            c = colors.red,
            no = colors.blue,
            s = colors.orange,
            S = colors.orange,
            [''] = colors.orange,
            ic = colors.yellow,
            R = colors.red,
            Rv = colors.red,
            cv = colors.blue,
            ce = colors.blue,
            r = colors.cyan,
            rm = colors.cyan,
            ['r?'] = colors.cyan,
            ['!'] = colors.blue,
            t = colors.blue,
        }
        vim.api.nvim_command('hi! LualineMode guifg=' .. mode_color[vim.fn.mode()] .. ' guibg=' .. colors.black)
        return '█'
    end,
    color = 'LualineMode',
    padding = { left = 0, right = 0 },
}

ins_left {
    function()
        local extension = vim.fn.expand('%:e')
        local icon = require("nvim-web-devicons").get_icon(extension)
        if icon == nil then
            return ""
        end
        return " " .. icon
    end,
    color = { fg = colors.white, bg = colors.lightbg },
}


ins_left {
    function()
        local filename = vim.fn.expand('%:t')
        if vim.fn.empty(filename) == 1 then return '' end
        if vim.bo.modifiable then
            if vim.bo.modified then
                return filename .. ' '
            end
        end
        return filename .. '  '
    end,
    padding = { right = 1 },
    color = { fg = colors.white, bg = colors.lightbg },
}

ins_left {
    function()
        local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
        return " " .. " " .. dir_name .. " "
    end,
    cond = conditions.hide_in_width,
    color = { fg = colors.grey_fg2, bg = colors.lightbg2, },
}

ins_left {
    "branch",
    icon = " ",
    color = { fg = colors.grey_fg2 },
    cond = conditions.hide_in_width,
}

ins_left {
    "diff",
    source = diff_source,
    symbols = { added = "  ", modified = "柳", removed = " " },
    diff_color = {
        added = { fg = colors.grey_fg2 },
        modified = { fg = colors.grey_fg2 },
        removed = { fg = colors.grey_fg2 },
    },
}

ins_right {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", info = " ", hint = " " },
    diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.green },
        color_hint = { fg = colors.grey_fg2 },
    },
}

-- ins_right {
--     function()
--         if next(vim.treesitter.highlighter.active) ~= nil then
--             return "  "
--         end
--         return ""
--     end,
--     color = { fg = colors.green },
--     cond = conditions.hide_in_width,
-- }

-- ins_right {
--     function()
--         local msg = 'No Active Lsp'
--         local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
--         local clients = vim.lsp.get_active_clients()
--         if next(clients) == nil then
--             return msg
--         end
--         for _, client in ipairs(clients) do
--             local filetypes = client.config.filetypes
--             if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
--                 return client.name
--             end
--         end
--         return msg
--     end,
--     icon = ' LSP:',
--     color = { fg = colors.grey_fg2 },
-- }

ins_right {
    function()
        local current_line = vim.fn.line "."
        local total_line = vim.fn.line "$"

        if current_line == 1 then
            return "Top"
        elseif current_line == vim.fn.line "$" then
            return "Bot"
        end
        local result, _ = math.modf((current_line / total_line) * 100)
        return result .. "%%"
    end,
    icon = '',
    color = { fg = colors.green, bg = colors.one_bg, },
}

-- ins_right {
--     'o:encoding',
--     fmt = string.upper,
--     cond = conditions.hide_in_width,
--     color = { fg = colors.green },
-- }

-- ins_right {
--     -- "filetype",
--     "fileformat",
--     color = { fg = colors.green },
-- }

-- ins_right {
--     function()
--         local current_line = vim.fn.line "."
--         local total_lines = vim.fn.line "$"
--         -- local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
--         local chars = { "█", "▇", "▆", "▅", "▄", "▃", "▂", "▁" }
--         local line_ratio = current_line / total_lines
--         local index = math.ceil(line_ratio * #chars)
--         return chars[index]
--     end,
--     padding = { left = 0, right = 0 },
--     color = { fg = colors.grey_bg2, bg = colors.one_bg, },
-- }

lualine.setup(config)
