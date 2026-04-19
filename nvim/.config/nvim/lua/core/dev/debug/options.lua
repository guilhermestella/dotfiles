local sign_define = vim.fn.sign_define
local set_hl = vim.api.nvim_set_hl


sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint" })
sign_define("DapBreakpointCondition", { text = "◆", texthl = "DapBreakpointCondition" })
sign_define("DapLogPoint", { text = "◉", texthl = "DapLogPoint" })
sign_define("DapStopped", { text = "→", texthl = "DapStopped", linehl = "DapStoppedLine" })
sign_define("DapBreakpointRejected", { text = "○", texthl = "DapBreakpointRejected" })

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    set_hl(0, "DapBreakpoint", { link = "DiagnosticError" })
    set_hl(0, "DapBreakpointCondition", { link = "DiagnosticWarn" })
    set_hl(0, "DapLogPoint", { link = "DiagnosticInfo" })
    set_hl(0, "DapStopped", { link = "DiagnosticOk" })
    set_hl(0, "DapBreakpointRejected", { link = "DiagnosticHint" })
    set_hl(0, "DapStoppedLine", { link = "CursorLine" })
  end,
})
