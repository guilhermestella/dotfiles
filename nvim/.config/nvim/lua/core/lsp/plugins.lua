local mason = require "mason"
local mason_lspconfig = require "mason-lspconfig"
local mason_installer = require "mason-tool-installer"
local mason_dap = require "mason-nvim-dap"

local installer_opts = {
  ensure_installed = {
    -- LSP
    "angularls",
    "bashls",
    "cssls",
    "html",
    "jdtls",
    "json-lsp",
    "lemminx", -- xml
    "lua_ls",
    "marksman",
    "ts_ls",
    "yaml-language-server",

    -- Formatter
    "google-java-format",
    "stylua",
    "xmlformatter",
    "yamlfmt",

    -- Linters
    "eslint",
    "jsonlint",
    "markdownlint",
    "yamllint",

    -- DAP
    "java-debug-adapter",
    "java-test",
  },
}

mason.setup()
mason_lspconfig.setup()
mason_installer.setup(installer_opts)
mason_dap.setup()
