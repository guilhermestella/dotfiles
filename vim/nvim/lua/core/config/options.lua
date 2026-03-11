-- ════════════════════════════════════════════════════════════════════════════
-- Leader Keys
-- ════════════════════════════════════════════════════════════════════════════
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ════════════════════════════════════════════════════════════════════════════
-- Disable Built-in Plugins
-- ════════════════════════════════════════════════════════════════════════════
vim.g.loaded_netrw = 1 -- Disable netrw file explorer
vim.g.loaded_netrwPlugin = 1 -- Disable netrw plugin component

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

-- ════════════════════════════════════════════════════════════════════════════
-- Fold
-- ════════════════════════════════════════════════════════════════════════════
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99

-- ════════════════════════════════════════════════════════════════════════════
-- UI
-- ════════════════════════════════════════════════════════════════════════════
vim.o.updatetime = 500
vim.o.termguicolors = true -- Enable 24-bit RBG colors in terminal
vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 4 -- Keep a consistent 4-column gutter
vim.o.wrap = false
vim.o.breakindent = true -- Wrapped lines preserve indentation
vim.o.showmode = false -- Don't show mode in command line (shown in statusline)
vim.o.ruler = false -- Don't show ruler (shown in statusline)
vim.o.winborder = 'rounded' -- Rounded window for neovim
-- vim.o.cmdheight = 0 -- Break visual block (https://github.com/neovim/neovim/issues/20635)

-- ════════════════════════════════════════════════════════════════════════════
-- Diagnostic
-- ════════════════════════════════════════════════════════════════════════════
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN]  = " ",
            [vim.diagnostic.severity.HINT]  = " ",
            [vim.diagnostic.severity.INFO]  = " ",
        },
        severity_sort = true,
    }
})

-- ════════════════════════════════════════════════════════════════════════════
-- Identation
-- ════════════════════════════════════════════════════════════════════════════
vim.o.expandtab = true -- Convert tabs to spaces
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.softtabstop = 0
vim.o.smarttab = true
vim.o.linebreak = true

-- ════════════════════════════════════════════════════════════════════════════
-- Files
-- ════════════════════════════════════════════════════════════════════════════
vim.opt.fileencoding = "utf-8" -- File encoding for new files
vim.opt.backup = false -- Don't create backup files before overwriting
vim.opt.writebackup = false -- Don't create backup while editing
vim.opt.swapfile = false -- Don't create swap files
