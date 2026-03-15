-- ════════════════════════════════════════════════════════════════════════════
-- Auto-save
-- ════════════════════════════════════════════════════════════════════════════
vim.api.nvim_create_autocmd({ "VimSuspend", "FocusLost", "BufLeave", "ExitPre" }, {
  pattern = "*",
  command = "silent! wall",
})
