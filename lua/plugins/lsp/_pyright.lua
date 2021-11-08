local preset = require('plugins.lsp._preset')
local lspconf = require("lspconfig")

lspconf.pyright.setup {
	on_attach = preset.on_attach,
	capabilities = preset.capabilities,
	handlers = {
		["textDocument/publishDiagnostics"] = function() end,
	},
	root_dir = vim.loop.cwd,
}
