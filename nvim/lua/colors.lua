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


vim.g.sonokai_style = 'atlantis'
-- default, atlantis, andromeda, shusia, maia, espresso

vim.g.material_style = 'oceanic'
-- darker lighter oceanic palenight deep ocean
vim.g.material_contrast = 1
vim.g.material_italic_comments = true
vim.g.material_borders = true

local catppuccino = require("catppuccino")

-- configure it
catppuccino.setup(
    {
		colorscheme = "catppuccino",
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
				styles = {
					errors = "italic",
					hints = "italic",
					warnings = "italic",
					information = "italic"
				}
			},
			gitsigns = true,
            nvimtree = {
                enabled = true,
                show_root = true,
            },
			telescope = true,
			indent_blankline = true,
		}
	}
)

vim.g.gruvbox_material_background = 'hard'

---- set colorscheme (order is important)
vim.cmd 'colorscheme dark_catppuccino'



---- highlights

fbg("FloatermBorder", "none", "none")
bg("FloatermNC", "#E06C75")

bg("Folded", "bg")
fbg("EndOfBuffer", "bg", "bg")

fbg("TabLineSel", "#D8DEE9", "bg")
fbg("TabLineSeparatorActive", "#61AFEF", "bg")
bg("TabLineFill", "black")
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
