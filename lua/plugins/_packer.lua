local theme = "colorful.vim"

return require("packer").startup(
	function(use)
		-- Packer can manage itself as an optional plugin
		use {
			"wbthomason/packer.nvim",
			cmd = {"PackerCompile", "PackerStatus", "PackerInstall", "PackerUpdate", "PackerLoad", "PackerClean"},
			config = function()
				require('plugins._packer')
			end
		}
		use { "tweekmonster/startuptime.vim", cmd = "StartupTime" }

		-- APPERANCES (COLORSCHEME, BUFFERLINE, TOPBAR...)
		use {
			"tknightz/colorful.vim",
			branch = "for_nvim",
			event = {"VimEnter", "BufRead"},
			config = function()
				vim.cmd([[
					syntax on
					filetype on
					filetype plugin indent on
				]])
				require('colorful').set()
			end
		}

		use {
			"folke/todo-comments.nvim",
			after = theme,
			config = function()
				require("todo-comments").setup {}
			end
		}

		use { 
			"kyazdani42/nvim-web-devicons",
			config = function()
				require("plugins._fileicons")
			end,
			module = "nvim-web-devicons"
		}
		use {
			"nvim-treesitter/nvim-treesitter",
			after = theme,
			config = function() require("plugins._treesitter") end
		}
		use {
			'hoob3rt/lualine.nvim',
			after = theme,
			config = function() require("plugins._lualine") end
		}
		use {
			"norcalli/nvim-colorizer.lua",
			event = "BufRead",
			config = function() require("plugins._colorizer") end
		}
		use {
			"maxmellon/vim-jsx-pretty",
			ft = {"javascriptreact", "typescriptreact"}
		}

		use {
			"akinsho/nvim-bufferline.lua",
			after = theme,
			config = function() require("plugins._bufferline") end
		}

		-- EXTENSIONS (WINDOWS)
		use { 
			"kristijanhusak/orgmode.nvim",
			after = theme,
			config = function()
				require('plugins._orgmode')
			end
		}
		use {
			'lukas-reineke/headlines.nvim',
			ft = {"markdown", "org"},
			config = function()
				require('headlines').setup()
			end,
		}

		use {
			"akinsho/org-bullets.nvim",
			after = {"orgmode.nvim"},
			config = function()
				require("org-bullets").setup {
					symbols = { "◉", "○", "✸", "✿" }
				}
			end
		}

		use { 
			'michaelb/sniprun',
			run = 'bash ./install.sh',
			cmd = {"SnipRun", "SnipInfo", "SnipReset"}
		}

		use { "nvim-treesitter/playground", cmd = {"TSPlaygroundToggle"} }
		use {
			"kyazdani42/nvim-tree.lua",
			cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFindFile"},
			setup = function() require("plugins._nvimtree").setup() end,
			config = function()
				require('plugins._nvimtree').config()
			end
		}

		use {
			"simnalamburt/vim-mundo",
			cmd = {"MundoShow", "MundoToggle"}
		}
		
		use {
			"lukas-reineke/indent-blankline.nvim",
			after = theme,
			config = function()
				require('plugins._indentline')
			end
		}

		use { "tknightz/window-jumping.lua", cmd = "WindowJumping" }
		use {
			"nvim-telescope/telescope.nvim",
			requires = {
				{ "nvim-lua/popup.nvim", module = "popup" },
				{ "nvim-lua/plenary.nvim", module = "plenary" },
				{ "nvim-telescope/telescope-symbols.nvim" },
				{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
				{ "nvim-telescope/telescope-project.nvim", after = "telescope.nvim" },
				{ "nvim-telescope/telescope-arecibo.nvim", after = "telescope.nvim", rocks = {"openssl", "lua-http-parser"} },
			},
			cmd = {"Telescope", "EztermFind"},
			config = function() require("plugins._telescope") end
		}

		use {
			"tknightz/ezterm.nvim",
			cmd = {"Ezterm", "EztermFind"},
			config = function() require("plugins._ezterm") end
		}

		use { "haya14busa/is.vim", keys = {"/"} }
		use { "szw/vim-maximizer", cmd = "MaximizerToggle" }
		use { "instant-markdown/vim-instant-markdown", ft = {"markdown"} }

		-- DATABASE
		use {
			'kristijanhusak/vim-dadbod-ui',
			requires = {
				{'tpope/vim-dadbod', opt=true}
			},
			cmd = {"DBUI", "DBUIAddConnection", "DBUIToggle"},
			setup = function() require('plugins._dbui') end,
			config = function()
				vim.cmd[[packadd vim-dadbod]]
			end
		}

		-- EDITOR
		use {
			'andymass/vim-matchup',
			setup = function()
				require('plugins._matchup')
			end,
			event = "BufRead"
		}
		use {
			"terrortylor/nvim-comment",
			cmd = "CommentToggle",
			config = function()
				require('nvim_comment').setup()
			end
		}

		use { "junegunn/vim-easy-align", keys = "<Plug>{EasyAlign)", cmd = "EasyAlign" }
		use {
			"machakann/vim-sandwich",
			event = "InsertEnter"
		}
		use {
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			config = function() require("nvim-autopairs").setup() end
		}
		use { "alvan/vim-closetag", ft = {"html", "javascript", "javascriptreact"} }

		use {
			"wfxr/minimap.vim",
			setup = function()
				require("plugins._minimap")
			end,
			run = ":!cargo install --locked code-minimap",
			cmd = {"Minimap", "MinimapToggle"}
		}


		-- LSP AND COMPLETION
		use {
			"neovim/nvim-lspconfig",
			cmd = {"LspStart"},
			config = function() require("plugins._lsp") end
		}

		use {
			"folke/trouble.nvim",
			cmd = {"LspTrouble", "LspTroubleToggle", "LspTroubleOpen", "LspWorkplaceOpen"}
		}
		-- use { "glepnir/lspsaga.nvim", opt = false}
		use {
			"onsails/lspkind-nvim",
			after = "nvim-compe",
			config = function() require("plugins._lspkind") end
		}

		use {
			"hrsh7th/nvim-compe",
			event = "InsertEnter",
			config = function() require("plugins._comp") end,
		}
		use {
			"ray-x/lsp_signature.nvim",
			module = "lsp_signature"
		}

		use { "Vimjas/vim-python-pep8-indent", ft = {"python"} }
		use {
			"ray-x/go.nvim",
			ft = {"go"},
			config = function() require("plugins._go") end
		}

		use { "mattn/emmet-vim",
			ft = {"html", "css", "javascriptreact", "typescriptreact" }
		}

		use {
			"rmagatti/goto-preview",
			cmd = {"PreviewDef", "PreviewImpl", "PreviewClose"},
			config = function()
				require("plugins.lsp._preview")
			end
		}

		-- PROJECT AND VERSION CONTROL
		use {
			"tpope/vim-fugitive",
			cmd = {"Git"},
		}

		use {
			"sindrets/diffview.nvim",
			cmd = {"DiffviewOpen", "DiffviewToggleFiles"},
		}

		use {
			"lewis6991/gitsigns.nvim",
			event = "BufRead",
			config = function() require("plugins._gitsigns") end
		}

		-- UX
		use { "famiu/bufdelete.nvim", cmd = {"Bdelete", "Bwipeout"} }
		use {
			"karb94/neoscroll.nvim",
			event = "BufRead",
			config = function()
				require('neoscroll').setup()
			end
		}
		use {
			"folke/which-key.nvim",
			keys = {"<leader>", "<Space>"},
			config = function()
				require('plugins._whichkey')
			end
		}
	end,
	{
		display = {
			border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }
		},
		git = {
			clone_timeout = 300
		}
	}
)
