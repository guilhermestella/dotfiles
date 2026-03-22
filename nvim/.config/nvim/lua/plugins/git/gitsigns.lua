return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gitsigns = require("gitsigns")

          -- Hunk
          vim.keymap.set("n", "ghp", gitsigns.preview_hunk, { buffer = bufnr, desc = "➜ Preview" })
          vim.keymap.set("n", "ghr", gitsigns.reset_hunk, { buffer = bufnr, desc = "➜ Reset" })
          vim.keymap.set("v", "ghr", function()
            gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, { buffer = bufnr, desc = "➜ Reset" })
          vim.keymap.set("n", "ghR", gitsigns.reset_buffer, { buffer = bufnr, desc = "➜ Reset All" })

          -- Previous/Next
          vim.keymap.set("n", "[h", function()
            gitsigns.nav_hunk("prev")
          end, { buffer = bufnr, desc = "➜ Hunk" })

          vim.keymap.set("n", "]h", function()
            gitsigns.nav_hunk("next")
          end, { buffer = bufnr, desc = "➜ Hunk" })
        end,
      })
    end,
  },
}
