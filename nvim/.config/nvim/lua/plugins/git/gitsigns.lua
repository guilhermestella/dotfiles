return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {
        on_attach = function(bufnr)
          local gitsigns = require "gitsigns"

          -- Hunk
          vim.keymap.set("n", "ghp", gitsigns.preview_hunk, { buffer = bufnr, desc = "➜ Preview" })
          vim.keymap.set("n", "ghr", gitsigns.reset_hunk, { buffer = bufnr, desc = "➜ Reset" })
          vim.keymap.set("v", "ghr", function()
            gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
          end, { buffer = bufnr, desc = "➜ Reset" })
          vim.keymap.set("n", "ghR", gitsigns.reset_buffer, { buffer = bufnr, desc = "➜ Reset All" })

          -- Toggle Blame
          vim.keymap.set("n", "<M-y>", function()
            local current_buf = vim.api.nvim_get_current_buf()

            if vim.bo[current_buf].filetype == "gitsigns-blame" then
              vim.cmd "bdelete!"
              return
            end

            local found = false
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              local buf = vim.api.nvim_win_get_buf(win)
              if vim.bo[buf].filetype == "gitsigns-blame" then
                vim.api.nvim_win_close(win, false)
                found = true
                break
              end
            end
            if not found then
              gitsigns.blame { full = false }
            end
          end, { desc = "➜ Toggle Blame" })

          -- Previous/Next
          vim.keymap.set("n", "[h", function()
            gitsigns.nav_hunk "prev"
          end, { buffer = bufnr, desc = "➜ Hunk" })

          vim.keymap.set("n", "]h", function()
            gitsigns.nav_hunk "next"
          end, { buffer = bufnr, desc = "➜ Hunk" })
        end,
      }
    end,
  },
}
