-- Indentation — YAML standard is 2 spaces
vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2

-- Wrapping — YAML values can be long; disable hard wrap
vim.opt_local.wrap = true
vim.opt_local.linebreak = true -- wrap at word boundaries
vim.opt_local.textwidth = 0    -- no auto hard-wrap

-- Indentation context — helps with motion and folding
vim.opt_local.indentexpr = ""     -- rely on treesitter/LSP instead
vim.opt_local.autoindent = true
vim.opt_local.smartindent = false -- smartindent breaks YAML indentation

-- Folding (pick one approach)
vim.opt_local.foldmethod = "indent" -- simple, works without treesitter
vim.opt_local.foldlevel = 99        -- start with all folds open

-- Show leading spaces (crucial for YAML)
vim.opt_local.list = true
vim.opt_local.listchars = "tab:→ ,trail:·,lead:·"

-- Spelling is useful in comments and string values
vim.opt_local.spell = false -- set to true if you want it
vim.opt_local.spelllang = "en_us"

-- Concealment off — you want to see every character in YAML
vim.opt_local.conceallevel = 0
