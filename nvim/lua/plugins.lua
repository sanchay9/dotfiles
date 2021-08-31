require 'core.statusline'
require 'core.autopair'
require 'core.lspcpp'
require 'core.gitsigns'
require 'core.treesitter'
require 'core.startify'
require 'core.floaterm'
require 'core.ultisnips'
require 'core.indentline'
require 'core.vimwiki'
require 'core.telescope'
require 'core.tabline'
require 'core.zenmode'
require 'core.twilight'

require 'colorizer'.setup()

return require('packer').startup({function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- lsp
    use 'neovim/nvim-lspconfig'
    use {'lewis6991/impatient.nvim', rocks = 'mpack'}

    -- telescope
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'

    -- colors
    use 'sainnhe/gruvbox-material'
    use 'sainnhe/sonokai'
    use 'marko-cerovac/material.nvim'
    use 'Pocco81/Catppuccino.nvim'

    -- startify
    use 'mhinz/vim-startify'

    -- floating terminal
    use 'voldikss/vim-floaterm'

    -- treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- snippets
    use 'SirVer/ultisnips'

    -- qol
    use 'windwp/nvim-autopairs'
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'mbbill/undotree'
    use 'dstein64/vim-startuptime'
    use 'kyazdani42/nvim-web-devicons'
    use 'glepnir/galaxyline.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'norcalli/nvim-colorizer.lua'
    use 'seblj/nvim-tabline'

    -- git
    use 'tpope/vim-fugitive'
    use 'lewis6991/gitsigns.nvim'

    -- note taking
    use 'vimwiki/vimwiki'
    use 'folke/zen-mode.nvim'
    use 'folke/twilight.nvim'
end,
config = {
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'single' })
        end
    }
}})
