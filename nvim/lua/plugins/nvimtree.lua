local present, nvimtree = pcall(require, "nvim-tree")
if not present then
    return
end

vim.g.nvim_tree_add_trailing = 0 -- append a trailing slash to folder names
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 0
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_quit_on_open = 0 -- closes tree when file's opened
vim.g.nvim_tree_root_folder_modifier = table.concat { ":t:gs? $?/..", string.rep(" ", 1000), "?:gs?^??" }
vim.g.nvim_tree_window_picker_exclude = {
    filetype = { "notify", "packer", "qf" },
    buftype = { "terminal" },
}
vim.g.nvim_tree_show_icons = {
   folders = 1,
   files = 1,
   git = 1,
}
vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
        deleted = "",
        ignored = "◌",
        renamed = "➜",
        staged = "✓",
        unmerged = "",
        unstaged = "✗",
        untracked = "★",
    },
    folder = {
        -- arrow_open = "",
        -- arrow_closed = "",
        -- default = "",
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = "",
    },
}

nvimtree.setup {
    disable_netrw       = true,
    hijack_netrw        = true,
    open_on_setup       = false,
    ignore_ft_on_setup  = { "alpha" },
    auto_close          = false,
    open_on_tab         = false,
    update_cwd          = true,
    update_focused_file = {
        enable      = false,
        update_cwd  = false,
        ignore_list = {}
    },
    view = {
        allow_resize = false,
        side = 'left',
        width = 22,
        hide_root_folder = true,
    },
    git = {
        enable = false,
        ignore = false,
    },
}
