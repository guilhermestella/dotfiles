-- ════════════════════════════════════════════════════════════════════════════
-- Open Help in Vertical Tab
-- ════════════════════════════════════════════════════════════════════════════
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  desc = "Opens Help in Vertical Tab",
  command = "wincmd L",
})
