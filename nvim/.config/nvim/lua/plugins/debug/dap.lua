return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      -- gain access to the dap plugin and its functions
      local dap = require("dap")
      -- gain access to the dap ui plugin and its functions
      local dapui = require("dapui")
      -- gain access to the dap widgets
      local widgets = require('dap.ui.widgets')

      -- Setup the dap ui with default configuration
      dapui.setup()

      -- setup an event listener for when the debugger is launched
      dap.listeners.before.launch.dapui_config = function()
        -- when the debugger is launched open up the debug ui
        dapui.open()
      end

      -- Breakpoint
      vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "➜ Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>dT", function()
        dap.toggle_breakpoint(vim.fn.input('Condition: '))
      end, { desc = "➜ Toggle Conditional Breakpoint" })

      -- Navigation
      vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "➜ Continue" })
      vim.keymap.set("n", "<leader>dsi", dap.step_into, { desc = "➜ Step Into" })
      vim.keymap.set("n", "<leader>dsn", dap.step_over, { desc = "➜ Step Next" })
      vim.keymap.set("n", "<leader>dso", dap.step_out, { desc = "➜ Step Out" })

      -- Widgets
      vim.keymap.set("n", "<leader>de", dap.step_out, { desc = "➜ Evaluate" })
      vim.keymap.set("n", "<leader>dE", dap.step_out, { desc = "➜ Evaluate Code" })

      -- UI
      vim.keymap.set("n", "<leader>dq", dapui.close, { desc = "➜ Quit" })
    end,
  },
}
