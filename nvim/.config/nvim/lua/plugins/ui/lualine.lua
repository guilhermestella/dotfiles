return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup {
        options = {
          icons_enabled = true,
          theme = "jellybeans-nvim",
          disabled_filetypes = { "neo-tree" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics", "filename" },
          lualine_c = {},
        },
        inactive_sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics", "filename" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        winbar = {
          lualine_b = { "filename" },
          lualine_c = { "navic" },
        },
        inactive_winbar = {
          lualine_b = { "filename" },
          lualine_c = { "navic" },
        },
      }
    end,
  },
}
