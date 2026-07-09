local navic = require "nvim-navic"
local lualine = require "lualine"

navic.setup {
  lsp = {
    auto_attach = true,
    preference = { "vue_ls", "vtsls", "ts_ls" },
  },
  highlight = false,
  separator = " » ",
  depth_limit = 0,
  depth_limit_indicator = "...",
  lazy_update_context = false,
}

lualine.setup {
  options = {
    icons_enabled = true,
    disabled_filetypes = {
      "neo-tree",
      "dap-repl",
      "dapui_watches",
      "dapui_stacks",
      "dapui_breakpoints",
      "dapui_scopes",
      "dapui_console",
    },
    section_separators = { left = " ", right = " " },
    component_separators = { left = "|", right = "|" },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = { "diff", "diagnostics" },
    lualine_x = { "location", "progress", "encoding", "lsp_status" },
    lualine_y = {},
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = { "diff", "diagnostics" },
    lualine_x = { "location", "progress", "encoding", "lsp_status" },
    lualine_y = {},
    lualine_z = {},
  },
  winbar = {
    lualine_c = { {
      function()
        return " "
      end,
      separator = { right = "" },
    }, "navic" },
  },
  inactive_winbar = {
    lualine_c = { {
      function()
        return " "
      end,
      separator = { right = "" },
    }, "navic" },
  },
}
