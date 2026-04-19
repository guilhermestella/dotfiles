local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config("jsonls", {
  capabilities = capabilities,
  settings = {
    json = {
      validate = { enable = true },
      schemas = require("schemastore").json.schemas(),
    },
  },
})
