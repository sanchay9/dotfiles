local present, alpha = pcall(require, 'alpha')
if not present then
    return
end

local dashboard = require'alpha.themes.dashboard'

local handle = io.popen('echo "$(date +%a) $(date +%d) $(date +%b)" | tr -d "\n"')
local date = handle:read("*a")
handle:close()

dashboard.section.header.val = {
    "",
    "",
    "",
    "",
    "",
    "Today's " .. date,
    -- "",
    -- "",
    -- "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
    -- "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
    -- "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
    -- "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
    -- "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
    -- "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
    -- "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
    -- " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
    -- " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
    -- "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
    -- "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
}

dashboard.section.header.opts.hl = "AlphaHeader"

local fortune = require("alpha.fortune")
dashboard.section.footer.val = fortune()

-- handle = io.popen('fd -d 2 . $HOME"/.local/share/nvim/site/pack/packer" | head -n -2 | wc -l | tr -d "\n" ')
-- local plugins = handle:read("*a")
-- handle:close()
-- dashboard.section.footer.val = {
--     "",
--     "  Neovim loaded " .. plugins .. " plugins"
-- }
dashboard.section.footer.opts.hl = "AlphaFooter"

dashboard.section.buttons.val = {
    dashboard.button( 'p',   '  Practice',    ':cd ~/code | e A.cpp<CR>' ),
    -- dashboard.button( 'w',   'ﴬ  VimWiki',     ':VimwikiIndex<CR>' ),
    dashboard.button( 'r',   '  Recents',     ':Telescope oldfiles<CR>' ),
    dashboard.button( 't',   '  Templates',   ':cd ~/lib | Telescope fd<CR>' ),
    dashboard.button( 'm',   '  Manpages',    ':Telescope man_pages<CR>' ),
    dashboard.button( 'c',   '  Config',      ':cd ~/.config/nvim/ | Telescope fd<CR>' ),
    dashboard.button( 'f',   '  Colorscheme', ':luafile ~/.config/nvim/lua/telescope-colorschemelive.lua<CR>' ),
    dashboard.button( 'v',   '  VimBeGood',   ':VimBeGood<CR>' ),
    -- dashboard.button( 'q',   '  Exit',        ':qa<CR>' ),
}

alpha.setup(dashboard.opts)
