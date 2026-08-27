local lint = require "lint"

lint.linters_by_ft = {
    lua = { "luacheck" },
    javascript = { "eslint" },
    typescript = { "eslint" },
    javascriptreact = { "eslint" },
    typescriptreact = { "eslint" },
    svelte = { "eslint" },
    vue = { "eslint" },
    markdown = { "markdownlint" },
    yaml = { "yamllint" },
    json = { "jsonlint" },
}
