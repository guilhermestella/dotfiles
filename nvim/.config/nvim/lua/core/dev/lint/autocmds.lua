local fn = require "core.dev.lint.functions"

vim.api.nvim_create_autocmd({ "BufEnter", "TextChanged" }, {
    callback = function()
        fn.lint()
    end,
})
