require 'plugins.statusline'
-- require 'plugins.autopair'
require 'plugins.gitsigns'
require 'plugins.treesitter'
require 'plugins.alpha'
require 'plugins.floaterm'
require 'plugins.ultisnips'
require 'plugins.indentline'
require 'plugins.vimwiki'
require 'plugins.nvimtree'
require 'plugins.lspconfig'
require 'plugins.telescope'

local use = require('packer').use
return require('packer').startup({function()
    use 'wbthomason/packer.nvim'
    use 'dstein64/vim-startuptime'

    use 'neovim/nvim-lspconfig'

    use 'nvim-lua/plenary.nvim'
    use "nvim-telescope/telescope.nvim"
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    use 'sainnhe/gruvbox-material'
    use 'sainnhe/sonokai'
    use 'marko-cerovac/material.nvim'
    use 'Pocco81/Catppuccino.nvim'
    use 'kyazdani42/nvim-web-devicons'

    use 'goolord/alpha-nvim'
    use 'voldikss/vim-floaterm'
    -- use 'windwp/nvim-autopairs'
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'norcalli/nvim-colorizer.lua'
    use 'kyazdani42/nvim-tree.lua'
    use 'NTBBloodbath/galaxyline.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'lewis6991/gitsigns.nvim'
    use 'SirVer/ultisnips'
    use 'vimwiki/vimwiki'

    use 'sanchay9/cphelper.nvim'
    use 'ThePrimeagen/vim-be-good'
    use 'github/copilot.vim'
end,
config = {
    display = {
        open_fn = function()
            return require('packer.util').float({ border = '' })
        end
    }
}})
