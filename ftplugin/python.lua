-- Python
vim.api.nvim_command('augroup python')
vim.api.nvim_command('autocmd BufRead *.py setlocal ts=4 sw=4')
vim.api.nvim_command('augroup END')
