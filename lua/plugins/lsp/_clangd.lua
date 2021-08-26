local preset = require('plugins.lsp._preset')
local lspconf = require("lspconfig")

lspconf.clangd.setup {
    on_attach = preset.on_attach,
    filetypes = {"c", "cpp"},
    root_dir = vim.loop.cwd
}
