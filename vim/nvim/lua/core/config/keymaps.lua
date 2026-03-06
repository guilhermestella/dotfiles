-- ════════════════════════════════════════════════════════════════════════════
-- Essential Operations
-- ════════════════════════════════════════════════════════════════════════════
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>", { silent = true, desc = "Clear highlight" })

-- ════════════════════════════════════════════════════════════════════════════
-- Window Navigation (no prefix for speed)
-- ════════════════════════════════════════════════════════════════════════════

-- Tab navigation is defined in tmux.lua plugin

-- Resize
vim.keymap.set('n', '<C-Up>',       ':resize -2<CR>', { desc = 'Increase height' })
vim.keymap.set('n', '<C-Down>',     ':resize +2<CR>', { desc = 'Decrease height' })
vim.keymap.set('n', '<C-Left>',     ':vertical resize -2<CR>', { desc = 'Decrease width' })
vim.keymap.set('n', '<C-Right>',    ':vertical resize +2<CR>', { desc = 'Increase width' })

-- ════════════════════════════════════════════════════════════════════════════
-- Buffer Navigation (no prefix for speed)
-- ════════════════════════════════════════════════════════════════════════════
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- ════════════════════════════════════════════════════════════════════════════
-- Move Block (Visual Mode)
-- ════════════════════════════════════════════════════════════════════════════

vim.keymap.set("n", "<A-J>", ":m .+1<CR>==", { silent = true, desc = "Move line down" })
vim.keymap.set("n", "<A-K>", ":m .-2<CR>==", { silent = true, desc = "Move line up" })
vim.keymap.set("v", "<A-J>", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move block down" })
vim.keymap.set("v", "<A-K>", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move block up" })

-- ════════════════════════════════════════════════════════════════════════════
-- Editing
-- ════════════════════════════════════════════════════════════════════════════

-- Auto indent after paste
vim.keymap.set("n", "p", "p=']", { desc = "Paste and indent" })
vim.keymap.set("n", "P", "P=']", { desc = "Paste (before) and indent" })

-- Better indenting (stay in visual mode)
vim.keymap.set("v", "<", "<gv", { desc = "Indent Left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent Right" })

-- ════════════════════════════════════════════════════════════════════════════
-- Diagnostics
-- ════════════════════════════════════════════════════════════════════════════
local float_opts = { float = { focusable = false, border = "rounded" } }
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next(float_opts) end, { desc = "Go to next Diagnostic" })
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev(float_opts) end, { desc = "Go to prev Diagnostic" })

