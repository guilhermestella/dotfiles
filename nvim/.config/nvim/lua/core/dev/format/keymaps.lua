local fn = require "core.dev.format.functions"

vim.keymap.set("n", "==", fn.format, { noremap = true })
vim.keymap.set("v", "=", fn.format, { noremap = true })

vim.keymap.set("n", "p", fn.paste_and_format "p")
vim.keymap.set("n", "P", fn.paste_and_format "P")
