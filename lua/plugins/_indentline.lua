vim.cmd[[hi IndentBlankLineContextChar guifg=#701494 guibg=none]]
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append("space:⋅")


require('indent_blankline').setup {
	use_treesitter = true,
	show_trailing_blankline_indent = false,
	show_current_context = true,
	filetype_exclude = {'help', 'packer', 'txt'},
	buftype_exclude = {'terminal', 'packer'},
	term = 238,
	gui = '#1E272C',
	-- char_list = {'|', '¦', '┆', '┊'},
	char_list = {'│'},
	concealcursor = 'inc',
	conceallevel = 2,
	faster = 1,
	context_patterns = {'class', 'function', 'def', 'method', 'if', 'for', 'while'},
	space_char_blankline = ' ',
	char_highlight_list = {
		'IndentBlanklineChar'
	},
	space_char_highlight_list = {
		'IndentBlanklineChar'
	},
}
