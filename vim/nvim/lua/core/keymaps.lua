vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>", { silent = true, desc = "Clear highlight" })

-- Move block
vim.keymap.set("n", "<A-J>", ":m .+1<CR>==", { silent = true, desc = "Move line down" })
vim.keymap.set("n", "<A-K>", ":m .-2<CR>==", { silent = true, desc = "Move line up" })
vim.keymap.set("v", "<A-J>", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move block down" })
vim.keymap.set("v", "<A-K>", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move block up" })

-- Resize 
vim.keymap.set('n', '<C-Up>',       ':resize -2<CR>', { desc = 'Increase height' })
vim.keymap.set('n', '<C-Down>',     ':resize +2<CR>', { desc = 'Decrease height' })
vim.keymap.set('n', '<C-Left>',     ':vertical resize -2<CR>', { desc = 'Decrease width' })
vim.keymap.set('n', '<C-Right>',    ':vertical resize +2<CR>', { desc = 'Increase width' })

