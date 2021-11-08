local preset = require('plugins.lsp._preset')
local lspconf = require("lspconfig")

-- cmd là câu lệnh để chạy server, ở đây là : typescript-language-server --stdio

lspconf.tsserver.setup {
	on_attach = preset.on_attach,
	capabilities = preset.capabilities,
	snippetSupport = true,
	cmd = {"typescript-language-server", "--stdio"},
	root_dir = vim.loop.cwd,
}
