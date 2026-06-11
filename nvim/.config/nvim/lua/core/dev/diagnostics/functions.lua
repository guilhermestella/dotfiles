local trouble = require "trouble"

local M = {}

function M.show_diagnostics()
  trouble.toggle { mode = "diagnostics" }
end

function M.show_buffer_diagnostics()
  trouble.toggle { mode = "diagnostics", filter = { buf = 0 } }
end

function M.open_diagnostic()
  vim.diagnostic.open_float()
end

function M.goto_next_diagnostic()
  vim.diagnostic.jump { count = 1 }
end

function M.goto_previous_diagnostic()
  vim.diagnostic.jump { count = -1 }
end

return M
