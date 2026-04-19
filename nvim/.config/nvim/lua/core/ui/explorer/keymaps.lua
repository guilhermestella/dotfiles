local set = vim.keymap.set
local fn = require "core.ui.explorer.functions"

set("n", "<leader>e", fn.toggle_filesystem, { desc = "➜ Toggle Explorer" })
set("n", "<M-1>", fn.toggle_filesystem, { desc = "➜ Toggle Explorer" })
set("n", "<M-2>", fn.toggle_buffers, { desc = "➜ Toggle Buffers" })
set("n", "<M-3>", fn.toggle_git_status, { desc = "➜ Toggle Git Status" })
set("n", "<M-4>", fn.toggle_symbols, { desc = "➜ Toggle Structure" })
