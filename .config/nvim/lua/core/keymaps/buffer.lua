-- ════════════════════════════════════════════════════════════════════════════
-- Buffer Navigation
-- ════════════════════════════════════════════════════════════════════════════
vim.keymap.set("n", "<leader>bn", "<cmd>enew<cr>", { desc = "➜ New" })
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "➜ Buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "➜ Buffer" })

