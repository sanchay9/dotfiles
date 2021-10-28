require 'core.statusline'
-- require 'core.autopair'
require 'core.gitsigns'
require 'core.treesitter'
require 'core.alpha'
require 'core.floaterm'
require 'core.ultisnips'
require 'core.indentline'
require 'core.vimwiki'
require 'core.nvimtree'
require 'core.lspconfig'
require 'core.telescope'

return require('packer').startup({function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'dstein64/vim-startuptime'
    use { 'lewis6991/impatient.nvim', rocks = 'mpack' }

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
end,
config = {
    display = {
        open_fn = function()
            return require('packer.util').float({ border = '' })
        end
    }
}})
