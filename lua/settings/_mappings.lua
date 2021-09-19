vim.g.user_emmet_leader_key = ','
vim.g.instant_markdown_autostart = 0

-- KEYBINDINgs
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true }) -- unset space for whichkey
vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', { noremap = true, silent = true }) -- toggle highlights
vim.api.nvim_set_keymap("n", "<C-_>", ":CommentToggle<cr>", { noremap = true, silent = true}) -- Ctrl + / for commenting
vim.api.nvim_set_keymap("v", "<C-_>", ":CommentToggle<cr>", { noremap = true, silent = true}) -- Comment for visual
vim.api.nvim_set_keymap('n', '<C-y>', ":%y+", {}) -- Copy all text to clipboard
vim.api.nvim_set_keymap('v', '<C-y>', ":%y+", {}) -- Copy selected to clipboard
vim.api.nvim_set_keymap('n', '<C-S-Left>', ":vertical resize +3<cr>", {}) -- Resize window
vim.api.nvim_set_keymap('n', '<C-S-Right>', ":vertical resize -3<cr>", {}) -- Resize window
vim.api.nvim_set_keymap('n', '<C-S-Up>', ":resize +3<cr>", {}) -- Resize window
vim.api.nvim_set_keymap('n', '<C-S-Down>', ":resize -3<cr>", {}) -- Resize window
vim.api.nvim_set_keymap('n', 'cv', '<plug>(SubversiveSubstitute)', {})
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {})


-- VARIABLES
vim.api.nvim_set_keymap('n', '<S-Up>', ':m-2<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-Down>', ':m+<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<S-Up>', '<Esc>:m-2<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<S-Down>', '<Esc>:m+<CR>', { noremap = true })


-- AUTOCMD
-- Config term appearance
vim.api.nvim_command('augroup terminal_settings')
vim.api.nvim_command('autocmd WinEnter term://* startinsert')
vim.api.nvim_command('autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no')
vim.api.nvim_command('autocmd TermClose * :call nvim_input("<CR>")')
vim.api.nvim_command('augroup END')


-- Auto jump to the last edit
vim.api.nvim_command('augroup editor')
vim.api.nvim_command('autocmd BufReadPost * normal! g`"zv')
vim.api.nvim_command('augroup END')
