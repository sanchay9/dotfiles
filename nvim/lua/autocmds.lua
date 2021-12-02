-- custom options for .cpp
vim.cmd([[autocmd Filetype cpp setlocal foldmarker=using\ ll,#endif foldmethod=marker ]])

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

-- alpha
vim.cmd([[autocmd FileType alpha set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2]])
vim.cmd([[autocmd FileType alpha nnoremap <silent> <buffer> q :q<CR>]])
vim.cmd([[autocmd FileType alpha set laststatus=0 | autocmd BufUnload <buffer> set laststatus=2]])

-- highlight on yank
vim.api.nvim_exec([[
    augroup YankHighlight
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank()
    augroup end
]], false)

-- packersync on plugins.lua write
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])
