-- ════════════════════════════════════════════════════════════════════════════
-- Editor Behavior
-- ════════════════════════════════════════════════════════════════════════════
vim.o.mouse = "a"                                 -- Enable mouse support
vim.o.clipboard = "unnamedplus"                   -- Use system clipboard for yank/paste
vim.o.undofile = true                             -- Persist undo history
vim.o.undodir = vim.fn.stdpath("data") .. "/undo" -- Directory to store undo files
vim.o.timeoutlen = 500                            -- Time in ms to wait for a mapped key sequence to complete
vim.o.confirm = true                              -- Prompt for confirmation instead of failing unsaved changes
vim.o.autoread = true                             -- Automatically reload files changed outside vim
vim.o.autowriteall = true                         -- Automatically saves all files when quit

-- ════════════════════════════════════════════════════════════════════════════
-- Files
-- ════════════════════════════════════════════════════════════════════════════
vim.opt.fileencoding = "utf-8"            -- File encoding for new files
vim.opt.backup = false                    -- Don't create backup files before overwriting
vim.opt.writebackup = false               -- Don't create backup while editing
vim.opt.swapfile = false                  -- Don't create swap files

-- ════════════════════════════════════════════════════════════════════════════
-- Fold
-- ════════════════════════════════════════════════════════════════════════════
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
