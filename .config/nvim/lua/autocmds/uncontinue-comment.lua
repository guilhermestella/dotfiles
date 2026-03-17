-- ════════════════════════════════════════════════════════════════════════════
-- Uncontinue Comment
-- ════════════════════════════════════════════════════════════════════════════
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("no_auto_comment", {}),
  pattern = "*",
  desc = "Do not continue comment on new line",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})
