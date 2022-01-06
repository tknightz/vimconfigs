-- By assign theme_name to a variable, I can lazy-loading most of plugins
-- and neovim still works correctly of course.
-- :> I probably can lazy-loading all plugins (but I don't need to do that)

local theme = "colorful.vim"
local theme_repo = "tknightz/colorful.vim"

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

		use {
			-- faster filetype detect
			"nathom/filetype.nvim",
			config = function()
				require('filetype').setup {
					overrides = {
						literal = {
							["__Mundo__"] = 'Mundo',
							["__Mundo_Preview__"] = "MundoDiff"
						},
					},
				}
			end
		}

		-- APPERANCES (COLORSCHEME, BUFFERLINE, TOPBAR...)
		use {
			theme_repo,
			event = {"VimEnter"},
			config = function()

				vim.cmd [[
					syntax on
					filetype plugin indent on
				]]

				-- Theme load here
				-- vim.cmd[[colorscheme theme_name]]
				require('colorful').set()
			end
		}

		use {
			-- highlight keywords in comment.
			"folke/todo-comments.nvim",
			event = "BufRead",
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
		use { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" }
		use { "nvim-treesitter/playground", cmd = {"TSPlaygroundToggle"} }
		use { 
			"p00f/nvim-ts-rainbow",
			after = "nvim-treesitter",
			config = function()
				require("nvim-treesitter.configs").setup{}
			end 
		}

		use {
			-- status line
			'nvim-lualine/lualine.nvim',
			after = theme,
			config = function() require("plugins._lualine") end
		}

		use {
			-- view color in hexa code
			"norcalli/nvim-colorizer.lua",
			event = "BufRead",
			config = function() require("plugins._colorizer") end
		}

		use {
			-- tree-sitter indentation in jsx doesn't work correctly.
			-- I use vim-jsx-pretty for indentation over tree-sitter
			"maxmellon/vim-jsx-pretty",
			ft = {"javascriptreact", "typescriptreact"}
		}

		use {
			-- show open buffers in tab above
			"akinsho/nvim-bufferline.lua",
			after = theme,
			config = function() require("plugins._bufferline") end
		}

		--[[ use {'/home/tknightz/ViMaster/telescope-termfinder.nvim'}
		use {"akinsho/toggleterm.nvim"} --]]

		-- ORGMODE (notes-taking)
		use { 
			"kristijanhusak/orgmode.nvim",
			ft = {"org"},
			config = function()
				-- ensure that treesitter first.
				vim.cmd[[packadd nvim-treesitter]]
				require('plugins._orgmode').setup()
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
			-- Run code inside org files
			'michaelb/sniprun',
			run = 'bash ./install.sh',
			cmd = {"SnipRun", "SnipInfo", "SnipReset"}
		}

		-- EXTENSIONS (WINDOWS)
		use {
			"kyazdani42/nvim-tree.lua",
			cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFindFile"},
			setup = function() require("plugins._nvimtree").setup() end,
			config = function()
				require('plugins._nvimtree').config()
			end
		}

		use {
			-- no more 1000u (ctrl+z)
			"simnalamburt/vim-mundo",
			cmd = {"MundoShow", "MundoToggle"}
		}

		use {
			'ggandor/lightspeed.nvim',
			keys = {"s", "S"}
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
				{ "nvim-telescope/telescope-arecibo.nvim", after = "telescope.nvim" },
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
			-- Use database inside neovim
			-- execute sql, nosql,,, and view results
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

		use {
			'tknightz/sqlupper.vim',
			ft = {"sql"}
		}

		use {
			'shmup/vim-sql-syntax', 
			ft = {"sql", "mysql"}
		}

		-- EDITOR
		use {
			-- press f to move inline
			'rhysd/clever-f.vim',
			event = "BufRead"
		}

		use {
			-- better matchparen
			'andymass/vim-matchup',
			setup = function()
				require('plugins._matchup')
			end,
			event = "BufRead"
		}

		use {
			-- Commenting
			"numToStr/Comment.nvim",
			event = "BufRead",
			config = function()
				require('Comment').setup{
					mappings = {
						basic = true,
						extra = true,
						extended = true,
					},
				}
			end
		}

		use {
			-- Align code block easily
			"junegunn/vim-easy-align",
			keys = "<Plug>{EasyAlign)",
			cmd = "EasyAlign"
		}
		use {
			-- Add, change and delete brackets quickly
			"machakann/vim-sandwich",
			event = "BufRead",
			config = function()
				vim.cmd[[runtime macros/sandwich/keymap/surround.vim]]
			end
		}
		use {
			-- Auto add brackets
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			config = function() require("nvim-autopairs").setup() end
		}

		use {
			-- Rename html, xml tag quickly
			"AndrewRadev/tagalong.vim",
			ft = {"html", "xml", "javascriptreact"},
		}

		use {
			-- show minimap (I sometimes use it)
			"wfxr/minimap.vim",
			setup = function()
				require("plugins._minimap")
			end,
			run = ":!cargo install --locked code-minimap",
			cmd = {"Minimap", "MinimapToggle"}
		}


		-- LSP AND COMPLETION
		use {
			-- lsp setup, I don't use it usually.
			-- so it's lazy-loading
			-- I've defined "LspStart" command before.
			-- copy only _packer.lua won't work.
			"neovim/nvim-lspconfig",
			cmd = {"LspStart"},
			config = function() require("plugins._lsp") end
		}

		use {
			-- Show lsp errors, warnings, info... in quickfix window
			"folke/trouble.nvim",
			cmd = {"LspTrouble", "LspTroubleToggle", "LspTroubleOpen", "LspWorkplaceOpen"}
		}

		use {
			-- Auto completion for lsp, path, buffer
			"hrsh7th/nvim-cmp",
			event = "InsertEnter",
			requires = {
				{ 'hrsh7th/cmp-nvim-lsp', after = "nvim-cmp" },
				{ 'hrsh7th/cmp-buffer', after = "nvim-cmp" },
				{ 'hrsh7th/cmp-path', after = "nvim-cmp" },
				{ 'hrsh7th/cmp-emoji', after = "nvim-cmp"}
			},
			config = function() require("plugins._comp") end,
		}

		use {
			-- Show signature help while typing
			"ray-x/lsp_signature.nvim",
			module = "lsp_signature"
		}

		use {
			-- This is for python docstring...
			"stsewd/sphinx.nvim",
			ft = {"python"},
			run = ":UpdateRemotePlugins",
			after = "nvim-treesitter"
		}

		use {
			-- tree-sitter for python indentation is not works correctly
			"Vimjas/vim-python-pep8-indent",
			ft = {"python"}
		}

		use {
			-- go lsp plugin
			"ray-x/go.nvim",
			ft = {"go"},
			config = function() require("plugins._go") end
		}

		use { 
			-- Emmet
			"mattn/emmet-vim",
			ft = {"html", "css", "javascriptreact", "typescriptreact" }
		}

		use {
			-- show preview definition, implementation in float window
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
			-- View git diff inside neovim
			"sindrets/diffview.nvim",
			cmd = {"DiffviewOpen", "DiffviewToggleFiles"},
		}

		use {
			-- view git sign, commits (similar gitlens vscode)
			"lewis6991/gitsigns.nvim",
			event = "BufRead",
			config = function() require("plugins._gitsigns") end
		}

		-- UX
		-- use {
		-- 	-- Avoid flicker when split window
		-- 	"luukvbaal/stabilize.nvim",
		-- 	event = "BufRead",
		-- 	config = function() require("stabilize").setup() end
		-- }

		use {
			'VonHeikemen/fine-cmdline.nvim',
			keys = {":"},
			requires = {
				{'MunifTanjim/nui.nvim', module = "nui"}
			},
		}

		use {
			-- Show conext current cursor
			"romgrk/nvim-treesitter-context",
			cmd = {"TSContextToggle", "TSContextEnable"},
			config = function()
				require('treesitter-context').setup()
			end
		}

		use {
			-- Delete buffer nicely
			"famiu/bufdelete.nvim",
			cmd = {"Bdelete", "Bwipeout"}
		}

		use {
			-- show fancy notifications
			"rcarriga/nvim-notify",
			module = "notify",
			config = function()
				require('notify').setup({
					background_colour = "#000000",
				})
			end
		}

		use {
			"karb94/neoscroll.nvim",
			event = "BufRead",
			config = function()
				require('neoscroll').setup()
			end
		}

		use {
			-- Organize keybindings
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
