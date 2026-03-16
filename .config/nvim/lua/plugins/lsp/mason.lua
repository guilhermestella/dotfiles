return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = {
        -- LSP
        "bashls",
        "jdtls",
        "json-lsp",
        "lua_ls",
        "marksman",
        "yaml-language-server",

        -- Formatter
        "yamlfmt",

        -- Linters
        "jsonlint",
        "markdownlint",
        "yamllint",

        -- DAP
        "java-debug-adapter",
        "java-test",
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "mfussenegger/nvim-dap",
    },
  },
}
