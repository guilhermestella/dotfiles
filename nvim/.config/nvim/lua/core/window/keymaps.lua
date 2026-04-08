local set = vim.keymap.set
local fn = require "core.window.functions"

-- ════════════════════════════════════════════════════════════════════════════
-- Close buffer
-- ════════════════════════════════════════════════════════════════════════════
set("n", "<C-w>Q", "<cmd>qa<cr>", { desc = "Quit all" })
set("n", "<C-w>q", "<cmd>Bdelete!<cr>", { desc = "Delete buffer" })

-- ════════════════════════════════════════════════════════════════════════════
-- Resize
-- ════════════════════════════════════════════════════════════════════════════
set("n", "<M-Left>", fn.resize_left)
set("n", "<M-Down>", fn.resize_down)
set("n", "<M-UP>", fn.resize_up)
set("n", "<M-Right>", fn.resize_right)

-- ════════════════════════════════════════════════════════════════════════════
-- Navigate between panes
-- ════════════════════════════════════════════════════════════════════════════
set("n", "<C-h>", fn.move_cursor_left)
set("n", "<C-j>", fn.move_cursor_down)
set("n", "<C-k>", fn.move_cursor_up)
set("n", "<C-l>", fn.move_cursor_right)

-- ════════════════════════════════════════════════════════════════════════════
-- Navigate between buffers
-- ════════════════════════════════════════════════════════════════════════════
set("n", "<M-j>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
set("n", "<M-k>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- ════════════════════════════════════════════════════════════════════════════
-- Navigate inside buffer
-- ════════════════════════════════════════════════════════════════════════════
set("n", "<C-d>", "<C-d>zz", { desc = "Scroll downwards" })
set("n", "<C-u>", "<C-u>zz", { desc = "Scroll upwards" })
set("n", "n", "nzzzv", { desc = "Next result" })
set("n", "N", "Nzzzv", { desc = "Previous result" })

-- ════════════════════════════════════════════════════════════════════════════
-- Esc Action
-- ════════════════════════════════════════════════════════════════════════════
set("n", "<Esc>", fn.close_float_window, { noremap = true, silent = true, desc = "Esc Action" })
