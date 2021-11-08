local preset = require('plugins.lsp._preset')
local lspconf = require("lspconfig")

lspconf.gopls.setup {
    on_attach = preset.on_attach,
		capabilities = preset.capabilities,
    filetypes = {"go", "gomod"},
    message_level = vim.lsp.protocol.MessageType.Error,
    cmd = {
        "gopls", -- share the gopls instance if there is one already
        "-remote=auto", --[[ debug options ]] --
        "-logfile=auto",
        "-debug=:0",
        "-remote.debug=:0",
        "-rpc.trace",
    },
    root_dir = vim.loop.cwd,
}
