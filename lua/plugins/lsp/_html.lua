local preset = require('plugins.lsp._preset')
local lspconf = require("lspconfig")

lspconf.html.setup {
    on_attach = preset.on_attach,
	-- capabilities = preset.capabilities,
    cmd = {"html-languageserver", "--stdio"},
    filetypes = {"html"},
    init_options = {
        configurationSection = {"html", "css", "javascript"},
        embeddedLanguages = {
            css = true,
            javascript = true
        }
    },
    settings = {}
}
