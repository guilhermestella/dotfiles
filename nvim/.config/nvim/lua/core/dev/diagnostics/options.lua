local severity = vim.diagnostic.severity

vim.diagnostic.config {
  signs = {
    severity_sort = true,
    culhl = {
      [severity.ERROR] = "BufferVisibleERROR",
      [severity.WARN] = "BufferVisibleWARN",
      [severity.HINT] = "BufferVisibleHINT",
      [severity.INFO] = "BufferVisibleINFO",
    },
    text = {
      [severity.ERROR] = "",
      [severity.WARN] = "",
      [severity.HINT] = "",
      [severity.INFO] = "",
    },
    numhl = {
      [severity.ERROR] = "DiagnosticSignError",
      [severity.WARN] = "DiagnosticSignWarn",
      [severity.HINT] = "DiagnosticSignHint",
      [severity.INFO] = "DiagnosticSignInfo",
    },
    severity = {
      min = severity.INFO,
    },
  },
  virtual_text = {
    prefix = function(message)
      local icons = {
        [severity.ERROR] = "󰅚 ",
        [severity.WARN] = "󰀦 ",
        [severity.HINT] = "󰌵 ",
        [severity.INFO] = "󰋽 ",
      }
      return icons[message.severity] or "󰠮 "
    end,
    spacing = 2,
    severity = {
      min = severity.INFO,
    },
  },
}
