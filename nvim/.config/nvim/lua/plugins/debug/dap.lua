return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "rcarriga/nvim-dap-ui",
    },
    keys = function()
      ---@diagnostic disable: undefined-field
      local dap = require "dap"

      local fn_input_breakpoint = function()
        dap.toggle_breakpoint(vim.fn.input "Condition: ")
      end

      -- Key maps with F keys: M-F7 = <F19>, C-F7 = <F31>, C-F8 = <F32>
      vim.keymap.set("n", "<F31>", fn_input_breakpoint, { desc = "➜ Toggle Conditional Breakpoint" })
      vim.keymap.set("n", "<F32>", dap.toggle_breakpoint, { desc = "➜ Toggle Breakpoint" })

      vim.keymap.set("n", "<F9>", dap.continue, { desc = "➜ Continue" })
      vim.keymap.set("n", "<F8>", dap.step_over, { desc = "➜ Step Next" })
      vim.keymap.set("n", "<F7>", dap.step_into, { desc = "➜ Step Into" })
      vim.keymap.set("n", "<F19>", dap.step_out, { desc = "➜ Step Out" })
    end,
    config = function()
      ---@diagnostic disable: undefined-field
      local dap = require "dap"
      local ui = require "dapui"

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

      dap.listeners.after.event_terminated["on_finish"] = function()
        ui.close { layout = 2 }
        ui.open { layout = 1 }
      end

      dap.defaults.fallback.switchbuf = "usevisible,usetab,newtab"
    end,
  },
}
