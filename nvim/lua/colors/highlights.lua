-- Define fg color
local function fg(group, color)
    vim.cmd("hi! " .. group .. " guifg=" .. color)
end

-- Define bg color
local function bg(group, color)
    vim.cmd("hi! " .. group .. " guibg=" .. color)
end

-- Define bg and fg color
local function fbg(group, fgcol, bgcol)
    vim.cmd("hi! " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

local colors = require'colors'.get()

local black = colors.black
local black2 = colors.black2
local blue = colors.blue
local darker_black = colors.darker_black
local folder_bg = colors.folder_bg
local green = colors.green
local grey = colors.grey
local grey_fg = colors.grey_fg
local line = colors.line
local nord_blue = colors.nord_blue
local one_bg = colors.one_bg
local one_bg2 = colors.one_bg2
local pmenu_bg = colors.pmenu_bg
local purple = colors.purple
local red = colors.red
local white = colors.white
local yellow = colors.yellow
local one_bg3 = colors.one_bg3

-- fg("CopilotSuggestion", "#555555")

bg("Folded", black)
fg("cursorlinenr", white)

-- same it bg, so it doesn't appear
fg("EndOfBuffer", black)

-- For floating windows
fg("FloatBorder", blue)
bg("NormalFloat", one_bg)

-- Pmenu
bg("Pmenu", one_bg)
bg("PmenuSbar", one_bg2)
bg("PmenuSel", pmenu_bg)
bg("PmenuThumb", nord_blue)
fg("CmpItemAbbr", white)
fg("CmpItemAbbrMatch", white)
fg("CmpItemKind", white)
fg("CmpItemMenu", white)

-- inactive statuslines as thin lines
fg("StatusLineNC", one_bg3 .. " gui=underline")

fg("LineNr", grey)
fg("NvimInternalError", red)
fg("VertSplit", one_bg2)

-- Alpha
math.randomseed(os.time())
local function random_colours(colours)
   return colours[math.random(1, #colours)]
end

local colours = { colors.red, colors.green, colors.yellow, colors.blue, colors.magenta, colors.cyan }
vim.cmd(string.format('highlight AlphaHeader guifg=%s guibg=bg', random_colours(colours)))

-- Floaterm
bg("FloatermNC", red)
bg("Floaterm", darker_black)
fbg("FloatermBorder", "none", "none")

-- Git signs
fbg("DiffAdd", nord_blue, "none")
fbg("DiffChange", grey_fg, "none")
fbg("DiffModified", nord_blue, "none")

-- Indent blankline plugin
fg("IndentBlanklineChar", line)

-- Errors
fg("DiagnosticError", red)
fg("DiagnosticWarn", yellow)
fg("DiagnosticFloatingError", red)
fg("DiagnosticFloatingWarn", yellow)
fg("DiagnosticVirtualTextError", red)
fg("DiagnosticVirtualTextWarn", yellow)

-- Info
fg("DiagnosticInfo", green)
fg("DiagnosticVirtualTextInfo", green)
fg("DiagnosticFloatingInfo", green)

-- Hints
fg("DiagnosticHint", purple)
fg("DiagnosticVirtualTextHint", purple)
fg("DiagnosticFloatingHint", purple)

-- NvimTree
fg("NvimTreeEmptyFolderName", blue)
fg("NvimTreeEndOfBuffer", darker_black)
fg("NvimTreeFolderIcon", folder_bg)
fg("NvimTreeFolderName", folder_bg)
fg("NvimTreeGitDirty", red)
fg("NvimTreeIndentMarker", one_bg2)
bg("NvimTreeNormal", darker_black)
bg("NvimTreeNormalNC", darker_black)
fg("NvimTreeOpenedFolderName", blue)
fg("NvimTreeRootFolder", red .. " gui=underline") -- enable underline for root folder in nvim tree
fbg("NvimTreeStatuslineNc", darker_black, darker_black)
fg("NvimTreeVertSplit", darker_black)
bg("NvimTreeVertSplit", darker_black)
fbg("NvimTreeWindowPicker", red, black2)

-- Telescope
fg("TelescopeBorder", one_bg)
fbg("TelescopePreviewTitle", green, one_bg)
fbg("TelescopePromptTitle", blue, one_bg)
fbg("TelescopeResultsTitle", red, one_bg)
fbg("TelescopeSelection", "#00A1F1", "none")
fbg("TelescopeSelectionCaret", "white", "none")
