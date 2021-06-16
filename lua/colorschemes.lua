-- custom highlights
vim.api.nvim_exec([[
    augroup customHighlight
        autocmd!
        autocmd ColorScheme * hi! FloatermBorder guibg=none guifg=none
        autocmd ColorScheme * hi! FloatermNC guibg=#E06C75
        autocmd ColorScheme * hi! CursorLineNr guibg=none
        autocmd ColorScheme * hi! Folded guibg=bg
        autocmd ColorScheme * hi! EndOfBuffer guibg=bg guifg=bg
    augroup end
]], false)

---- gruvbox
vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_bold = false

---- dracula
vim.g.dracula_italic = false

---- onedark
vim.g.onedark_hide_endofbuffer = true

---- set colorscheme (order is important)
vim.cmd 'colorscheme PaperColor'
