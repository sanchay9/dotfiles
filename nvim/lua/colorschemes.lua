-- custom highlights
vim.api.nvim_exec([[
    augroup customHighlight
        autocmd!
        autocmd ColorScheme * hi! FloatermBorder guibg=none guifg=none
        autocmd ColorScheme * hi! FloatermNC guibg=#E06C75
        autocmd ColorScheme * hi! Folded guibg=bg
        autocmd ColorScheme * hi! EndOfBuffer guibg=bg guifg=bg
    augroup end
]], false)

vim.g.sonokai_style = 'atlantis'
-- default, atlantis, andromeda, shusia, maia, espresso

vim.g.material_style = 'oceanic'
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
vim.cmd 'colorscheme catppuccino'
