vim.cmd[[autocmd Filetype cpp setlocal foldmarker=using\ ll,#endif foldmethod=marker]]
vim.cmd[[autocmd Filetype zsh setlocal filetype=sh]]

-- remember last position
vim.cmd[[autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'| exe "normal! g`\""| endif]]

-- remove trailing whitespaces and nl on save
vim.cmd[[autocmd BufWritePre * %s/\s\+$//e]]
vim.cmd[[autocmd BufWritePre * %s/\n\+\%$//e]]

-- reload files on focus gains
vim.cmd[[autocmd FocusGained * checktime]]

-- don't show any numbers inside terminals
vim.cmd [[ au TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal ]]

-- Use relative & absolute line numbers in 'n' & 'i' modes respectively
-- vim.cmd[[ au InsertEnter * set norelativenumber ]]
-- vim.cmd[[ au InsertLeave * set relativenumber ]]

-- vim.cmd[[autocmd FileType alpha set laststatus=0 | autocmd BufUnload <buffer> set laststatus=2]]
vim.cmd[[autocmd FileType alpha set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2]]
vim.cmd[[autocmd FileType alpha nnoremap <silent> <buffer> e :ene <bar> startinsert<CR>]]
vim.cmd[[autocmd FileType alpha,help,man,qf nnoremap <silent> <buffer> q :q<CR>]]
vim.cmd[[autocmd FileType man nnoremap <silent> <buffer> f <C-w>o]]

-- highlight on yank
vim.cmd[[autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup = 'Search', timeout = 200})]]
vim.cmd[[autocmd VimResized * tabdo wincmd =]]

-- packersync on plugins.lua write
vim.cmd[[autocmd BufWritePost plugins.lua source <afile> | PackerSync]]


vim.cmd([[
    au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif
]], false)
