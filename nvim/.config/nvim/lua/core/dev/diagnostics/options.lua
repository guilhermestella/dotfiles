vim.diagnostic.config {
  signs = {
    severity_sort = true,
    culhl = {
      [vim.diagnostic.severity.ERROR] = "BufferVisibleERROR",
      [vim.diagnostic.severity.WARN] = "BufferVisibleWARN",
      [vim.diagnostic.severity.HINT] = "BufferVisibleHINT",
      [vim.diagnostic.severity.INFO] = "BufferVisibleINFO",
    },
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
      [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
      [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
      [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
    },
    severity = {
      min = vim.diagnostic.severity.INFO,
    },
  },
  virtual_text = {
    prefix = function(message)
      local icons = {
        [vim.diagnostic.severity.ERROR] = "󰅚 ",
        [vim.diagnostic.severity.WARN] = "󰀦 ",
        [vim.diagnostic.severity.HINT] = "󰌵 ",
        [vim.diagnostic.severity.INFO] = "󰋽 ",
      }
      return icons[message.severity] or "󰠮 "
    end,
    spacing = 2,
    severity = {
      min = vim.diagnostic.severity.INFO,
    },
  },
}
