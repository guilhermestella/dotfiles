-- Indentation — 2 spaces is common for XML
vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2

-- Wrapping
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.textwidth = 0

-- Folding — indent works well for XML, or use treesitter if available
vim.opt_local.foldmethod = "indent"
vim.opt_local.foldlevel = 99

-- Show whitespace — useful for spotting bad indentation
vim.opt_local.list = true
vim.opt_local.listchars = "tab:→ ,trail:·,lead:·"

-- Concealment off
vim.opt_local.conceallevel = 0

-- Spelling off by default (lots of tag names trigger false positives)
vim.opt_local.spell = false
