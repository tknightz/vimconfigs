vim.cmd [[packadd packer.nvim]]

return require('packer').startup(
  function()
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- Colors and icons
    use 'tknightz/colorful.vim'
    use "kyazdani42/nvim-web-devicons"
    use "ryanoasis/vim-devicons"
    -- use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
    use "nvim-treesitter/nvim-treesitter"
    use 'nvim-treesitter/playground'
    use 'norcalli/nvim-colorizer.lua'

    -- Extensions (windows)
    use 'dosimple/workspace.vim'
    use "kyazdani42/nvim-tree.lua"
    use 'akinsho/nvim-bufferline.lua'
    use "akinsho/nvim-toggleterm.lua"
    use {
			'nvim-telescope/telescope.nvim',
			requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  	}
    use "nvim-telescope/telescope-media-files.nvim"
    use 'b3nj5m1n/kommentary'
    use 'machakann/vim-sandwich'
    use 'haya14busa/is.vim'
    use 'szw/vim-maximizer'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use "onsails/lspkind-nvim"
    use "hrsh7th/nvim-compe"
    use 'Vimjas/vim-python-pep8-indent'

    -- Project and version control
    use 'lewis6991/gitsigns.nvim'
    use 'glepnir/galaxyline.nvim'
    use 'windwp/nvim-autopairs'
    use 'alvan/vim-closetag'

    -- UX
    use 'karb94/neoscroll.nvim'
    use 'folke/which-key.nvim'
  end,
  {
    display = {
      border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }
    }
  }
)
