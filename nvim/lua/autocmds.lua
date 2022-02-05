vim.cmd[[autocmd Filetype cpp setlocal foldmarker=using\ ll,#endif foldmethod=marker]]
-- vim.cmd[[autocmd Filetype zsh setlocal filetype=sh]]

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

-- hide tabline on alpha
vim.cmd[[autocmd FileType alpha set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2]]

vim.cmd[[autocmd FileType alpha nnoremap <silent> <buffer> e :ene <bar> startinsert<CR>]]
vim.cmd[[autocmd FileType alpha,help,man,qf nnoremap <silent> <buffer> q :q<CR>]]
vim.cmd[[autocmd FileType help,man nnoremap <silent> <buffer> f <C-w>o]]

-- highlight on yank
vim.cmd[[autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup = 'Search', timeout = 200})]]

vim.cmd[[autocmd VimResized * tabdo wincmd =]]

-- packersync on plugins.lua write
vim.cmd[[autocmd BufWritePost plugins.lua source <afile> | PackerSync]]

-- hide statusbar
vim.cmd [[autocmd BufEnter,BufRead,BufWinEnter,FileType,WinEnter * lua function hide_st() local hidden = { "NvimTree" } local buftype = vim.api.nvim_buf_get_option(0, "ft") if vim.tbl_contains(hidden, buftype) then vim.api.nvim_set_option("laststatus", 0) return end vim.api.nvim_set_option("laststatus", 2) end hide_st()]]
