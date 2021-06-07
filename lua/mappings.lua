function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- yank until eol with Y
map('n', 'Y', 'y$')

---- c++ compile and run
-- map('n', '<leader><leader>', '<cmd> wa | !g++ -std=c++17 -DLOCAL -Wall -Wextra -Wshadow -D_GLIBCXX_DEBUG % | a.exe <Input>Output<CR>')                         -- standard
map('n', '<leader><leader>', '<cmd> wa | FloatermNew g++ -std=c++17 -DLOCAL -Wall -Wextra -Wshadow -D_GLIBCXX_DEBUG % && a.exe <Input>Output<CR>')              -- floaterm
-- map('n', '<leader><leader>', '<cmd> wa | !g++ -std=c++17 -DLOCAL -Wall -Wextra -Wshadow -D_GLIBCXX_DEBUG % 2>Error -o %:r | %:r.exe <Input>Output<CR>')         -- stderr to Error

-- for xmbc
map('n', '<A-a>', '<cmd> wa | FloatermNew g++ -std=c++17 -DLOCAL -Wall -Wextra -Wshadow -D_GLIBCXX_DEBUG % && a.exe <Input>Output<CR>')              -- floaterm

---- python
map('n', '<leader>py', '<cmd> wa | FloatermNew py<CR>')

---- better window movements
map('n', '<leader>h', '<cmd> wincmd h<CR>')
map('n', '<leader>j', '<cmd> wincmd j<CR>')
map('n', '<leader>k', '<cmd> wincmd k<CR>')
map('n', '<leader>l', '<cmd> wincmd l<CR>')

---- change window sizes
map('n', '<C-Right>', '<cmd> vertical resize +3<CR>', { silent = true })
map('n', '<C-Left>', '<cmd> vertical resize -3<CR>', { silent = true })
map('n', '<C-Down>', '<cmd> resize +3<CR>', { silent = true })
map('n', '<C-Up>', '<cmd> resize -3<CR>', { silent = true })

map('n', '<leader>a', 'ggVG')
map('n', '<leader>y', 'ggVGdicc <ESC>:call UltiSnips#ExpandSnippet()<CR>')
map('n', '<leader>,', '<cmd> wa | SClose | cd ~ | Startify<CR>')
map('n', '<leader>u', '<cmd> UndotreeToggle | UndotreeShow<CR>')

---- escape to enter normal mode in te
map('t', '<ESC>', '<C-\\><C-n>gg')

---- transparency
map('n', '<F1>', '<cmd> luafile ~/AppData/Local/nvim/lua/colorschemes.lua<CR>')
map('n', '<F2>', '<cmd> hi Normal guibg=none ctermbg=none | hi FloatermBorder guifg=#61AFEF<CR>')

---- cur time
map('n', '<leader>q', '<cmd> echo strftime("%H:%M")<CR>')

---- Telescope
map('n', '<leader>f', '<cmd> Telescope fd<CR>')
map('n', '<leader>g', '<cmd> Telescope live_grep<CR>')
map('n', '<leader>c', '<cmd> Telescope command_history<CR>')
