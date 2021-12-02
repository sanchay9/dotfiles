-- do nothing on space
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })

---- c++ compile and run
vim.api.nvim_set_keymap('n', '<leader><leader>', '<CMD> wa | FloatermNew g++ -std=c++17 -O2 -DLOCAL -Wall -Wextra -Wshadow -D_GLIBCXX_DEBUG % && ./a.out <Input>Output<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<C-h>', '<CMD> wincmd h<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<CMD> wincmd j<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<CMD> wincmd k<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<CMD> wincmd l<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<A-k>', ":m -2<CR>==", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-j>', ":m +1<CR>==", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-h>', "<<", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-l>', ">>", {noremap = true, silent = true})

vim.api.nvim_set_keymap('v', '<A-k>', ":m '<-2<CR>gv", {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<A-j>', ":m '>+1<CR>gv", {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<A-h>', "<gv", {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<A-l>', ">gv", {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>1', '<CMD> e A.cpp | BDelete other<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>2', '<CMD> e B.cpp | BDelete other<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>3', '<CMD> e C.cpp | BDelete other<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>4', '<CMD> e D.cpp | BDelete other<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>5', '<CMD> e E.cpp | BDelete other<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>9', '<CMD> vs Input | vertical resize 32 | sp Output | wincmd h<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>0', '<CMD> bd Input Output<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>a', 'ggVG', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>n', 'ggVGccc', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>,', '<CMD> wa | cd ~ | Alpha<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>f', '<CMD> Telescope fd<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>g', '<CMD> Telescope live_grep<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-n>', '<CMD> NvimTreeToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F3>', '<CMD> CphGet<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F4>', '<CMD> w | CphTest<CR>', {noremap = true})

-- vim.api.nvim_set_keymap('n', '<leader>o', '<CMD> setlocal spell! spelllang=en_us<CR>', {noremap = true}) --orthography

---- run the macro in q register (instead of Ex mode)
vim.api.nvim_set_keymap('n', 'Q', '@q', {noremap = true})

---- turn off search highlighting
vim.api.nvim_set_keymap('n', '<Esc>', ':noh<CR>', {noremap = true, silent = true})

---- replace in current file
vim.api.nvim_set_keymap('n', 'S', ':%s///g<Left><Left><Left>', {noremap = true})

---- escape to enter normal mode in te
vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-n>gg', {noremap = true})

vim.api.nvim_set_keymap('n', '<F1>', '<CMD> luafile ~/.config/nvim/init.lua<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<F2>', '<CMD> hi Normal guibg=none | hi FloatermBorder guifg=#61AFEF | hi LineNr guibg=none | hi clear CursorLine<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>c', '<CMD> luafile ~/.config/nvim/lua/telescope-colorschemelive.lua<CR>', {noremap = true})

-- map('i', '{', '{}<Left>')
-- vim.api.nvim_set_keymap('i', '{<CR>', '{<CR>}<Esc>O', {noremap = true})
-- map('i', '{{', '{')
-- map('i', '{}', '{}')

vim.api.nvim_set_keymap('n', '<Tab>', '<CMD> BufferLineCycleNext<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<S-Tab>', '<CMD> BufferLineCyclePrev<CR>', {noremap = true})

-- Add Packer commands because we are not loading it at startup
vim.cmd "silent! command PackerClean lua require 'plugins' require('packer').clean()"
vim.cmd "silent! command PackerCompile lua require 'plugins' require('packer').compile()"
vim.cmd "silent! command PackerInstall lua require 'plugins' require('packer').install()"
vim.cmd "silent! command PackerStatus lua require 'plugins' require('packer').status()"
vim.cmd "silent! command PackerSync lua require 'plugins' require('packer').sync()"
vim.cmd "silent! command PackerUpdate lua require 'plugins' require('packer').update()"

---- abbreviations
vim.cmd[[iabbrev itn int]]
vim.cmd[[iabbrev icn cin]]
vim.cmd[[iabbrev cotu cout]]
