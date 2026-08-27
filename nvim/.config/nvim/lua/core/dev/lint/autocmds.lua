local fn = require "core.dev.lint.functions"

vim.api.nvim_create_autocmd({ "TextChanged" }, {
    callback = function()
        fn.lint()
    end,
})
