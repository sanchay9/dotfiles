--      .__       .__  __     .__
--      |__| ____ |__|/  |_   |  |  __ _______
--      |  |/    \|  \   __\  |  | |  |  \__  \
--      |  |   |  \  ||  |    |  |_|  |  // __ \_
--      |__|___|  /__||__| /\ |____/____/(____  /
--              \/         \/                 \/


----------------------------------------------------------------------------------------------------------------------------------

---- map leader to space
vim.g.mapleader = ' '


---------------------------------------------------------- HELPERS ---------------------------------------------------------------

local execute = vim.api.nvim_command

---- include files
require('options')
require('mappings')
require('colorschemes')
require('statusline')
require('autopair')
require('lspcpp')
require('gitsig')

vim.cmd[[packadd packer.nvim]]


-------------------------------------------------------- PLUGINS SETUP -----------------------------------------------------------

---- ultisnips
vim.g.UltiSnipsExpandTrigger = '<tab>'
vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
vim.g.UltiSnipsEditSplit = 'vertical'

---- vimwiki
vim.g.vimwiki_list = { { path = '~/Documents/vimwiki', syntax = 'markdown', ext = '.md' } }

---- floaterm
vim.g.floaterm_borderchars = '─│─│╭╮╯╰' -- '─│─│┌┐┘└'
vim.g.floaterm_title = ''
vim.g.floaterm_autoinsert = 1
vim.g.floaterm_width = 0.7
vim.g.floaterm_height = 0.5

---- startify
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
[[                                            _           ]],
[[                      _ __   ___  _____   _(_)_ __ ___  ]],
[[                     | '_ \ / _ \/ _ \ \ / / | '_ ` _ \ ]],
[[                     | | | |  __/ (_) \ V /| | | | | | |]],
[[                     |_| |_|\___|\___/ \_/ |_|_| |_| |_|]],
[[]],
[[]],
}
vim.cmd[[autocmd User Startified setlocal cursorline]]

---- telescope
require('telescope').setup { defaults = {
        scroll_strategy = 'cycle',
        layout_config = {
            horizontal = {
                mirror = false,
                preview_width = 0.5,
            },
            vertical = {
                mirror = false,
            },
        },
    }
}

---- treesitter
require 'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = {
        enable = true,
    },
}

----------------------------------------------------------- OTHERS ---------------------------------------------------------------

vim.cmd[[autocmd BufWritePre * %s/\s\+$//e]]                        -- remove trailing whitespaces
-- vim.cmd[[autocmd BufWritePre * %s/\n\+\%$//e]]                      -- remove trailing nl
vim.cmd[[autocmd FocusGained * checktime]]                         -- reload files on focus gains
-- vim.cmd[[autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"]]

---- remember last position
vim.cmd[[autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'| exe "normal! g`\""| endif]]

---- abbreviations
vim.cmd[[iabbrev itn int]]
vim.cmd[[iabbrev icn cin]]

-- highlight on yank
vim.api.nvim_exec([[
    augroup YankHighlight
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank()
    augroup end
]], false)
