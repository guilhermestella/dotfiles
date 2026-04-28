local set = vim.keymap.set
local fn = require "core.ui.bufferline.functions"

set("n", "<M-j>", fn.previous, { desc = "➜ Previous buffer" })
set("n", "<M-k>", fn.next, { desc = "➜ Next buffer" })
set("n", "<C-w>q", fn.close, { desc = "➜ Close buffer" })
set("n", "<C-w>c", fn.close_split, { desc = "➜ Close split buffer" })
set("n", "<C-w>Q", fn.close_others, { desc = "➜ Close other buffers" })
set("n", "<C-w>u", fn.restore, { desc = "➜ Restore buffer" })
