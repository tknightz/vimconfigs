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
vim.fn.sign_define("DiagnosticSignError", {text = " ", numhl = "LspDiagnosticsDefaultError", texthl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("DiagnosticSignWarning", {text = " ", numhl = "LspDiagnosticsDefaultWarning", texthl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("DiagnosticSignInformation", {text = " ", numhl = "LspDiagnosticsDefaultInformation", texthl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("DiagnosticSignHint", {text = " ", numhl = "LspDiagnosticsDefaultHint", texthl = "LspDiagnosticsDefaultHint"})
