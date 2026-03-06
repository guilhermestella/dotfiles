-- ════════════════════════════════════════════════════════════════════════════
-- Sync file changed externally
-- ════════════════════════════════════════════════════════════════════════════
vim.o.autoread = true
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
  pattern = '*',
  command = 'silent! checktime',
  desc = 'Reload file'
})

-- ════════════════════════════════════════════════════════════════════════════
-- Highlight on yank
-- ════════════════════════════════════════════════════════════════════════════
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.hl.on_yank()
    end,
})

-- ════════════════════════════════════════════════════════════════════════════
-- Diagnostics
-- ════════════════════════════════════════════════════════════════════════════
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = "rounded",
            source = "if_many",
            scope = "cursor",
        })
    end,
})
