-- ════════════════════════════════════════════════════════════════════════════
-- Editing Auto Commands
-- ════════════════════════════════════════════════════════════════════════════
local edit_group = vim.api.nvim_create_augroup("Editing", { clear = true })

-- ════════════════════════════════════════════════════════════════════════════
-- Remove Trailing Whitespaces
-- ════════════════════════════════════════════════════════════════════════════
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = edit_group,
  desc = "Remove trailing whitespaces",
  callback = function()
    if vim.bo.modifiable then
      vim.cmd [[%s/\s\+$//e]]
    end
  end,
})

-- ════════════════════════════════════════════════════════════════════════════
-- Uncontinue Comment
-- ════════════════════════════════════════════════════════════════════════════
vim.api.nvim_create_autocmd("FileType", {
  group = edit_group,
  desc = "Do not continue comment on new line",
  callback = function()
    vim.opt_local.formatoptions:remove { "c", "r", "o" }
  end,
})

-- ════════════════════════════════════════════════════════════════════════════
-- Record - cmdheight bug (https://github.com/neovim/neovim/issues/20635)
-- ════════════════════════════════════════════════════════════════════════════
vim.api.nvim_create_autocmd("RecordingEnter", {
  group = edit_group,
  desc = "Add cmdheight when start recording",
  callback = function()
    vim.opt.cmdheight = 1
  end,
})
vim.api.nvim_create_autocmd("RecordingLeave", {
  group = edit_group,
  desc = "Remove cmdheight when finishing recording",
  callback = function()
    vim.opt.cmdheight = 0
  end,
})
