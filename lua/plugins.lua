return require('packer').startup({
    function()

        -- packer can manage itself as an optional plugin
        use { 'wbthomason/packer.nvim', opt = true }

        -- color schemes
        use 'morhetz/gruvbox'
        use { 'dracula/vim', as = 'dracula' }
        use 'cocopon/iceberg.vim'
        use 'tomasr/molokai'
        use 'arcticicestudio/nord-vim'
        use 'joshdick/onedark.vim'
        use 'NLKNguyen/papercolor-theme'

        -- visuals
        use { 'lukas-reineke/indent-blankline.nvim', branch = 'lua' }
        use 'itchyny/lightline.vim'
        use 'kyazdani42/nvim-web-devicons'

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

        -- code snippets
        use 'SirVer/ultisnips'

        -- qol
        use 'jiangmiao/auto-pairs'
        use 'tpope/vim-commentary'
        use 'tpope/vim-surround'
        use 'tpope/vim-repeat'
        use 'mbbill/undotree'

        -- git
        use 'tpope/vim-fugitive'

        -- note taking
        use 'vimwiki/vimwiki'
        use 'junegunn/goyo.vim'

    end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" } })
            end
        }
    }
})
