local fn = require "core.format.functions"

vim.keymap.set("n", "==", fn.format, { noremap = true, desc = "Format file" })
vim.keymap.set("v", "=", fn.format, { noremap = true, desc = "Format selection" })

vim.keymap.set("n", "p", fn.paste_and_format "p", { desc = "Paste and indent" })
vim.keymap.set("n", "P", fn.paste_and_format "P", { desc = "Paste (before) and indent" })
