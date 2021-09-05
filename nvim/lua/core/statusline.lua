local present1, gl = pcall(require, "galaxyline")
local present2, condition = pcall(require, "galaxyline.condition")
if not (present1 or present2) then
    return
end

local gls = gl.section
gl.short_line_list = { "NvimTree", "vista", "dbui", "packer" }

local colors = {
    -- alt_bg = "#202328",
    -- alt_bg = "#2a2f38",
    grey = "#858585",
    white = "#D8DEE9",
    blue = "#569CD6",
    green = "#608B4E",
    yellow = "#DCDCAA",
    orange = "#FF8800",
    purple = "#C586C0",
    magenta = "#D16D9E",
    cyan = "#4EC9B0",
    red = "#D16969",
    error_red = "#F44747",
    warning_orange = "#FF8800",
    info_yellow = "#FFCC66",
    hint_blue = "#9CDCFE"
}

table.insert(gls.left, {
    ViMode = {
        provider = function()
            local mode_color = {
                n = colors.blue,
                i = colors.green,
                v = colors.yellow,
                [""] = colors.yellow,
                V = colors.yellow,
                c = colors.red,
                no = colors.blue,
                s = colors.orange,
                S = colors.orange,
                [""] = colors.orange,
                ic = colors.yellow,
                R = colors.red,
                Rv = colors.red,
                cv = colors.blue,
                ce = colors.blue,
                r = colors.cyan,
                rm = colors.cyan,
                ["r?"] = colors.cyan,
                ["!"] = colors.blue,
                t = colors.blue,
            }
            vim.api.nvim_command(
                "hi GalaxyViMode guifg = " .. mode_color[vim.fn.mode()])
            return "▊"
        end,
        separator = "   ",
        separator_highlight = { "NONE", colors.alt_bg },
        highlight = { "NONE", colors.alt_bg },
        left_padding = 0
    },
})

table.insert(gls.left, {
    FileIcon = {
        provider = "FileIcon",
        condition = condition.buffer_not_empty,
        separator_highlight = { "NONE", colors.alt_bg },
        highlight = { colors.white, colors.alt_bg }
    },
})

table.insert(gls.left, {
    FileName = {
        provider = "FileName",
        condition = condition.buffer_not_empty,
        separator = "  ",
        separator_highlight = { "NONE", colors.alt_bg },
        highlight = { colors.white, colors.alt_bg }
    },
})

-- table.insert(gls.left, {
--     OpenBrace = {
--         provider = function()
--             return "("
--         end,
--         condition = condition.check_git_workspace,
--         separator_highlight = { "NONE", colors.alt_bg },
--         highlight = { colors.grey, colors.alt_bg },
--     },
-- })

table.insert(gls.left, {
    GitIcon = {
        provider = function()
            return ""
        end,
        condition = condition.check_git_workspace,
        separator = " ",
        separator_highlight = { "NONE", colors.alt_bg },
        highlight = { colors.orange, colors.alt_bg },
    },
})

table.insert(gls.left, {
    GitBranch = {
        provider = "GitBranch",
        condition = condition.check_git_workspace,
        separator = " ",
        separator_highlight = { "NONE", colors.alt_bg },
        highlight = { colors.cyan, colors.alt_bg },
    },
})

-- table.insert(gls.left, {
--     CloseBrace = {
--         provider = function()
--             return ")"
--         end,
--         condition = condition.check_git_workspace,
--         separator = " ",
--         separator_highlight = { "NONE", colors.alt_bg },
--         highlight = { colors.grey, colors.alt_bg },
--     },
-- })

table.insert(gls.left, {
    DiffAdd = {
        provider = "DiffAdd",
        icon = "  ",
        highlight = { colors.green, colors.alt_bg },
    },
})

table.insert(gls.left, {
    DiffModified = {
        provider = "DiffModified",
        icon = " 柳",
        highlight = { colors.orange, colors.alt_bg },
    },
})

table.insert(gls.left, {
    DiffRemove = {
        provider = "DiffRemove",
        icon = "  ",
        highlight = { colors.red, colors.alt_bg },
    },
})

-- table.insert(gls.mid, {
--     ShowLspClient = {
--         provider = 'GetLspClient',
--         condition = function ()
--             local tbl = {['dashboard'] = true,['']=true}
--             if tbl[vim.bo.filetype] then
--                 return false
--             end
--             return true
--         end,
--         icon = ' LSP:',
--         highlight = {colors.yellow,colors.bg,'bold'}
--     },
-- })

table.insert(gls.right, {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "  ",
        highlight = { colors.red, colors.alt_bg },
    },
})

table.insert(gls.right, {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = "  ",
        highlight = { colors.orange, colors.alt_bg },
    },
})

table.insert(gls.right, {
    DiagnosticInfo = {
        provider = "DiagnosticInfo",
        icon = "  ",
        highlight = { colors.yellow, colors.alt_bg },
    },
})

table.insert(gls.right, {
    DiagnosticHint = {
        provider = "DiagnosticHint",
        icon = "  ",
        highlight = { colors.blue, colors.alt_bg },
    },
})

-- table.insert(gls.right, {
--     TreesitterIcon = {
--         provider = function()
--             if next(vim.treesitter.highlighter.active) ~= nil then
--                 return "  "
--             end
--             return ""
--         end,
--         separator = " ",
--         separator_highlight = { "NONE", colors.alt_bg },
--         highlight = { colors.green, colors.alt_bg },
--     },
-- })
table.insert(gls.right, {
    percenticon = {
      provider = function() end,
      separator = " ",
      separator_highlight = { colors.grey, colors.alt_bg },
   },
})

table.insert(gls.right, {
    PerCent = {
        provider = "LinePercent",
        highlight = { colors.grey, colors.alt_bg },
    },
})

-- table.insert(gls.right, {
--     LineInfo = {
--         provider = "LineColumn",
--         separator = " ",
--         separator_highlight = { "NONE", colors.alt_bg },
--         highlight = { colors.grey, colors.alt_bg, 'bold' },
--     },
-- })

table.insert(gls.short_line_left, {
    SFileName = {
        provider = "SFileName",
        condition = condition.buffer_not_empty,
        highlight = { colors.grey, colors.alt_bg },
    },
})
