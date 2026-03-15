-- ════════════════════════════════════════════════════════════════════════════
-- LSP
-- ════════════════════════════════════════════════════════════════════════════
local hover_opts = { focusable = false, max_height = 25, max_width = 120 }
vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover(hover_opts)
end, { desc = "Hover documentation" })
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc = "LSP Rename Symbol" })
vim.keymap.set({ "n", "v" }, "<M-CR>", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, { desc = "➜ Code Action" })
vim.keymap.set({ "n", "v" }, "<leader>lo", function()
    vim.lsp.buf.code_action({
        context = { only = { "refactor.extract" } },
        apply = true,
    })
end, { desc = "➜ Extract Method" })
vim.keymap.set("n", "<leader>lo", function()
    vim.lsp.buf.code_action({
        context = { only = { "source.organizeImports" } },
        apply = true,
    })
end, { desc = "➜ Organize Imports" })

