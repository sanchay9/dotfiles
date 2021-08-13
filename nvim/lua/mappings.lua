function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- do nothing on space
map('n', '<Space>', '')

-- yank until eol with Y
map('n', 'Y', 'y$')

---- c++ compile and run
map('n', '<leader><leader>', '<CMD> wa | FloatermNew g++ -std=c++17 -O2 -DLOCAL -Wall -Wextra -Wshadow -D_GLIBCXX_DEBUG % && ./a.out <Input>Output<CR>')

---- better window movements
map('n', '<leader>h', '<CMD> wincmd h<CR>')
map('n', '<leader>j', '<CMD> wincmd j<CR>')
map('n', '<leader>k', '<CMD> wincmd k<CR>')
map('n', '<leader>l', '<CMD> wincmd l<CR>')

---- file movements
map('n', '<leader>1', '<CMD> e A.cpp<CR>')
map('n', '<leader>2', '<CMD> e B.cpp<CR>')
map('n', '<leader>3', '<CMD> e C.cpp<CR>')
map('n', '<leader>4', '<CMD> e D.cpp<CR>')
map('n', '<leader>5', '<CMD> e E.cpp<CR>')

map('n', '<C-Right>', '<CMD> vertical resize +3<CR>', { silent = true })
map('n', '<C-Left>', '<CMD> vertical resize -3<CR>', { silent = true })
map('n', '<leader>9', '<CMD> vs Input | vertical resize 32 | sp Output | wincmd h<CR>', { silent = true })
map('n', '<leader>0', '<C-w>o', { silent = true })

map('n', '<leader>a', 'ggVG')
map('n', '<leader>q', 'ggVGp <ESC>:wincmd h<CR>')
map('n', '<leader>y', 'ggVGccc')
map('n', '<leader>,', '<CMD> wa | SClose | cd ~ | Startify<CR>')
map('n', '<leader>u', '<CMD> UndotreeToggle | UndotreeShow<CR>')
map('n', '<leader>/', '<CMD> noh<CR>')
map('n', '<leader>py', '<CMD> wa | FloatermNew python3<CR>')

---- run the macro in q register (instead of Ex mode)
map('n', 'Q', '@q')

---- escape to enter normal mode in te
map('t', '<ESC>', '<C-\\><C-n>gg')

map('n', '<F1>', '<CMD> luafile ~/.config/nvim/lua/colorschemes.lua<CR>')
map('n', '<F2>', '<CMD> hi Normal guibg=none | hi FloatermBorder guifg=#61AFEF | hi LineNr guibg=none<CR>')

---- Telescope
map('n', '<leader>f', '<CMD> Telescope fd<CR>')
map('n', '<leader>g', '<CMD> Telescope live_grep<CR>')
map('n', '<leader>c', '<CMD> Telescope command_history<CR>')