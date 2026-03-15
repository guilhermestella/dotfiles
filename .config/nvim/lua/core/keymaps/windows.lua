-- ════════════════════════════════════════════════════════════════════════════
-- Window Navigation (no prefix for speed)
-- ════════════════════════════════════════════════════════════════════════════

-- Tab navigation is defined in tmux.lua plugin

-- Resize
vim.keymap.set({ "t", "n" }, "<M-k>", ":resize -2<CR>", { desc = "Increase height" })
vim.keymap.set({ "t", "n" }, "<M-j>", ":resize +2<CR>", { desc = "Decrease height" })
vim.keymap.set({ "t", "n" }, "<M-h>", ":vertical resize -2<CR>", { desc = "Decrease width" })
vim.keymap.set({ "t", "n" }, "<M-l>", ":vertical resize +2<CR>", { desc = "Increase width" })
