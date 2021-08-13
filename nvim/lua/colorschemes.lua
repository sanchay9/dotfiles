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

vim.g.material_style = 'darker'
vim.g.material_contrast = 1
vim.g.material_italic_comments = true

vim.g.gruvbox_material_background = 'hard'

---- set colorscheme (order is important)
vim.cmd 'colorscheme sonokai'
