local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config("cssls", {
  cmd = { "vscode-css-language-server", "--stdio" },
  capabilities = capabilities,
})
