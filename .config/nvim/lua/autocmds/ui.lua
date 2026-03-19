-- ════════════════════════════════════════════════════════════════════════════
-- Open Help in Vertical Tab
-- ════════════════════════════════════════════════════════════════════════════
local ui_group = vim.api.nvim_create_augroup("UI", { clear = true })

vim.api.nvim_create_autocmd("VimResized", {
  group = ui_group,
  desc = "Auto resize splits when windows are resized",
  command = "wincmd =",
})

vim.api.nvim_create_autocmd("FileType", {
  group = ui_group,
  pattern = "help",
  desc = "Opens help in vertical tab",
  command = "wincmd L",
})

-- ════════════════════════════════════════════════════════════════════════════
-- Highlight on yank
-- ════════════════════════════════════════════════════════════════════════════
vim.api.nvim_create_autocmd("TextYankPost", {
  group = ui_group,
  desc = "Highlight selection on yank",
  callback = function()
    vim.hl.on_yank({ timeout = 200, visual = true })
  end
})
