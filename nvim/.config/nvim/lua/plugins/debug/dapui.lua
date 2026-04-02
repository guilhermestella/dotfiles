return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "nvim-neotest/nvim-nio",
  },
  keys = function()
    local ui = require "dapui"

    local toggle_console = function()
      ui.toggle { layout = 1 }
      ui.close { layout = 2 }
    end

    local toggle_debug = function()
      ui.toggle { layout = 2 }
      ui.close { layout = 1 }
    end

    vim.keymap.set({ "n", "v" }, "<M-e>", ui.eval, { desc = "➜ Evaluate" })
    vim.keymap.set("n", "<M-d>", toggle_console, { desc = "➜ Console" })
    vim.keymap.set("n", "<M-D>", toggle_debug, { desc = "➜ Console" })
    vim.keymap.set("n", "<leader>tq", ui.close, { desc = "➜ Quit" })
  end,
  opts = {
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
          { id = "scopes", size = 0.70 },
          { id = "stacks", size = 0.30 },
        },
        size = 15,
        position = "bottom",
      },
    },
  },
}
