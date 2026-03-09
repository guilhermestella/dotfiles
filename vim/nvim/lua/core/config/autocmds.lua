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
-- Remove Trailing Whitespaces
-- ════════════════════════════════════════════════════════════════════════════
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- ════════════════════════════════════════════════════════════════════════════
-- Auto-save
-- ════════════════════════════════════════════════════════════════════════════
vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave", "ExitPre" }, {
    pattern = "*",
    command = "silent! wall",
})
