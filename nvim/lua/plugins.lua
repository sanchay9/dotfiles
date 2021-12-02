vim.cmd "packadd packer.nvim"

local present, packer = pcall(require, "packer")
if not present then
    print("Packer not found")
    return
end

local use = packer.use
return packer.startup({function()
    use 'nvim-lua/plenary.nvim'
    use "kazhala/close-buffers.nvim"

    use {
        "wbthomason/packer.nvim",
        event = "VimEnter"
    }

    use {
        "NvChad/nvim-base16.lua",
        after = "packer.nvim",
        config = function()
            require"colors".init()
        end
    }

    use {
        "kyazdani42/nvim-web-devicons",
        after = "nvim-base16.lua",
        config = function()
            require "plugins.icons"
        end
    }

    use {
        "NTBBloodbath/galaxyline.nvim",
        -- 'nvim-lualine/lualine.nvim',
        after = "nvim-web-devicons",
        config = function()
            require "plugins.statusline"
        end
    }

    use {
        "akinsho/bufferline.nvim",
        after = "nvim-web-devicons",
        config = function()
            require "plugins.bufferline"
        end
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        after = "nvim-base16.lua",
        config = function()
            require "plugins.indentline"
        end
    }

    use {
        "norcalli/nvim-colorizer.lua",
        event = "BufRead"
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        event = "BufRead",
        run = ":TSUpdate",
        config = function()
            require "plugins.treesitter"
        end
    }

    use {
        "lewis6991/gitsigns.nvim",
        opt = true,
        after = "nvim-base16.lua",
        config = function()
            require "plugins.gitsigns"
        end
    }

    use {
        "neovim/nvim-lspconfig",
        after = "packer.nvim",
        config = function()
            require "plugins.lspconfig"
        end
    }

    use {
        "SirVer/ultisnips",
        config = function()
            require "plugins.ultisnips"
        end
    }

    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require "plugins.autopair"
        end
    }

    use {
        "goolord/alpha-nvim",
        event = "VimEnter",
        config = function()
            require "plugins.alpha"
        end
    }

    use {
        "kyazdani42/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        config = function()
            require "plugins.nvimtree"
        end
    }

    use {
        "nvim-telescope/telescope.nvim",
        module = "telescope",
        cmd = "Telescope",
        requires = {
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                run = "make",
            },
            {
                "sanchay9/telescope-colorscheme-live",
            },
        },
        config = function()
            require "plugins.telescope"
        end
    }

    use {
        "tpope/vim-commentary",
        requires = {{ "tpope/vim-repeat" }},
        event = "BufRead",
    }

    use {
        "tpope/vim-surround",
        event = "BufRead",
    }

    use {
        "github/copilot.vim",
        cmd = "Copilot",
    }

    use {
        "voldikss/vim-floaterm",
        cmd = "FloatermNew",
        config = function()
            require "plugins.floaterm"
        end
    }

    use {
        "vimwiki/vimwiki",
        event = "BufRead",
        config = function()
            require "plugins.vimwiki"
        end
    }

    use {
        "sanchay9/cphelper.nvim",
        after = "vim-floaterm"
    }

    use {
        "sanchay9/vim-be-good",
        cmd = "VimBeGood",
    }
end,
config = {
    display = {
        working_sym = '', -- The symbol for a plugin being installed/updated
        error_sym = '', -- The symbol for a plugin with an error in installation/updating
        done_sym = '', -- The symbol for a plugin which has completed installation/updating
        removed_sym = '', -- The symbol for an unused plugin which was removed
        open_fn = function()
            return require('packer.util').float({ border = '' })
        end
    }
}})
