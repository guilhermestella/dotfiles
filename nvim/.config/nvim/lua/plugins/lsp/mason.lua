return {
  {
    "mason-org/mason.nvim",
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "jay-babu/mason-nvim-dap.nvim",
    },
    opts = {},
    config = function()
      local mason = require "mason"
      local mason_lspconfig = require "mason-lspconfig"
      local mason_installer = require "mason-tool-installer"
      local mason_dap = require "mason-nvim-dap"

      mason.setup()
      mason_lspconfig.setup()
      mason_installer.setup {
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
          "google-java-format",
          "stylua",
          "xmlformatter",
          "yamlfmt",

          -- Linters
          "jsonlint",
          "markdownlint",
          "yamllint",

          -- DAP
          "java-debug-adapter",
          "java-test",
        },
      }
      mason_dap.setup()
    end,
  },
}
