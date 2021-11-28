-- Load default settings first
require('settings._preload')
require('settings._options')

-- User configurations load when bufread event
vim.api.nvim_command('augroup startup')
vim.api.nvim_command('autocmd BufReadPost * :lua require("settings._mappings")')
vim.api.nvim_command('autocmd BufReadPost * :lua require("settings._postload")')
vim.api.nvim_command('augroup END')
