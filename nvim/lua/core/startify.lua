vim.g.startify_session_persistence = 1
vim.g.startify_enable_special = 0
vim.g.startify_commands = {
    { w = { 'ﴬ  VimWiki', 'VimwikiIndex' } },
    { r = { '  Recent', 'Telescope oldfiles' } },
    { t = { '  Templates', 'cd ~/Library | Telescope fd' } },
    { c = { '  Config', 'cd ~/.config/nvim | Telescope fd' } },
}
vim.g.startify_lists = {
    { type = 'sessions', header = {'   異 Continue Working'} },
    { type = 'commands', header = {'     Bookmarks'} },
}
vim.g.startify_custom_header = {
[[                                          _           ]],
[[                    _ __   ___  _____   _(_)_ __ ___  ]],
[[                   | '_ \ / _ \/ _ \ \ / / | '_ ` _ \ ]],
[[                   | | | |  __/ (_) \ V /| | | | | | |]],
[[                   |_| |_|\___|\___/ \_/ |_|_| |_| |_|]],
[[]],
[[]],
[[]],
[[]],
}
vim.cmd[[autocmd User Startified setlocal cursorline]]
