local set = vim.keymap.set
local fn = require "core.ui.bufferline.functions"

set("n", "<M-j>", fn.previous)
set("n", "<M-k>", fn.next)
set("n", "<C-w>q", fn.close)
set("n", "<C-w>c", fn.close_split)
set("n", "<C-w>Q", fn.close_others)
set("n", "<C-w>u", fn.restore)
