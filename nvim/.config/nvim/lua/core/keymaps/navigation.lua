-- ════════════════════════════════════════════════════════════════════════════
-- Navigation
-- ════════════════════════════════════════════════════════════════════════════
local set = vim.keymap.set

-- ════════════════════════════════════════════════════════════════════════════
-- Window Navigation
-- ════════════════════════════════════════════════════════════════════════════
-- Navigation and resize are defined in tmux.lua plugin

-- ════════════════════════════════════════════════════════════════════════════
-- Buffer Navigation
-- ════════════════════════════════════════════════════════════════════════════
-- Bar navigation
set("n", "<M-j>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
set("n", "<M-k>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Content navigation
set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll downwards' })
set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll upwards' })
set('n', 'n', 'nzzzv', { desc = 'Next result' })
set('n', 'N', 'Nzzzv', { desc = 'Previous result' })
