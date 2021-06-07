--                                            .__       .__  __     .__
--                                            |__| ____ |__|/  |_   |  |  __ _______
--                                            |  |/    \|  \   __\  |  | |  |  \__  \
--                                            |  |   |  \  ||  |    |  |_|  |  // __ \_
--                                            |__|___|  /__||__| /\ |____/____/(____  /
--                                                    \/         \/                 \/


----------------------------------------------------------------------------------------------------------------------------------

---- map leader to space
vim.g.mapleader = ' '


---------------------------------------------------------- HELPERS ---------------------------------------------------------------

local execute = vim.api.nvim_command

---- include files
require('options')
require('mappings')
require('colorschemes')

---- Packer.nvim setup
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- auto compile when there are changes in plugins.lua


-------------------------------------------------------- PLUGINS SETUP -----------------------------------------------------------

---- ultisnips
vim.g.UltiSnipsExpandTrigger = '<tab>'
vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
vim.g.UltiSnipsEditSplit = 'vertical'

---- autopairs
vim.g.AutoPairsMultilineClose = 0


---- vimwiki
vim.g.vimwiki_list = { { path = '~/Documents/vimwiki', syntax = 'markdown', ext = '.md' } }

---- indent-blankline
-- vim.g.indent_blankline_char = '┊'   --'▏', '┊', '|', '¦', '┆', '▏'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer', 'markdown', 'txt', 'startify' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile'}

---- floaterm
vim.g.floaterm_borderchars = '─│─│╭╮╯╰' -- '─│─│┌┐┘└'
vim.g.floaterm_title = ''
vim.g.floaterm_autoinsert = 1
vim.g.floaterm_width = 0.7
vim.g.floaterm_height = 0.5


---- lightline
vim.g.lightline = {
    colorscheme = 'gruvbox';
    enable = { tabline = 0 };
    active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } };
    active = { right = { { 'percent', 'lineinfo' } } };
    component_function = { gitbranch = 'fugitive#head', };
}

---- startify
vim.g.startify_session_persistence = 1
vim.g.startify_enable_special = 0
vim.g.startify_bookmarks = {
    'D:/Sanchay/Study/CP/.lib',
    'main.ahk',
    { i = '$MYVIMRC' },
    { w = '~/Documents/vimwiki/Index.md' };
    { m = '~/AppData/Local/nvim/lua/mappings.lua' },
    { p = '~/AppData/Local/nvim/lua/plugins.lua' },
    { o = '~/AppData/Local/nvim/lua/options.lua' },
    { c = '~/AppData/Local/nvim/lua/colorschemes.lua' },
    { t = '~/Documents/WindowsPowerShell/profile.ps1' }
}
vim.g.startify_lists = {
    { type = 'sessions', header = {'    Sessions'} },
    { type = 'bookmarks', header = {'    Bookmarks'} },
    { type = 'commands', header = {' Commands'} }
}
vim.g.startify_custom_header = {
[[  ┌───────────────────────────────────────────────────────────────────────────┐]],
[[  │ ██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗  █████╗ ██████╗ ██████╗  │]],
[[  │ ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔═══██╗██╔══██╗██╔══██╗██╔══██╗ │]],
[[  │ ██║  ██║███████║███████╗███████║██████╔╝██║   ██║███████║██████╔╝██║  ██║ │]],
[[  │ ██║  ██║██╔══██║╚════██║██╔══██║██╔══██╗██║   ██║██╔══██║██╔══██╗██║  ██║ │]],
[[  │ ██████╔╝██║  ██║███████║██║  ██║██████╔╝╚██████╔╝██║  ██║██║  ██║██████╔╝ │]],
[[  │ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝  │]],
[[  └───────────────────────────────────────────────────────────────────────────┘]]
}
vim.cmd([[autocmd User Startified setlocal cursorline]])

---- cpp enhanced highlight
vim.g.c_no_curly_error = 1

---- telescope
require('telescope').setup { defaults = {
        scroll_strategy = 'cycle',
        prompt_position = 'top',
        layout_defaults = {
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


----------------------------------------------------------- OTHERS ---------------------------------------------------------------

vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])                        -- remove trailing whitespaces
-- vim.cmd([[autocmd BufWritePre * %s/\n\+\%$//e]])                      -- remove trailing nl
vim.cmd([[autocmd FocusGained * :checktime]])                         -- reload files on focus gains

---- abbreviations
vim.cmd[[iabbrev itn int]]

-- highlight on yank
vim.api.nvim_exec([[
    augroup YankHighlight
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank()
    augroup end
]], false)
