-- ════════════════════════════════════════════════════════════════════════════
-- Diagnostics
-- ════════════════════════════════════════════════════════════════════════════
local diagnostic_opts = { focusable = false }
vim.keymap.set("n", "<C-w>d", function()
    vim.diagnostic.open_float(diagnostic_opts)
end, { desc = "➜ Show Diagnostic" })
vim.keymap.set("n", "[d", function()
    vim.diagnostic.goto_prev({ float = { focusable = false } })
end, { desc = "➜ Diagnostic" })
vim.keymap.set("n", "]d", function()
    vim.diagnostic.goto_next({ float = { focusable = false } })
end, { desc = "➜ Diagnostic" })

