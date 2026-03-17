vim.lsp.config("lemminx", {
  cmd = { "lemminx" },
  filetypes = { "xml", "xsd", "xsl", "xslt", "svg" },
  root_markers = { ".git" },
  settings = {
    xml = {
      validation = {
        enabled = true,
      },
      completion = {
        autoCloseTags = true,
      },
      format = {
        enabled = true,
        splitAttributes = false,
      },
    },
  },
})

vim.lsp.enable("lemminx")
