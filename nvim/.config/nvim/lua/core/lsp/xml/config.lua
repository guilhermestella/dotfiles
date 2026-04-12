vim.lsp.config("lemminx", {
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
