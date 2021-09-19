local preset = require('plugins.lsp._preset')
local lspconf = require("lspconfig")

USER = "/home/" .. vim.fn.expand("$USER")

local sumneko_root_path = USER .. "/Downloads/Apps/lua-language-server"
local sumneko_binary = USER .. "/Downloads/Apps/lua-language-server/bin/Linux/lua-language-server"

lspconf.sumneko_lua.setup {
    on_attach = preset.on_attach,
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    root_dir = vim.loop.cwd,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = vim.split(package.path, ";")
            },
            diagnostics = {
                globals = {"vim"}
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                }
            },
            telemetry = {
                enable = false
            }
        },
    }
}
