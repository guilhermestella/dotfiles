local dap = require "dap"
local ui = require "dapui"
local snacks = require "snacks"

local M = {}

function M.toggle_conditional_breakpoint()
  snacks.input({
    prompt = "Search: ",
    win = { relative = "cursor" },
  }, function(input)
    dap.toggle_breakpoint(input)
  end)
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

function M.get_files(source)
  local path = vim.fn.stdpath "config" .. "/lua/core/debug/" .. source
  local files = vim.fn.glob(path .. "/*.lua", false, true)
  local target = {}
  for _, file in ipairs(files) do
    local name = vim.fn.fnamemodify(file, ":t:r")
    target[name] = require("core.debug." .. source .. "." .. name)
  end
  return target
end

return M
