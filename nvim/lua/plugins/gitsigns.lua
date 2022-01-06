local present, gitsigns = pcall(require, "gitsigns")
if not present then
    return
end

gitsigns.setup {
    signs = {
        add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
        change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
        delete = { hl = "DiffDelete", text = "_", numhl = "GitSignsDeleteNr" },
        topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
        changedelete = { hl = "DiffChange", text = "~", numhl = "GitSignsChangeNr" }
    },
    numhl = false,
    linehl = false,
    keymaps = {
        -- Default keymap options
        noremap = true,
        buffer = true,
    },
    watch_gitdir = {
        interval = 500
    },
    sign_priority = 6,
    update_debounce = 200,
    status_formatter = nil, -- Use default
}
