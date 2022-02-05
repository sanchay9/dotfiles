-- do nothing on space
vim.keymap.set('', '<Space>', '<Nop>')

---- c++ compile and run
vim.keymap.set('n', '<leader><leader>', '<CMD> wa | FloatermNew g++ -std=c++17 -O2 -DLOCAL -Wall -Wextra -Wshadow -D_GLIBCXX_DEBUG -o ~/code/a.out % && ~/code/a.out <~/code/Input>~/code/Output<CR>', { noremap = true })

vim.keymap.set('n', '<C-h>', "<CMD> wincmd h<CR>", {noremap = true})
vim.keymap.set('n', '<C-j>', "<CMD> wincmd j<CR>", {noremap = true})
vim.keymap.set('n', '<C-k>', "<CMD> wincmd k<CR>", {noremap = true})
vim.keymap.set('n', '<C-l>', "<CMD> wincmd l<CR>", {noremap = true})

vim.keymap.set('n', '<A-k>', ":m -2<CR>==", {noremap = true, silent = true})
vim.keymap.set('n', '<A-j>', ":m +1<CR>==", {noremap = true, silent = true})
vim.keymap.set('n', '<A-h>', "<<", {noremap = true, silent = true})
vim.keymap.set('n', '<A-l>', ">>", {noremap = true, silent = true})

vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv", {noremap = true, silent = true})
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv", {noremap = true, silent = true})
vim.keymap.set('v', '<A-h>', "<gv", {noremap = true, silent = true})
vim.keymap.set('v', '<A-l>', ">gv", {noremap = true, silent = true})

vim.keymap.set('n', '<leader>1', '<CMD> wa | cd ~/code | e A.cpp | BDelete other<CR>', {noremap = true})
vim.keymap.set('n', '<leader>2', '<CMD> wa | cd ~/code | e B.cpp | BDelete other<CR>', {noremap = true})
vim.keymap.set('n', '<leader>3', '<CMD> wa | cd ~/code | e C.cpp | BDelete other<CR>', {noremap = true})
vim.keymap.set('n', '<leader>4', '<CMD> wa | cd ~/code | e D.cpp | BDelete other<CR>', {noremap = true})
vim.keymap.set('n', '<leader>5', '<CMD> wa | cd ~/code | e E.cpp | BDelete other<CR>', {noremap = true})

local cur = 1
vim.keymap.set('n', '<leader>i', function()
    if cur == 1 then
        cur = 0
        vim.cmd[[vs ~/code/Input | vertical resize 32 | sp ~/code/Output | wincmd h]]
    else
        cur = 1
        vim.cmd[[wa | bd Input Output]]
    end
end, {noremap = true, silent = true})

vim.keymap.set('n', '<leader>a', 'ggVG', {noremap = true})
vim.keymap.set('n', '<leader>n', 'gg"_dG<CMD> 0r ~/code/Codes/templatesingle.cpp | wa | :52<CR>cc')
vim.keymap.set('n', '<leader>m', 'gg"_dG<CMD> 0r ~/code/Codes/templatemulti.cpp | wa | :49<CR>cc')
vim.keymap.set('n', '<leader>,', '<CMD> wa | cd ~ | Alpha<CR>', {noremap = true})
vim.keymap.set('n', '<leader>f', '<CMD> Telescope fd<CR>', {noremap = true})
vim.keymap.set('n', '<leader>g', '<CMD> Telescope live_grep<CR>', {noremap = true})
vim.keymap.set('n', '<C-n>', '<CMD> NvimTreeToggle<CR>', {noremap = true})
vim.keymap.set('n', '<F3>', '<CMD> CphGet<CR>', {noremap = true})
vim.keymap.set('n', '<F4>', '<CMD> w | CphTest<CR>', {noremap = true})
-- vim.keymap.set('n', '<leader>m', '<CMD> MinimapToggle<CR>', {noremap = true})
vim.keymap.set('n', '<leader>d', '<CMD> InstantMarkdownPreview<CR>', {noremap = true})
vim.keymap.set('n', '<leader>s', '<CMD> InstantMarkdownStop<CR>', {noremap = true})

-- vim.keymap.set('n', '<leader>o', '<CMD> setlocal spell! spelllang=en_us<CR>', {noremap = true}) --orthography

---- run the macro in q register (instead of Ex mode)
vim.keymap.set('n', 'Q', '@q', {noremap = true})

---- turn off search highlighting
vim.keymap.set('n', '<Esc>', ':noh<CR>', {noremap = true, silent = true})

---- replace in current file
vim.keymap.set('n', 'S', ':%s///g<Left><Left><Left>', {noremap = true})

---- escape to enter normal mode in te
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>gg', {noremap = true})

vim.keymap.set('n', '<F1>', '<CMD> hi Normal guibg=none | hi FloatermBorder guifg=#61AFEF | hi LineNr guibg=none | hi clear CursorLine<CR>', {noremap = true})
vim.keymap.set('n', '<leader>t', '<CMD> luafile ~/.config/nvim/lua/telescope-colorschemelive.lua<CR>', {noremap = true})
vim.keymap.set('n', '<leader>u', '<CMD> UndotreeToggle<CR>', {noremap = true})
vim.keymap.set('n', 'gx', '<CMD>call jobstart(["xdg-open", expand("<cfile>")], {"detach": v:true})<CR>', {noremap = true})

-- map('i', '{', '{}<Left>')
-- vim.keymap.set('i', '{<CR>', '{<CR>}<Esc>O', {noremap = true})
-- map('i', '{{', '{')
-- map('i', '{}', '{}')

vim.keymap.set('n', '<S-h>', '<CMD> BufferLineCyclePrev<CR>', {noremap = true})
vim.keymap.set('n', '<S-l>', '<CMD> BufferLineCycleNext<CR>', {noremap = true})

---- abbreviations
vim.cmd[[iabbrev itn int]]
vim.cmd[[iabbrev icn cin]]
vim.cmd[[iabbrev cotu cout]]
vim.cmd[[iabbrev endl '\n']]
