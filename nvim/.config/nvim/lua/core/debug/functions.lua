local dap = require "dap"
local ui = require "dapui"

local M = {}

function M.toggle_conditional_breakpoint()
  dap.toggle_breakpoint(vim.fn.input "Condition: ")
end

function M.toggle_console()
  ui.toggle { layout = 1 }
  ui.close { layout = 2 }
end

function M.toggle_debug()
  ui.toggle { layout = 2 }
  ui.close { layout = 1 }
end

M.eval = ui.eval
M.close = ui.close
M.continue = dap.continue
M.step_over = dap.step_over
M.step_into = dap.step_into
M.step_out = dap.step_out
M.toggle_breakpoint = dap.toggle_breakpoint

return M
