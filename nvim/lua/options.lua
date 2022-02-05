vim.opt.fileencoding = 'utf-8'
vim.opt.ts = 4
vim.opt.sts = 4
vim.opt.shiftwidth = 4                          -- spaces to use for indent
vim.opt.expandtab = true                        -- use spaces instead of tabs
vim.opt.number = true                           -- line numbers
vim.opt.wrap = false                            -- no line wrap
vim.opt.scrolloff = 7                           -- centered cursor
vim.opt.sidescrolloff = 7
vim.opt.undofile = true                         -- persistant undo
vim.opt.swapfile = false                        -- no swap files
vim.opt.clipboard = "unnamedplus"               -- enable copy paste
vim.opt.showmode = false                        -- hide -- INSERT --
vim.opt.mouse = 'a'                             -- enable mouse usage
vim.opt.termguicolors = true
vim.opt.background = "dark"                     -- set background light/dark
vim.opt.updatetime = 300                        -- fast updates (default 4000)
vim.opt.splitbelow = true                       -- open splits below
vim.opt.splitright = true                       -- open splits right
vim.opt.ignorecase = true                       -- case insensitive searching
vim.opt.smartcase = true                        -- when searching pattern with uppercase, case sensitive
vim.opt.wildmode = 'longest:full,full'          -- first tab shows longest
vim.opt.wildignore = '*.exe,*.ini'              -- ignore files
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.cursorline = true
-- vim.opt.numberwidth = 2                         -- set number column width (default 4)
-- vim.opt.signcolumn = "yes"

vim.g.vimwiki_list = { { path = '~/docs/vimwiki', syntax = 'markdown', ext = '.md' } }

local disabled_built_ins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end
