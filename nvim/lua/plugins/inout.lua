local M = {}

local cur = 1

M.toggle = function()
    if cur == 1 then
        cur = 0
        vim.cmd[[vs ~/code/Input | vertical resize 32 | sp ~/code/Output | wincmd h]]
    else
        cur = 1
        vim.cmd[[wa | bd Input Output]]
    end
end

return M
