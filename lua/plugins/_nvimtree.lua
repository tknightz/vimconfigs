local M = {}
local g = vim.g

M.NvimTreeXdgOpen = function()
  local lib = require'nvim-tree.lib'
  local node = lib.get_node_at_cursor()
  if node then
    vim.fn.jobstart("xdg-open '" .. node.absolute_path .. "' &", { detach = true })
  end
end

M.setup = function()
	g.nvim_tree_quit_on_open = 0
	g.nvim_tree_indent_markers = 1
	g.nvim_tree_git_hl = 1
	g.nvim_tree_root_folder_modifier = ":t"
	g.nvim_tree_highlight_opened_files = 1
	g.nvim_tree_allow_resize = 0
	g.nvim_tree_icon_padding = '  '

	g.nvim_tree_window_picker_exclude = {
		filetype = {
			'packer',
			'qf',
			'toggleterm'
		},
		buftype = {
			'terminal'
		}
	}

	g.nvim_tree_show_icons = {
		git = 1,
		folders = 1,
		files = 1,
		folder_arrows = 1,
	}

	g.nvim_tree_icons = {
		default = "",
		symlink = "",
		git = {
			unstaged = "✗",
			staged = "✓",
			unmerged = "",
			renamed = "➜",
			untracked = "★"
		},
		folder = {
			default = "",
			arrow_open = "",
			arrow_closed = "",
			open = "",
			empty = "",
			empty_open = "",
			symlink = "",
			symlink_open = ""
		},
		lsp = {
			hint = '',
			info = "",
			warning = "",
			error = ""
		}
	}
end

M.config = function()
	local nvim_tree = require('nvim-tree')
	local tree_cb = require('nvim-tree.config').nvim_tree_callback
	nvim_tree.setup {
		auto_close = true,
		view = {
			mappings = {
				custom_only = false,
				list = {
					{ key = "e", cb = tree_cb("cd") },
					{ key = "o", cb = M.NvimTreeXdgOpen() },
				}
			}
		}
	}
end

return M
