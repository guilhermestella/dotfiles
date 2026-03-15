-- ════════════════════════════════════════════════════════════════════════════
-- Sync file changed externally
-- ════════════════════════════════════════════════════════════════════════════
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "VimResume", "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  command = "silent! checktime",
  desc = "Reload file",
})
