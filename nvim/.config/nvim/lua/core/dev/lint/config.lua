local lint = require "lint"

-- Stop the eslint_d daemon when Neovim exits instead of leaving it idle for 15 minutes.
vim.env.ESLINT_D_PPID = vim.fn.getpid()

lint.linters_by_ft = {
    lua = { "luacheck" },
    javascript = { "eslint_d" },
    typescript = { "eslint_d" },
    javascriptreact = { "eslint_d" },
    typescriptreact = { "eslint_d" },
    svelte = { "eslint_d" },
    vue = { "eslint_d" },
    markdown = { "markdownlint" },
    yaml = { "yamllint" },
    json = { "jsonlint" },
}
