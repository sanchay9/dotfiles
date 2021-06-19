function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- yank until eol with Y
map('n', 'Y', 'y$')

---- c++ compile and run
-- map('n', '<leader><leader>', '<CMD> wa | !g++ -std=c++17 -DLOCAL -Wall -Wextra -Wshadow -D_GLIBCXX_DEBUG % | a.exe <Input>Output<CR>')                         -- standard
map('n', '<leader><leader>', '<CMD> wa | FloatermNew g++ -std=c++17 -DLOCAL -Wall -Wextra -Wshadow -D_GLIBCXX_DEBUG % && a.exe <Input>Output<CR>')              -- floaterm
-- map('n', '<leader><leader>', '<CMD> wa | !g++ -std=c++17 -DLOCAL -Wall -Wextra -Wshadow -D_GLIBCXX_DEBUG % 2>Error -o %:r | %:r.exe <Input>Output<CR>')         -- stderr to Error

-- for xmbc
map('n', '<A-a>', '<CMD> wa | FloatermNew g++ -std=c++17 -DLOCAL -Wall -Wextra -Wshadow -D_GLIBCXX_DEBUG % && a.exe <Input>Output<CR>')              -- floaterm

---- better window movements
map('n', '<leader>h', '<CMD> wincmd h<CR>')
map('n', '<leader>j', '<CMD> wincmd j<CR>')
map('n', '<leader>k', '<CMD> wincmd k<CR>')
map('n', '<leader>l', '<CMD> wincmd l<CR>')

---- file movements
map('n', '<leader>1', '<CMD> w | e A.cpp<CR>')
map('n', '<leader>2', '<CMD> w | e B.cpp<CR>')
map('n', '<leader>3', '<CMD> w | e C.cpp<CR>')
map('n', '<leader>4', '<CMD> w | e D.cpp<CR>')
map('n', '<leader>5', '<CMD> w | e E.cpp<CR>')

map('n', '<C-Right>', '<CMD> vertical resize +3<CR>', { silent = true })
map('n', '<C-Left>', '<CMD> vertical resize -3<CR>', { silent = true })
map('n', '<Right>', '<C-w>o', { silent = true })
map('n', '<Left>', '<CMD> vs Input | sp Output | wincmd h<CR>', { silent = true })

map('n', '<leader>a', 'ggVG')
map('n', '<leader>y', 'ggVGccc')
map('n', '<leader>,', '<CMD> wa | SClose | cd ~ | Startify<CR>')
map('n', '<leader>u', '<CMD> UndotreeToggle | UndotreeShow<CR>')
map('n', '<leader>/', '<CMD> noh<CR>')
map('n', '<leader>py', '<CMD> wa | FloatermNew py<CR>')

---- run the macro in q register (instead of Ex mode)
map('n', 'Q', '@q')

---- escape to enter normal mode in te
map('t', '<ESC>', '<C-\\><C-n>gg')

---- transparency
map('n', '<F1>', '<CMD> luafile ~/AppData/Local/nvim/lua/colorschemes.lua<CR>')
map('n', '<F2>', '<CMD> hi Normal guibg=none | hi FloatermBorder guifg=#61AFEF | hi LineNr guibg=none<CR>')

---- Telescope
map('n', '<leader>f', '<CMD> Telescope fd<CR>')
map('n', '<leader>g', '<CMD> Telescope live_grep<CR>')
map('n', '<leader>c', '<CMD> Telescope command_history<CR>')
