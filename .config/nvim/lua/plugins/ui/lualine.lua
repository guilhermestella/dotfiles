return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'gruvbox',
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
        },
        winbar = {
          lualine_c = {
            {
              "filetype",
              icon_only = true,
              color = { bg = "NONE" },
              padding = { left = 1, right = 0 },
            },
            {
              'filename',
              color = "NavicText"
            },
            {
              'navic',
              fmt = function(str)
                if str == "" then return "" end
                return " ❯ " .. str
              end,
              color = "NavicText"
            }
          }
        },
        inactive_winbar = {
          lualine_c = {
            {
              "filetype",
              icon_only = true,
              color = { bg = "NONE" },
              padding = { left = 1, right = 0 },
            },
            {
              'filename',
              color = "NavicText"
            },
            {
              'navic',
              fmt = function(str)
                if str == "" then return "" end
                return " ❯ " .. str
              end,
              color = "NavicText"
            }
          }
        }
      }
    end
  }
}
