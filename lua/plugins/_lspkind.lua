local lspkind = require('lspkind')
local kind = require('plugins.lsp._kind')
lspkind.init({
    -- enables text annotations
    --
    -- default: true
    with_text = true,

    -- default symbol map
    -- can be either 'default' or
    -- 'codicons' for codicon preset (requires vscode-codicons font installed)
    --
    -- default: 'default'
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = kind.icons,
})

-- require('cmp').setup {
-- 	formatting = {
-- 		format = lspkind.cmp_format(),
-- 	}
-- }
