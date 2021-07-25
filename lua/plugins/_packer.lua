vim.cmd [[packadd packer.nvim]]

return require('packer').startup(
  function()
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- Colors and icons
    use {'tknightz/colorful.vim', opt = false}
    use {"kyazdani42/nvim-web-devicons", opt = false}
    use {"ryanoasis/vim-devicons", opt = false}
    -- use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
    use {
      "nvim-treesitter/nvim-treesitter",
      requires = {
        { "nvim-treesitter/playground" }, -- playground for treesitter
      },
      opt = false,
    }
    use {'norcalli/nvim-colorizer.lua', opt = false}

    -- Extensions (windows)
    use {'junegunn/vim-easy-align', opt = false}
    use {'plasticboy/vim-markdown', opt = true, ft = {'md'}}
    use {'tpope/vim-fugitive', opt = true, cmd = {"Git"} }
    use {"kyazdani42/nvim-tree.lua", opt = true, cmd = {"NvimTreeToggle", "NvimTreeOpen", "NvimTreeFindFile"}} -- Tree file manager
    use {'tknightz/window-jumping.lua', opt = true, cmd = "WindowJumping"} -- Quick jumping over windows
    use {'akinsho/nvim-bufferline.lua', opt = false}
    use {"akinsho/nvim-toggleterm.lua", opt = true, cmd = "ToggleTerm"}
    use {
			'nvim-telescope/telescope.nvim',
			requires = {
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'},
        {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
        { "nvim-telescope/telescope-media-files.nvim" },
        { "nvim-telescope/telescope-frecency.nvim" },
      },
      opt = false,
  	}
    use {'b3nj5m1n/kommentary', opt = false}
    use {'machakann/vim-sandwich', opt = false}
    use {'haya14busa/is.vim', opt = false}
    use {'szw/vim-maximizer', opt = true, cmd = "MaximizerToggle"}
    use {'instant-markdown/vim-instant-markdown', opt = true, ft = {'md'}}
    use {"lukas-reineke/indent-blankline.nvim", opt = true, ft = {"html", "js", "python"}}


    -- LSP
    use {'neovim/nvim-lspconfig', opt = false}
    use {"onsails/lspkind-nvim", opt = false}
    use {"glepnir/lspsaga.nvim", opt = false}
    use {
      "hrsh7th/nvim-compe",
      opt = false,
      requires = {
        { "hrsh7th/vim-vsnip", opt = true, ft = {"html"} },
      },
    }
    use {"rafamadriz/friendly-snippets", opt = true, ft = {"html"}}
    use {'Vimjas/vim-python-pep8-indent', opt = true, ft = {"python"}}

    -- Project and version control
    use {'lewis6991/gitsigns.nvim', opt = false}
    use {'glepnir/galaxyline.nvim', opt = false}
    use {'windwp/nvim-autopairs', opt = false}
    use {'alvan/vim-closetag', opt = true, ft = {"html"}}

    -- UX
    use {'karb94/neoscroll.nvim', opt = false}
    use {'folke/which-key.nvim', opt = false}
  end,
  {
    display = {
      border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }
    }
  }
)
