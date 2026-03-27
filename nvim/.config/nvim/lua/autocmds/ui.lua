-- ════════════════════════════════════════════════════════════════════════════
-- Highlight on yank
-- ════════════════════════════════════════════════════════════════════════════
local ui_group = vim.api.nvim_create_augroup("UI", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = ui_group,
  desc = "Highlight selection on yank",
  callback = function()
    vim.hl.on_yank { timeout = 200, visual = true }
  end,
})
