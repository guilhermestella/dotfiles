-- Leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- General / UI
vim.o.timeoutlen = 3000
vim.o.wrap = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.colorcolumn = "120"

-- Indentation
vim.o.tabstop = 4
vim.o.softtabstop = 0
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.smartindent = true
vim.o.linebreak = true

-- Copy
vim.o.clipboard = "unnamedplus"

-- Sync file changed externally
vim.o.autoread = true
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
  pattern = '*',
  command = 'silent! checktime',
  desc = 'Reload file'
})
