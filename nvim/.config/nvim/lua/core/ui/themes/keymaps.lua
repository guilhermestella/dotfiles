local snacks = require "snacks"
local set = vim.keymap.set

set("n", "<leader>st", snacks.picker.colorschemes, { desc = "➜ Themes"})
