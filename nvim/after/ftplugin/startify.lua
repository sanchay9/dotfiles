vim.opt.showtabline = 0
vim.cmd([[
augroup NoTabline
au!
autocmd BufEnter <buffer> set showtabline=0
autocmd BufLeave <buffer> set showtabline=2
augroup END
]])
