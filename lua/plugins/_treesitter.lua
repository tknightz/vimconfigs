local ts_config = require("nvim-treesitter.configs")

ts_config.setup {
	ensure_installed = {
		"javascript",
		"html",
		"css",
		"bash",
		"lua",
		"json",
		"go",
		"python"
	},
	highlight = {
		enable = true,
		disable = {"javascriptreact", "typescriptreact"},
		use_languagetree = true,
		additional_vim_regex_highlighting = true
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gs",
			node_incremental = "gn",
			scope_incremental = "gk",
			node_decremental = "gp",
		}
	},
	matchup = {
		enable = true,
	},
	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
		keybindings = {
			toggle_query_editor = 'o',
			toggle_hl_groups = 'i',
			toggle_injected_languages = 't',
			toggle_anonymous_nodes = 'a',
			toggle_language_display = 'I',
			focus_language = 'f',
			unfocus_language = 'F',
			update = 'R',
			goto_node = '<cr>',
			show_help = '?',
		},
	}
}
