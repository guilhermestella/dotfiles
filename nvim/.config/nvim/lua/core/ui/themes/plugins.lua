-- ════════════════════════════════════════════════════════════════════════════
-- Catppuccin overrides
-- ════════════════════════════════════════════════════════════════════════════
local catppuccin = require "catppuccin"
catppuccin.setup {
  flavour = "latte",
  color_overrides = {
    latte = {
      base = "#ffffff",
    },
  },
}
