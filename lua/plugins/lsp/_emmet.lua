local preset = require('plugins.lsp._preset')
local lspconf = require("lspconfig")
local configs = require("lspconfig/configs")

configs.emmet_ls = {
	default_config = {
		snippetSupport = true,
		filetypes = {"html", "css", "javascriptreact"},
		cmd = {"emmet-ls", "--stdio"},
		root_dir = vim.loop.cwd,
	}
}

lspconf.emmet_ls.setup {
	on_attach = preset.on_attach,
}
