local lint = require "lint"

local M = {}

function M.lint()
    lint.try_lint(nil, { async = true })
end

return M
