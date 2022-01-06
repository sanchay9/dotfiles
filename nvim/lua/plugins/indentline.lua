vim.opt.listchars = {
    eol = "↴",
    tab = "   ",
}

vim.g.indent_blankline_char = "▏"  --'▏', '┊', '|', '¦', '┆'
vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
-- vim.g.indent_blankline_filetype_exclude = { 'help', 'packer', 'markdown', 'txt', 'startify', 'vimwiki' }
vim.g.indent_blankline_bufname_exclude = { 'Input', 'Output' }
