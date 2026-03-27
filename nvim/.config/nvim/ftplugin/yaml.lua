local set = vim.opt_local

-- Indentation — YAML standard is 2 spaces
set.expandtab = true
set.shiftwidth = 2
set.tabstop = 2
set.softtabstop = 2

-- Wrapping — YAML values can be long; disable hard wrap
set.wrap = true
set.linebreak = true -- wrap at word boundaries
set.textwidth = 0 -- no auto hard-wrap

-- Indentation context — helps with motion and folding
set.indentexpr = "" -- rely on treesitter/LSP instead
set.autoindent = true
set.smartindent = false -- smartindent breaks YAML indentation

-- Folding (pick one approach)
set.foldmethod = "indent" -- simple, works without treesitter
set.foldlevel = 99 -- start with all folds open

-- Show leading spaces (crucial for YAML)
set.list = true
set.listchars = "tab:→ ,trail:·,lead:·"

-- Spelling is useful in comments and string values
set.spell = false -- set to true if you want it
set.spelllang = "en_us"

-- Concealment off — you want to see every character in YAML
set.conceallevel = 0
