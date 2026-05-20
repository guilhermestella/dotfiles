-- local catppuccin = require "catppuccin"
-- catppuccin.setup {
--   flavour = "latte",
--   color_overrides = {
--     latte = {
--       base = "#ffffff",
--     },
--   },
-- }

local c = require("vscode.colors").get_colors()
require("vscode").setup {
  group_overrides = {
    NeoTreeDimText = { fg = "NONE", bg = c.vscBack },
  },
}
