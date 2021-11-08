local preset = require('plugins.lsp._preset')
local lspconf = require("lspconfig")

lspconf.cssls.setup {
	capabilities = preset.capabilities,
  on_attach = preset.on_attach,
  snippetSupport = true,
  cmd = {"css-languageserver", "--stdio"},
  root_dir = vim.loop.cwd,
}
