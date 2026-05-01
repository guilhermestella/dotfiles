local win_group = vim.api.nvim_create_augroup("win_group", { clear = true })

vim.api.nvim_create_autocmd("BufReadPost", {
  group = win_group,
  desc = "Restore cursor to its position when file is reopened",
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.api.nvim_win_set_cursor(0, mark)
      vim.schedule(function()
        vim.cmd.normal { "zz", bang = true }
      end)
    end
  end,
})

vim.api.nvim_create_autocmd({ "VimResume", "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  group = win_group,
  desc = "Sync file changed externally",
  command = "silent! checktime",
})

-- vim.api.nvim_create_autocmd({ "VimLeavePre", "VimSuspend", "FocusLost", "InsertLeave", "TextChanged" }, {
--   group = win_group,
--   desc = "Auto save all files on focus lost",
--   command = "silent! update",
-- })
--
-- vim.api.nvim_create_autocmd({ "BufLeave", "WinLeave" }, {
--   group = win_group,
--   desc = "Auto save buffer",
--   callback = function()
--     if vim.bo.modified and vim.bo.buftype == "" and vim.fn.expand "%" ~= "" then
--       vim.cmd.write { bang = true }
--     end
--   end,
-- })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = win_group,
  desc = "Highlight selection on yank",
  callback = function()
    vim.hl.on_yank { timeout = 200, visual = true }
  end,
})
