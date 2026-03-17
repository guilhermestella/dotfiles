-- ════════════════════════════════════════════════════════════════════════════
-- Open Help in Vertical Tab
-- ════════════════════════════════════════════════════════════════════════════
vim.api.nvim_create_autocmd("VimResized", {
  pattern = "*",
  desc = "Auto resize splits when windows are resized",
  command = "wincmd =",
})
