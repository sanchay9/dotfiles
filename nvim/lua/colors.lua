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


-----------------------------------------------------------------------------------------------

-- default, atlantis, andromeda, shusia, maia, espresso
vim.g.sonokai_style = 'atlantis'

vim.g.gruvbox_material_background = 'hard'

require("catppuccino").setup( {
    colorscheme = "dark_catppuccino",
    transparency = false,
    styles = {
        comments = "italic",
        functions = "NONE",
        keywords = "italic",
        strings = "NONE",
        variables = "NONE",
    },
    integrations = {
        treesitter = true,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = "italic",
                hints = "italic",
                warnings = "italic",
                information = "italic",
            },
            underlines = {
                errors = "underline",
                hints = "underline",
                warnings = "underline",
                information = "underline",
            }
        },
        gitsigns = true,
        nvimtree = {
            enabled = true,
            show_root = true,
        },
        telescope = true,
        indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
        },
    }
})

-- -- darker lighter oceanic palenight deep ocean
vim.g.material_style = 'oceanic'
require('material').setup({
	contrast = true, -- Enable contrast for sidebars, floating windows and popup menus like Nvim-Tree
	borders = true, -- Enable borders between verticaly split windows
	italics = {
        comments = true, -- Enable italic comments
		keywords = false, -- Enable italic keywords
		functions = false, -- Enable italic functions
		strings = false, -- Enable italic strings
		variables = false -- Enable italic variables
	},
	contrast_windows = { -- Specify which windows get the contrasted (darker) background
		"qf" -- Darker qf list background
	},
	text_contrast = {
		lighter = false, -- Enable higher contrast text for lighter style
		darker = false -- Enable higher contrast text for darker style
	},
	disable = {
		background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
		term_colors = false, -- Prevent the theme from setting terminal colors
		eob_lines = false -- Hide the end-of-buffer lines
	}
})

---- set colorscheme (order is important)
vim.cmd 'colorscheme catppuccino'


---- highlights

fbg("FloatermBorder", "none", "none")
bg("FloatermNC", "#E06C75")

bg("Folded", "bg")
fbg("EndOfBuffer", "bg", "bg")

fbg("TabLineSel", "#D8DEE9", "bg")
fbg("TabLineSeparatorActive", "#61AFEF", "bg")
-- bg("TabLineFill", "#192227")
bg("TabLineFill", "#141F25")
fbg("TabLineCloseActive", "#D8DEE9", "bg")
fbg("TabLineModifiedSeparatorActive", "#E06C75", "bg")




-- TabLine
-- TabLineSel
-- TabLineFill
-- TabLineSeparatorActive
-- TabLineSeparatorInactive
-- TabLineModifiedSeparatorActive
-- TabLineModifiedSeparatorInactive
-- TabLinePaddingActive
-- TabLinePaddingInactive
-- TabLineModifiedActive
-- TabLineModifiedInactive
-- TabLineCloseActive
-- TabLineCloseInactive


-- yellow = "#e7c787",
