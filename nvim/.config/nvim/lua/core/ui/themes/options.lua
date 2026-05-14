local set = vim.o
local fn = require "core.ui.themes.functions"

set.termguicolors = true -- Enable 24-bit RBG colors in terminal

local function default_colorscheme()
  fn.setup_colorscheme "vscode"
end

vim.api.nvim_create_autocmd("VimEnter", {
  desc = "Setup colorscheme at startup",
  callback = function()
    vim.defer_fn(default_colorscheme, 10)
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  desc = "Setup colorscheme specifics",
  callback = default_colorscheme,
})
