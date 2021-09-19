require('lspkind').init({
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
    symbol_map = {
      Text = '',
      Method = ' ',
      Function = ' ',
      ['function'] = ' ',
      Constructor = ' ',
      Variable = ' ',
      Class = ' ',
      Interface = ' ',
      Module = ' ',
      Property = '',
      Unit = '',
      Value = ' ',
      Enum = ' ',
      Keyword = ' ',
      Snippet = '﬌',
      Color = ' ',
      File = '',
      Folder = ' ',
      EnumMember = ' ',
      Constant = 'ﮡ ',
      Struct = '  ',
      Field = '柳'
    },
})
