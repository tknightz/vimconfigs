vim.g.mapleader = ' '
vim.g['&fcs'] = 'eob: '

-- Keybindings
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-_>", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("v", "<C-_>", "<Plug>kommentary_visual_default", {})
vim.api.nvim_set_keymap('n', '<C-y>', ":%y+", {})
vim.api.nvim_set_keymap('v', '<C-y>', ":%y+", {})
vim.api.nvim_set_keymap('n', '<C-S-Left>', ":vertical resize +3<cr>", {})
vim.api.nvim_set_keymap('n', '<C-S-Right>', ":vertical resize -3<cr>", {})
vim.api.nvim_set_keymap('n', '<C-S-Up>', ":resize +3<cr>", {})
vim.api.nvim_set_keymap('n', '<C-S-Down>', ":resize -3<cr>", {})
vim.api.nvim_set_keymap('n', 'cv', '<Plug>(SubversiveSubstitute)', {})
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {})


-- Variables
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_filetype_exclude = {'help'}
vim.g.indent_blankline_buftype_exclude = {'terminal'}
vim.g.indentLine_color_term = 238
vim.g.indentLine_color_gui = '#1E272C'
vim.g.indent_blankline_char_list = {'|', '¦', '┆', '┊'}
vim.g.indentLine_concealcursor = 'inc'
vim.g.indentLine_conceallevel = 2
vim.g.indentLine_faster = 1
vim.g.indent_blankline_context_patterns = {'class', 'function', 'method', 'if', 'for', 'while'}
vim.g.instant_markdown_autostart = 0



-- Autocmd
vim.api.nvim_command('augroup terminal_settings')
vim.api.nvim_command('autocmd BufLeave term://* stopinsert')
vim.api.nvim_command('autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no')
vim.api.nvim_command('augroup END')

vim.api.nvim_command('augroup editor')
vim.api.nvim_command('autocmd BufReadPost * normal! g`"zv')
vim.api.nvim_command('augroup END')
