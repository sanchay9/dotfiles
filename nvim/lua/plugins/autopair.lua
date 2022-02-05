require('nvim-autopairs').setup()

local npairs = require('nvim-autopairs')

-- -- skip it, if you use another global object
-- _G.MUtils= {}

-- MUtils.completion_confirm = function()
--     if vim.fn.pumvisible() ~= 0  then
--         return npairs.esc('<CR>')
--     else
--         return npairs.autopairs_cr()
--     end
-- end

-- vim.keymap.set('i','<CR>', 'v:lua.MUtils.completion_confirm()',{ expr = true, noremap = true })
-- vim.keymap.set('i', '<Tab>', function()
--     return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
-- end, {expr = true})

npairs.setup({
    check_ts = true,
})
