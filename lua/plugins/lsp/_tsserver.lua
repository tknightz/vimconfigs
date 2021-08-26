local preset = require('plugins.lsp._preset')
local lspconf = require("lspconfig")

lspconf.tsserver.setup {
  on_attach = preset.on_attach,
  snippetSupport = true,
  cmd = {"typescript-language-server", "--stdio"},
  root_dir = vim.loop.cwd,
}
