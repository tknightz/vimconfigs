vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', { noremap = true, silent = true })
vim.g['&fcs'] = 'eob: '

vim.api.nvim_set_keymap("n", "<C-_>", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("v", "<C-_>", "<Plug>kommentary_visual_default", {})
vim.api.nvim_set_keymap('n', '<C-y>', ":%y+", {})
vim.api.nvim_set_keymap('v', '<C-y>', ":%y+", {})

vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_filetype_exclude = {'help'}
vim.g.indent_blankline_buftype_exclude = {'terminal'}
vim.g.indent_blankline_char_list = {'│'}
vim.g.indent_blankline_context_patterns = {'class', 'function', 'method', 'if', 'for', 'while'}

vim.g.ikolor_transparent = 1

vim.api.nvim_command('augroup terminal_settings')
vim.api.nvim_command('autocmd BufLeave term://* stopinsert')
vim.api.nvim_command('autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no')
vim.api.nvim_command('augroup END')

vim.api.nvim_command('augroup editor')
vim.api.nvim_command('autocmd BufReadPost * normal! g`"zv')
vim.api.nvim_command('augroup END')
