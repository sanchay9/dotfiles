vim.opt.listchars = {
    eol = "↴",
    tab = "   ",
}

require("indent_blankline").setup {
    -- enabled = false,
    char = "|",  --'▏', '┊', '|', '¦', '┆'
    buftype_exclude = { "terminal", "nofile" },
    filetype_exclude = { 'help', 'packer', 'markdown', 'txt', 'startify', 'alpha' },
    bufname_exclude = { 'Input', 'Output' },
}
