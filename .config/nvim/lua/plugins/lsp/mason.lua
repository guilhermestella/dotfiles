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
        "lemminx", -- xml
        "lua_ls",
        "marksman",
        "yaml-language-server",

        -- Formatter
        "xmlformatter",
        "yamlfmt",
        "google-java-format",

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
