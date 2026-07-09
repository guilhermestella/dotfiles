local lualine = require "lualine"

local mode = {
  "mode",
  fmt = function(mode)
    local map = {
      ["NORMAL"] = "N",
      ["INSERT"] = "I",
      ["VISUAL"] = "V",
      ["V-LINE"] = "V-L",
      ["V-BLOCK"] = "V-B",
      ["SELECT"] = "S",
      ["S-LINE"] = "S-L",
      ["S-BLOCK"] = "S-B",
      ["REPLACE"] = "R",
      ["COMMAND"] = "C",
      ["TERMINAL"] = "T",
    }
    return map[mode] or mode
  end,
}

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn", "info", "hint" },
  symbols = {
    error = " ",
    hint = " ",
    info = " ",
    warn = " ",
  },
  colored = true,
  update_in_insert = false,
  always_visible = false,
}

local diff = {
  "diff",
  source = function()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
      return {
        added = gitsigns.added,
        modified = gitsigns.changed,
        removed = gitsigns.removed,
      }
    end
  end,
  symbols = {
    added = "" .. " ",
    modified = "" .. " ",
    removed = "" .. " ",
  },
  colored = true,
  always_visible = false,
}

local lsp_status = {
  "lsp_status",
  icon = "",
  symbols = {
    spinner = { "", "", "", "", "", "", "", "", "", "", "", "", "" },
    done = "",
    separator = " ",
  },
  ignore_lsp = {},
  show_name = true,
}

lualine.setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    disabled_filetypes = { "mason" },
    section_separators = " ",
    component_separators = "|",
  },
  sections = {
    lualine_a = { mode },
    lualine_b = { "branch" },
    lualine_c = { diff, diagnostics },
    lualine_x = {},
    lualine_y = { lsp_status },
    lualine_z = { "progress", "location" },
  },
}
