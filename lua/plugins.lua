vim.cmd [[packadd packer.nvim]]

return require('packer').startup(
  function()
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- Colors and icons
    use {'tknightz/ikolor.vim', as = 'ikolor'}
    use 'norcalli/nvim-base16.lua'
    use 'glepnir/zephyr-nvim'
    use "kyazdani42/nvim-web-devicons"
    use "ryanoasis/vim-devicons"
    use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
    use "nvim-treesitter/nvim-treesitter"

    -- Extensions (windows)
    use "kyazdani42/nvim-tree.lua"
    use 'akinsho/nvim-bufferline.lua'
    use {
			'nvim-telescope/telescope.nvim',
			requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  	}
    use "nvim-telescope/telescope-media-files.nvim"
    use 'b3nj5m1n/kommentary'
    use 'vimlab/split-term.vim'
    use 'machakann/vim-sandwich'
    use 'haya14busa/is.vim'

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
