-- ════════════════════════════════════════════════════════════════════════════
-- Auto-save
-- ════════════════════════════════════════════════════════════════════════════
local autosave_group = vim.api.nvim_create_augroup("auto-save", { clear = true })

vim.api.nvim_create_autocmd({ "VimSuspend", "FocusLost" }, {
  group = autosave_group,
  pattern = "*",
  desc = "Auto save all files on focus lost",
  callback = function()
    vim.cmd("silent! wall")
  end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "WinLeave" }, {
  group = autosave_group,
  pattern = "*",
  desc = "Auto save buffer",
  callback = function()
    if vim.bo.modified and vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
      vim.cmd("silent! write")
    end
  end,
})
