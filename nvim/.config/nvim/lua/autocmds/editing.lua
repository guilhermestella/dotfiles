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
