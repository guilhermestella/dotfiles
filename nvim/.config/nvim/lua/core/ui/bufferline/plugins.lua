require("barbar").setup {
  sidebar_filetypes = {
    ["neo-tree"] = {
      event = "BufWipeout",
    },
  },
  minimum_padding = 2,
}
