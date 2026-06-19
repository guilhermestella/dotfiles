local set = vim.o
local fn = require "core.ui.themes.functions"

set.termguicolors = true -- Enable 24-bit RBG colors in terminal

vim.api.nvim_create_autocmd("UIEnter", {
  callback = function()
    fn.setup_colorscheme("vscode", "vscode")
  end,
})

vim.api.nvim_create_autocmd("OptionSet", {
  pattern = "background",
  callback = function()
    fn.setup_colorscheme("vscode", "vscode")
  end,
})
