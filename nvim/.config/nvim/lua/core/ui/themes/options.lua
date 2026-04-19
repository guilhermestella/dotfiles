local set = vim.o
local set_theme = vim.cmd.colorscheme
local fn = require "core.ui.themes.functions"

set.termguicolors = true -- Enable 24-bit RBG colors in terminal
set_theme "gruvbox-material"

vim.api.nvim_create_autocmd("VimEnter", {
  desc = "Setup colorscheme at startup",
  callback = function()
    vim.defer_fn(fn.setup_colorscheme, 10)
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  desc = "Setup colorscheme specifics",
  callback = fn.setup_colorscheme,
})
