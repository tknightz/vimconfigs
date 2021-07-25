-- require 'lspinstall'.setup()
-- 
-- local servers = require'lspinstall'.installed_servers()
-- for _, server in pairs(servers) do
--   require'lspconfig'[server].setup{}
-- end


function on_attach(client)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = {noremap = true, silent = true}


    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<space>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<space>F", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end
end

local lspconf = require("lspconfig")

-- these langs require same lspconfig so put em all in a table and loop through!
local servers = {"html", "cssls", "tsserver", "pyright", "bashls", "clangd", "ccls"}

for _, lang in ipairs(servers) do
    lspconf[lang].setup {
        on_attach = on_attach,
        root_dir = vim.loop.cwd
    }
end

-- vls conf example
local vls_binary = "/usr/local/bin/vls"
lspconf.vls.setup {
    cmd = {vls_binary}
}

-- lua lsp settings
USER = "/home/" .. vim.fn.expand("$USER")

local sumneko_root_path = USER .. "/.config/lua-language-server"
local sumneko_binary = USER .. "/.config/lua-language-server/bin/Linux/lua-language-server"

lspconf.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    root_dir = function()
        return vim.loop.cwd()
    end,
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
        }
    }
}

-- replace the default lsp diagnostic letters with prettier symbols
vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})
