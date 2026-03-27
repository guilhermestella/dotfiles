local set = vim.opt_local

-- Indentation — 2 spaces is common for XML
set.expandtab = true
set.shiftwidth = 2
set.tabstop = 2
set.softtabstop = 2

-- Wrapping
set.wrap = true
set.linebreak = true
set.textwidth = 0

-- Folding — indent works well for XML, or use treesitter if available
set.foldmethod = "indent"
set.foldlevel = 99

-- Show whitespace — useful for spotting bad indentation
set.list = true
set.listchars = "tab:→ ,trail:·,lead:·"

-- Concealment off
set.conceallevel = 0

-- Spelling off by default (lots of tag names trigger false positives)
set.spell = false
