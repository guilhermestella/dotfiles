-- ════════════════════════════════════════════════════════════════════════════
-- Remove Trailing Whitespaces
-- ════════════════════════════════════════════════════════════════════════════
vim.api.nvim_create_autocmd({ "BufWritePre", "InsertLeave" }, {
  group = vim.api.nvim_create_augroup("remove-trailing-whitespaces", { clear = true }),
  pattern = "*",
  desc = "Remove trailing whitespaces",
  callback = function()
    if vim.bo.modifiable then
      vim.cmd([[%s/\s\+$//e]])
    end
  end
})
