-- ════════════════════════════════════════════════════════════════════════════
-- Indentation
-- ════════════════════════════════════════════════════════════════════════════
vim.keymap.set("v", "<", "<gv", { desc = "Indent Left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent Right" })

-- ════════════════════════════════════════════════════════════════════════════
-- Move Block (Visual Mode)
-- ════════════════════════════════════════════════════════════════════════════
vim.keymap.set("n", "<A-J>", ":m .+1<CR>==", { silent = true, desc = "Move line down" })
vim.keymap.set("n", "<A-K>", ":m .-2<CR>==", { silent = true, desc = "Move line up" })
vim.keymap.set("v", "<A-J>", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move block down" })
vim.keymap.set("v", "<A-K>", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move block up" })
