local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= 'o' then scopes['o'][key] = value end
end

---------------------------------------------------------------------------------------------------------------------------------

opt('b', 'ts', 4)                                     -- tabstop
opt('b', 'sts', 4)                                    -- softtabstop
opt('b', 'shiftwidth', 4)                             -- spaces to use for indent
opt('b', 'expandtab', true)                           -- use spaces instead of tabs

opt('w', 'number', true)                              -- line numbers
opt('w', 'wrap', false)                               -- no line wrap
opt('o', 'scrolloff', 7)                              -- centered cursor
opt('b', 'undofile', true)                            -- persistant undo
opt('b', 'swapfile', false)                           -- no swap files
opt('o', 'clipboard', 'unnamedplus')                      -- enable copy paste
opt('o', 'inccommand', 'nosplit')                     -- live substitution
opt('o', 'showmode', false)                           -- hide mode
opt('o', 'mouse', 'a')                                -- enable mouse usage
opt('o', 'termguicolors', true)                       -- colors in terminal
opt('o', 'background', 'dark')                        -- set background light/dark
opt('o', 'updatetime', 250)                           -- fast updates (default 4000)
opt('w', 'cursorline', true)                          -- cursorline

-- splits
opt('o', 'splitbelow', true)                          -- open splits below
opt('o', 'splitright', true)                          -- open splits right

-- case insensitive searching unless search query contains uppercase
opt('o', 'ignorecase', true)                          -- case insensitive searching
opt('o', 'smartcase', true)                           -- when searching pattern with uppercase, case sensitive

-- command line options
opt('o', 'wildmode', 'longest:full,full')             -- first tab shows longest
opt('o', 'wildignore', '*.exe,*.ini')                 -- ignore files

-- custom options for .cpp
vim.cmd([[autocmd BufRead,BufNewFile *.cpp :setlocal foldmarker=using\ ll,#endif foldmethod=marker ]])

---- remember last position
vim.cmd[[autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'| exe "normal! g`\""| endif]]

vim.cmd[[autocmd BufWritePre * %s/\s\+$//e]]                        -- remove trailing whitespaces
vim.cmd[[autocmd BufWritePre * %s/\n\+\%$//e]]                      -- remove trailing nl
vim.cmd[[autocmd FocusGained * checktime]]                          -- reload files on focus gains

-- highlight on yank
vim.api.nvim_exec([[
    augroup YankHighlight
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank()
    augroup end
]], false)

local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
   vim.g["loaded_" .. plugin] = 1
end
