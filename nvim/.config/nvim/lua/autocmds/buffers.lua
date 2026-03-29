-- ════════════════════════════════════════════════════════════════════════════
-- Buffer Auto Commands
-- ════════════════════════════════════════════════════════════════════════════
local buffers_group = vim.api.nvim_create_augroup("Buffers", { clear = true })

-- ════════════════════════════════════════════════════════════════════════════
-- Restore cursor position
-- ════════════════════════════════════════════════════════════════════════════
vim.api.nvim_create_autocmd("BufReadPost", {
  group = buffers_group,
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

-- ════════════════════════════════════════════════════════════════════════════
-- Sync file changed externally
-- ════════════════════════════════════════════════════════════════════════════
vim.api.nvim_create_autocmd({ "VimResume", "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  group = buffers_group,
  desc = "Sync file changed externally",
  command = "silent! checktime",
})

vim.api.nvim_create_autocmd({ "VimLeavePre", "VimSuspend", "FocusLost", "InsertLeave", "TextChanged" }, {
  group = buffers_group,
  desc = "Auto save all files on focus lost",
  command = "silent! update",
})

-- ════════════════════════════════════════════════════════════════════════════
-- Auto-save
-- ════════════════════════════════════════════════════════════════════════════
vim.api.nvim_create_autocmd({ "BufLeave", "WinLeave" }, {
  group = buffers_group,
  desc = "Auto save buffer",
  callback = function()
    if vim.bo.modified and vim.bo.buftype == "" and vim.fn.expand "%" ~= "" then
      vim.cmd.write { bang = true }
    end
  end,
})
