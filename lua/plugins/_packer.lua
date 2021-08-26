vim.cmd [[packadd packer.nvim]]


return require("packer").startup(
    function()
        -- Packer can manage itself as an optional plugin
        use { "wbthomason/packer.nvim", opt = false}

        -- APPERANCES (COLORSCHEME, BUFFERLINE, TOPBAR...)
        use 'folke/tokyonight.nvim'

        -- use { "tknightz/colorful.vim", branch = "for_nvim" }
        use { "kyazdani42/nvim-web-devicons" }
        use { "ryanoasis/vim-devicons" }
        use {
            "nvim-treesitter/nvim-treesitter",
            event = "VimEnter",
            config = function() require("plugins._treesitter") end
        }
        use {
            "glepnir/galaxyline.nvim", config = function() require("plugins._galaxyline") end
        }
        use {
            "norcalli/nvim-colorizer.lua",
            event = "BufRead",
            config = function() require("plugins._colorizer") end
        }
        use {
            "lukas-reineke/indent-blankline.nvim",
            event = "BufRead",
            cmd = { "IndentBlanklineToggle", "IndentBlanklineEnable" },
            config = function() require("plugins._indentline") end
        }
        use {
            "akinsho/nvim-bufferline.lua",
            config = function() require("plugins._bufferline") end
        }

        -- EXTENSIONS (WINDOWS)
        use { "nvim-treesitter/playground", event = "BufRead" }
        use { "plasticboy/vim-markdown", ft = {"markdown"} }
        use {
            "kyazdani42/nvim-tree.lua",
            cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFindFile"},
            setup = function() require("plugins._nvimtree") end
        }
        use { "tknightz/window-jumping.lua", cmd = "WindowJumping" }
        use {
            "akinsho/nvim-toggleterm.lua",
            cmd = "ToggleTerm",
            config = function() require("plugins._toggleterm") end
        }
        use {
            "nvim-telescope/telescope.nvim",
            requires = {
                { "nvim-lua/popup.nvim"},
                { "nvim-lua/plenary.nvim"},
                { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
                { "nvim-telescope/telescope-media-files.nvim" },
                { "nvim-telescope/telescope-frecency.nvim" },
            },
            cmd = { "Telescope"},
            config = function() require("plugins._telescope") end
        }
        use { "haya14busa/is.vim", event = "BufRead" }
        use { "szw/vim-maximizer", cmd = "MaximizerToggle" }
        use { "instant-markdown/vim-instant-markdown", ft = {"markdown"} }

        -- EDITOR
        use { "b3nj5m1n/kommentary", keys = {"<Plug>kommentary_line_default", "<Plug>kommentary_visual_default"} }
        use { "junegunn/vim-easy-align", keys = "<Plug>{EasyAlign)", cmd = "EasyAlign" }
        use {
            "machakann/vim-sandwich",
            key = {
                "<Plug>(operator-sandwich-add)",
                "<Plug>(operator-sandwich-delete)",
                "<Plug>(operator-sandwich-release-count)",
                "<Plug>(textobj-sandwich-query-a)",
                "<Plug>(operator-sandwich-replace)",
                "<Plug>(textobj-sandwich-auto-a)"
            }
        }
        use {
            "windwp/nvim-autopairs",
            event = "InsertEnter",
            config = function() require("nvim-autopairs").setup() end
        }
        use { "alvan/vim-closetag", ft = {"html", "javascript", "javascriptreact"} }

        -- LSP AND COMPLETION
        use {
            "neovim/nvim-lspconfig",
            event = "VimEnter",
            config = function() require("plugins._lsp") end
        }
        use {
            "onsails/lspkind-nvim",
            event = "VimEnter",
            config = function() require("plugins._lspkind") end
        }
        -- use { "glepnir/lspsaga.nvim", opt = false}
        use { "folke/trouble.nvim", event = "BufRead" }
        use {
            "hrsh7th/nvim-compe",
            event = "InsertEnter",
            config = function() require("plugins._comp") end,
        }
        use { "Vimjas/vim-python-pep8-indent", ft = {"python"} }
        use {
            "ray-x/go.nvim",
            ft = {"go"},
            config = function() require("plugins._go") end
        }
        use { "mattn/emmet-vim", ft = {"html", "css", "javascript", "javascriptreact"} }

        -- PROJECT AND VERSION CONTROL
        use { "tpope/vim-fugitive", cmd = {"Git"} }
        use {
            "lewis6991/gitsigns.nvim",
            event = "BufRead",
            config = function() require("plugins._gitsigns") end
        }
        use { "tweekmonster/startuptime.vim", cmd = "StartupTime" }
        use { "simnalamburt/vim-mundo", cmd = {"MundoShow", "MundoToggle"} }

        -- UX
        use { "famiu/bufdelete.nvim", cmd = {"Bdelete", "Bwipeout"} }
        use { "karb94/neoscroll.nvim", event = "BufRead" }
        use { "folke/which-key.nvim" }
    end,
    {
        display = {
            border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }
        },
        git = {
            clone_timeout = 300
        }
})
