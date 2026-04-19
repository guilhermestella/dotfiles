local dap = require "dap"
local ui = require "dapui"
local fn = require "core.dev.debug.functions"

---@diagnostic disable: undefined-field
dap.listeners.after.event_initialized["on_start"] = function()
  ui.close { layout = 2 }
  ui.open { layout = 1 }
end

dap.listeners.after.event_stopped["on_stop"] = function(_, body)
  local reason = body.reason
  if reason == "breakpoint" then
    ui.close { layout = 1 }
    ui.open { layout = 2 }
  end
end

dap.listeners.after.continue["on_continue"] = function()
  ui.close { layout = 2 }
  ui.open { layout = 1 }
end

dap.listeners.after.event_terminated["on_finish"] = function()
  ui.close { layout = 2 }
  ui.open { layout = 1 }
end

dap.defaults.fallback.switchbuf = "usevisible,usetab,newtab"

ui.setup {
  icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
  controls = {
    icons = {
      pause = "⏸",
      play = "▶",
      step_into = "⏎",
      step_over = "⏭",
      step_out = "⏮",
      step_back = "b",
      run_last = "▶▶",
      terminate = "⏹",
      disconnect = "⏏",
    },
  },
  expand_lines = true,
  floating = { border = "rounded" },
  render = {
    max_type_length = 60,
    max_value_lines = 200,
  },
  layouts = {
    {
      id = "1",
      elements = {
        { id = "console", size = 0.70 },
        { id = "repl", size = 0.30 },
      },
      size = 15,
      position = "bottom",
    },
    {
      id = "2",
      elements = {
        { id = "stacks", size = 0.30 },
        { id = "scopes", size = 0.70 },
      },
      size = 15,
      position = "bottom",
    },
  },
}

dap.adapters = fn.get_files "adapters"
dap.configurations = fn.get_files "configurations"
