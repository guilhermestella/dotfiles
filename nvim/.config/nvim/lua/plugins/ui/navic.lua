return {
  {
    "SmiteshP/nvim-navic",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-lualine/lualine.nvim",
    },
    opts = {
      lsp = {
        auto_attach = true,
        preference = { "jdtls", "spring-boot" },
      },
      highlight = true,
      separator = " > ",
      depth_limit = 8,
      depth_limit_indicator = "...",
      lazy_update_context = false,
    },
  },
}
