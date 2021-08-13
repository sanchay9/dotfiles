return require('packer').startup({
    function()

        -- packer can manage itself as an optional plugin
        use { 'wbthomason/packer.nvim', opt = true }

        -- visuals
        use { 'dracula/vim', as = 'dracula' }
        use 'NLKNguyen/papercolor-theme'
        use 'arcticicestudio/nord-vim'
        use 'sainnhe/gruvbox-material'
        use 'sainnhe/sonokai'
        use 'folke/tokyonight.nvim'
        use 'marko-cerovac/material.nvim'

        use 'kyazdani42/nvim-web-devicons'
        use 'glepnir/galaxyline.nvim'

        -- startify
        use 'mhinz/vim-startify'

        -- floating terminal
        use 'voldikss/vim-floaterm'

        -- telescope
        use 'nvim-telescope/telescope.nvim'
        use 'nvim-lua/popup.nvim'
        use 'nvim-lua/plenary.nvim'

        -- treesitter
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

        -- lsp
        use 'neovim/nvim-lspconfig'

        -- snippets
        use 'SirVer/ultisnips'

        -- qol
        use 'windwp/nvim-autopairs'
        use 'tpope/vim-commentary'
        use 'tpope/vim-surround'
        use 'tpope/vim-repeat'
        use 'mbbill/undotree'
        use 'dstein64/vim-startuptime'

        -- git
        use 'tpope/vim-fugitive'
        use 'lewis6991/gitsigns.nvim'

        -- note taking
        use 'vimwiki/vimwiki'

    end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" } })
            end
        }
    }
})
