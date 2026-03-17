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
