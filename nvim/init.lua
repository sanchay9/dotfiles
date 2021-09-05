--      .__       .__  __     .__
--      |__| ____ |__|/  |_   |  |  __ _______
--      |  |/    \|  \   __\  |  | |  |  \__  \
--      |  |   |  \  ||  |    |  |_|  |  // __ \_
--      |__|___|  /__||__| /\ |____/____/(____  /
--              \/         \/                 \/


----------------------------------------------------------------------------------------------------------------------------------

---- map leader to space
vim.g.mapleader = ' '

require 'impatient'

---- include files
require 'options'
require 'plugins'
require 'mappings'
require 'colors'

---- abbreviations
vim.cmd[[iabbrev itn int]]
vim.cmd[[iabbrev icn cin]]
vim.cmd[[iabbrev cotu cout]]
