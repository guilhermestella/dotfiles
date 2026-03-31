return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      {
        "SmiteshP/nvim-navic",
        dependencies = {
          "neovim/nvim-lspconfig",
        },
        opts = {
          lsp = { auto_attach = true },
          highlight = true,
          separator = " » ",
          depth_limit = 8,
          depth_limit_indicator = "...",
          lazy_update_context = false,
        },
      },
    },
    config = function()
      require("lualine").setup {
        options = {
          theme = "gruvbox-material",
          icons_enabled = true,
          disabled_filetypes = { "neo-tree" },
          section_separators = { left = " ", right = " " },
          component_separators = { left = "|", right = "|" },
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
          lualine_c = { "navic" },
        },
        inactive_winbar = {
          lualine_c = { "navic" },
        },
        tabline = {
          lualine_a = {
            {
              "buffers",
              fmt = function(buffer_name, buf)
                local bufnr = buf.bufnr
                local readonly = vim.bo[bufnr].readonly
                if readonly then
                  if buffer_name:sub(1, #"neo-tree ") == "neo-tree " then
                    return "Neo-tree"
                  end
                  return buffer_name .. " [RO]"
                end

                return buffer_name
              end,
              symbols = { alternate_file = false },
            },
          },
        },
      }
    end,
  },
}
