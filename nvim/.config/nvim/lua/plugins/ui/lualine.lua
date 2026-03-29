return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local jellybeans = require "lualine.themes.jellybeans-nvim"
      jellybeans.normal.c.bg = "#060606"

      require("lualine").setup {
        options = {
          icons_enabled = true,
          theme = jellybeans,
          component_separators = { left = "|", right = "|" },
          section_separators = { left = " ", right = " " },
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
          lualine_c = {},
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        winbar = {
          lualine_b = {},
          lualine_c = { "navic" },
        },
        inactive_winbar = {
          lualine_b = {},
          lualine_c = { "navic" },
        },
        tabline = {
          lualine_a = {
            {
              "buffers",
              fmt = function(buffer_name)
                if buffer_name:sub(1, #"neo-tree ") == "neo-tree " then
                  return "Neo-tree"
                end
                return buffer_name
              end,
            },
          },
        },
      }
    end,
  },
}
