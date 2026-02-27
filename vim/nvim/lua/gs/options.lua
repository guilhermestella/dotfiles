vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.colorcolumn = "120"
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#585b70" })

vim.opt.showmode = false
vim.opt.statusline = ''

vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.linebreak = true
