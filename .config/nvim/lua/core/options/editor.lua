-- ════════════════════════════════════════════════════════════════════════════
-- Editor Behavior
-- ════════════════════════════════════════════════════════════════════════════
vim.o.mouse = "a"  -- Enable mouse support
vim.o.clipboard = "unnamedplus" -- Use system clipboard for yank/paste
vim.o.undofile = true -- Persist undo history
vim.o.undodir = vim.fn.stdpath("data") .. "/undo" -- Directory to store undo files
vim.o.timeoutlen = 500 -- Time in ms to wait for a mapped key sequence to complete
vim.o.confirm = true -- Prompt for confirmation instead of failing unsaved changes
vim.o.autoread = true -- Automatically reload files changed outside vim
