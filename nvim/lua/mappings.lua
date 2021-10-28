-- do nothing on space
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })

---- c++ compile and run
vim.api.nvim_set_keymap('n', '<leader><leader>', '<CMD> wa | FloatermNew g++ -std=c++17 -O2 -DLOCAL -Wall -Wextra -Wshadow -D_GLIBCXX_DEBUG % && ./a.out <Input>Output<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>h', '<CMD> wincmd h<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>j', '<CMD> wincmd j<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>k', '<CMD> wincmd k<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>l', '<CMD> wincmd l<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<M-k>', "<CMD> m -2<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<M-j>', "<CMD> m +1<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<M-h>', "<<", {noremap = true})
vim.api.nvim_set_keymap('n', '<M-l>', ">>", {noremap = true})

vim.api.nvim_set_keymap('v', '<M-k>', ":m '<-2<CR>gv", {noremap = true})
vim.api.nvim_set_keymap('v', '<M-j>', ":m '>+1<CR>gv", {noremap = true})
vim.api.nvim_set_keymap('v', '<M-h>', "<gv", {noremap = true})
vim.api.nvim_set_keymap('v', '<M-l>', ">gv", {noremap = true})

vim.api.nvim_set_keymap('n', '<leader>1', '<CMD> e A.cpp<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>2', '<CMD> e B.cpp<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>3', '<CMD> e C.cpp<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>4', '<CMD> e D.cpp<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>5', '<CMD> e E.cpp<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<C-Right>', '<CMD> vertical resize +3<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Left>', '<CMD> vertical resize -3<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>9', '<CMD> vs Input | vertical resize 32 | sp Output | wincmd h<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>0', '<C-w>o', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>a', 'ggVG', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>q', 'ggVGp <ESC>:wincmd h<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>n', 'ggVGccc', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>,', '<CMD> wa | cd ~ | Alpha<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>f', '<CMD> Telescope fd<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>g', '<CMD> Telescope live_grep<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>c', '<CMD> Telescope command_history<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-n>', '<CMD> NvimTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F3>', '<CMD> CphGet<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F4>', '<CMD> w | CphTest<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>/', '<CMD> noh<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<leader>o', '<CMD> setlocal spell! spelllang=en_us<CR>', { noremap = true }) --orthography

---- run the macro in q register (instead of Ex mode)
vim.api.nvim_set_keymap('n', 'Q', '@q', { noremap = true })

---- replace in current file
vim.api.nvim_set_keymap('n', 'S', ':%s///g<Left><Left><Left>', { noremap = true })

---- escape to enter normal mode in te
vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-n>gg', { noremap = true })

vim.api.nvim_set_keymap('n', '<F1>', '<CMD> luafile ~/.config/nvim/lua/colors.lua<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F2>', '<CMD> hi Normal guibg=none | hi FloatermBorder guifg=#61AFEF | hi LineNr guibg=none | hi clear CursorLine<CR>', { noremap = true })

-- map('i', '{', '{}<Left>')
vim.api.nvim_set_keymap('i', '{<CR>', '{<CR>}<Esc>O', { noremap = true })
-- map('i', '{{', '{')
-- map('i', '{}', '{}')
