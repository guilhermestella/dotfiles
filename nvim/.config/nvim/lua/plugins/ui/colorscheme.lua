return {
  {
    "wtfox/jellybeans.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
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
  },
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme "dracula"
    end,
  },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme "gruvbox-material"
      -- vim.api.nvim_set_hl(0, "WinBar", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "WinBarNC", { bg = "none" })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "latte",
      color_overrides = {
        latte = {
          base = "#ffffff",
        },
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme "catppuccin-latte"
      vim.o.guicursor = "n-v-c:block,i:beam"
    end,
  },
}
