vim.cmd "packadd packer.nvim"

local present, packer = pcall(require, "packer")
if not present then
    print("Packer not found")
    return
end

local use = packer.use
return packer.startup({function()
    use "nathom/filetype.nvim"

    use {
        "nvim-lua/plenary.nvim",
        module = "plenary"
    }

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
        'nvim-lualine/lualine.nvim',
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
        cmd = "ColorizerAttachToBuffer",
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        event = "BufRead",
        run = ":TSUpdate",
        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = "maintained",
                highlight = {
                    enable = true,
                },
            }
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
            vim.g.UltiSnipsExpandTrigger = '<tab>'
            vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
            vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
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
        },
        config = function()
            require "plugins.telescope"
        end
    }

    use {
        "tpope/vim-commentary",
        keys = { "gc" },
        requires = {{ "tpope/vim-repeat" }},
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
            vim.g.floaterm_borderchars = '        ' -- '─│─│┌┐┘└' --'─│─│╭╮╯╰' --
            vim.g.floaterm_title = ''
            vim.g.floaterm_autoinsert = 1
            vim.g.floaterm_width = 0.7
            vim.g.floaterm_height = 0.5
        end
    }

    use {
        "vimwiki/vimwiki",
        ft = "markdown",
        config = function()
            vim.g.vimwiki_list = { { path = '~/docs/vimwiki', syntax = 'markdown', ext = '.md' } }
        end
    }

    use {
        "sanchay9/cphelper.nvim",
        cmd = { "CphGet", "CphTest" },
    }

    use {
        "sanchay9/vim-be-good",
        cmd = "VimBeGood",
    }

    use {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
        config = function()
            vim.g.undotree_SetFocusWhenToggle = 1
        end
    }

    use {
        "wfxr/minimap.vim",
        cmd = "MinimapToggle",
        config = function()
            vim.g.minimap_width = 14
            vim.g.minimap_git_colors = 1
        end
    }

    use {
        "kazhala/close-buffers.nvim",
        cmd = "BDelete",
    }

    use {
        "instant-markdown/vim-instant-markdown",
        cmd = "InstantMarkdownPreview",
        config = function()
            -- vim.g.instant_markdown_slow = 1
            vim.g.instant_markdown_autostart = 0
            vim.g.instant_markdown_browser = "google-chrome-beta --new-window --app=http://localhost:8090"
        end
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
