local alpha = require'alpha'
local dashboard = require'alpha.themes.dashboard'
dashboard.section.header.val = {
    [[                       _           ]],
    [[ _ __   ___  _____   _(_)_ __ ___  ]],
    [[| '_ \ / _ \/ _ \ \ / / | '_ ` _ \ ]],
    [[| | | |  __/ (_) \ V /| | | | | | |]],
    [[|_| |_|\___|\___/ \_/ |_|_| |_| |_|]],
    [[]],
    [[]],
    [[]],
}
dashboard.section.buttons.val = {
    dashboard.button( 'p',   '  Practice',         ':cd ~/code | e A.cpp<CR>' ),
    dashboard.button( 'w',   'ﴬ  VimWiki',          ':VimwikiIndex<CR>' ),
    dashboard.button( 'r',   '  Recent',           ':Telescope oldfiles<CR>' ),
    dashboard.button( 't',   '  Templates',        ':cd ~/lib | Telescope fd<CR>' ),
    dashboard.button( 'c',   '  Config',           ':cd ~/.config/nvim/ | Telescope fd<CR>' ),
    dashboard.button( 'q',   '  Exit',             ':qa<CR>' ),
}
alpha.setup(dashboard.opts)
