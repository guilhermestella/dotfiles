-- ════════════════════════════════════════════════════════════════════════════
-- Diagnostics
-- ════════════════════════════════════════════════════════════════════════════
vim.diagnostic.config({
  jump = {
    on_jump = function(bufnr)
      vim.diagnostic.open_float({
        bufnr = bufnr,
        scope = "cursor",
        focus = false,
        focusable = true,
      })
    end,
  },
})

vim.keymap.set("n", "<C-w>d", vim.diagnostic.open_float, { desc = "➜ Show Diagnostic" })
vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, { desc = "➜ Diagnostic" })
vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, { desc = "➜ Diagnostic" })
