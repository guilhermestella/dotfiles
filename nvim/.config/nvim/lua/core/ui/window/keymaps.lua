local set = vim.keymap.set
local fn = require "core.ui.window.functions"

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
-- Navigate inside buffer
-- ════════════════════════════════════════════════════════════════════════════
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

-- ════════════════════════════════════════════════════════════════════════════
-- Esc Action
-- ════════════════════════════════════════════════════════════════════════════
set("n", "<Esc>", fn.close_float_window, { noremap = true, silent = true })

-- ════════════════════════════════════════════════════════════════════════════
-- Search
-- ════════════════════════════════════════════════════════════════════════════
set("x", "<M-S-f>", fn.search_selection)
set("n", "<M-S-f>", fn.search)
set("n", "<leader><space>", fn.find_files)
set("n", "<M-u>", fn.undo_history)
set("x", "<M-u>", fn.undo_history_selection)
