require('plugins.lsp._default')
require('plugins.lsp._gopls')
require('plugins.lsp._html')
require('plugins.lsp._cssls')
require('plugins.lsp._clangd')
require('plugins.lsp._sumneko')
require('plugins.lsp._tsserver')
require('plugins.lsp._pyright')
require('plugins.lsp._efm')
-- require('plugins.lsp._lsemmet')



-- replace the default lsp diagnostic letters with prettier symbols
--[[
	error = "",
	warning = "",
	hint = "",
	information = "",
]]
vim.fn.sign_define("LspDiagnosticsSignError", {text = " ", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = " ", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = " ", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = " ", numhl = "LspDiagnosticsDefaultHint"})
