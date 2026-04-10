-- ════════════════════════════════════════════════════════════════════════════
-- Gruvbox
-- ════════════════════════════════════════════════════════════════════════════
vim.cmd.colorscheme "gruvbox-material"
vim.o.background = "dark"
vim.api.nvim_set_hl(0, "WinBar", { bg = "none" })
vim.api.nvim_set_hl(0, "WinBarNC", { bg = "none" })

-- ════════════════════════════════════════════════════════════════════════════
-- Jellybeans
-- ════════════════════════════════════════════════════════════════════════════
local jellybeans = require "jellybeans"
jellybeans.setup {
  config = function()
    -- local jellybeans = require "lualine.themes.jellybeans-nvim"
    -- jellybeans.normal.c.bg = "#060606"
    -- jellybeans.normal.b.bg = "#060606"
    -- jellybeans.inactive.a.bg = "#060606"
    -- jellybeans.inactive.a.fg = "#ffffff"
    -- jellybeans.inactive.b.bg = "#060606"
    -- jellybeans.inactive.c.bg = "#060606"
    -- vim.cmd.colorscheme "jellybeans-hc"
    -- vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#303030" })
  end,
}

-- ════════════════════════════════════════════════════════════════════════════
-- Dracula
-- ════════════════════════════════════════════════════════════════════════════
local dracula = require "dracula"
dracula.setup {
  config = function()
    -- vim.cmd.colorscheme "dracula"
  end,
}

-- ════════════════════════════════════════════════════════════════════════════
-- Catppuccin
-- ════════════════════════════════════════════════════════════════════════════
local catppuccin = require "catppuccin"
catppuccin.setup {
  flavour = "latte",
  color_overrides = {
    latte = {
      base = "#ffffff",
    },
  },
  config = function()
    -- vim.cmd.colorscheme "catppuccin-latte"
    -- vim.o.guicursor = "n-v-c:block,i:beam"
  end,
}
