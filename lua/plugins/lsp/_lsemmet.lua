local lspconfig = require'lspconfig'
local configs = require'lspconfig/configs'
local preset = require('plugins.lsp._preset')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

configs.ls_emmet = {
  default_config = {
    cmd = { 'ls_emmet', '--stdio' };
    filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'haml',
      'xml', 'xsl', 'pug', 'slim', 'sass', 'stylus', 'less', 'sss'};
    root_dir = function(fname)
      return vim.loop.cwd()
    end;
    settings = {};
  }
}

lspconfig.ls_emmet.setup{
	on_attach = preset.on_attach,
	capabilities = capabilities,
}
