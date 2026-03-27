return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      local select = require "nvim-treesitter-textobjects.select"
      local move = require "nvim-treesitter-textobjects.move"

      require("nvim-treesitter-textobjects").setup {
        select = {
          lookahead = true,
          selection_modes = {
            ["@parameter.outer"] = "v",
            ["@function.outer"] = "V",
            ["@class.outer"] = "V",
          },
          include_surrounding_whitespace = false,
        },
        move = {
          set_jumps = true,
        },
      }

      -- Select
      vim.keymap.set({ "x", "o" }, "af", function()
        select.select_textobject("@function.outer", "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "if", function()
        select.select_textobject("@function.inner", "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "ac", function()
        select.select_textobject("@class.outer", "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "ic", function()
        select.select_textobject("@class.inner", "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "aa", function()
        select.select_textobject("@parameter.outer", "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "ia", function()
        select.select_textobject("@parameter.inner", "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "as", function()
        select.select_textobject("@local.scope", "locals")
      end)

      -- Move
      vim.keymap.set({ "n", "x", "o" }, "]f", function()
        move.goto_next_start({ "@function.outer", "@class.outer" }, "textobjects")
      end, { desc = "➜ Function" })
      vim.keymap.set({ "n", "x", "o" }, "[f", function()
        move.goto_previous_start({ "@function.outer", "@class.outer" }, "textobjects")
      end, { desc = "➜ Function" })
    end,
  },
}
