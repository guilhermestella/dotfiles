return {
  {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
      local conform = require("conform")

      local fmt = function()
        conform.format({
          async = true,
          lsp_fallback = true,
        })
      end
      vim.keymap.set("n", "==", fmt, { noremap = true, desc = "Format file" })
      vim.keymap.set("v", "=", fmt, { noremap = true, desc = "Format selection" })

      -- Auto indent after paste
      local paste_and_fmt = function(key)
        return function()
          local start_line = vim.fn.line(".")
          vim.cmd("normal! " .. key)
          local end_line = vim.fn.line(".")

          -- ensure start <= end
          local range_start = math.min(start_line, end_line)
          local range_end = math.max(start_line, end_line)

          conform.format({
            async = true,
            lsp_fallback = true,
            range = {
              start = { range_start, 0 },
              ["end"] = { range_end, 0 },
            },
          })
        end
      end
      vim.keymap.set("n", "p", paste_and_fmt("p"), { desc = "Paste and indent" })
      vim.keymap.set("n", "P", paste_and_fmt("P"), { desc = "Paste (before) and indent" })
    end,
  },
}
