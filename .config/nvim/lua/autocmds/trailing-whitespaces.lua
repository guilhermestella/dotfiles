-- ════════════════════════════════════════════════════════════════════════════
-- Remove Trailing Whitespaces
-- ════════════════════════════════════════════════════════════════════════════
vim.api.nvim_create_autocmd({ "BufWritePre", "InsertLeave" }, {
  group = vim.api.nvim_create_augroup("remove-trailing-whitespaces", { clear = true }),
  pattern = "*",
  desc = "Remove trailing whitespaces",
  command = [[%s/\s\+$//e]],
})
