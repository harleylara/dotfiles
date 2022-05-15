local servers = { 'pyright', 'tsserver' }

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions

  -- Formatting using lsp-format plugin
  require "lsp-format".on_attach(client)
end

for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
      on_attach = on_attach
  }
end

local saga = require('lspsaga')
saga.init_lsp_saga()
