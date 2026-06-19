local snacks = require "snacks"
local set = vim.keymap.set

set("n", "<F12>", snacks.picker.colorschemes, { desc = "➜ Themes"})
