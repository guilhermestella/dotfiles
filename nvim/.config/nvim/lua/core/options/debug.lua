-- ════════════════════════════════════════════════════════════════════════════
-- Debug Signs
-- ════════════════════════════════════════════════════════════════════════════

vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint" })
vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DapBreakpointCondition" })
vim.fn.sign_define("DapLogPoint", { text = "◉", texthl = "DapLogPoint" })
vim.fn.sign_define("DapStopped", { text = "→", texthl = "DapStopped", linehl = "DapStoppedLine" })
vim.fn.sign_define("DapBreakpointRejected", { text = "○", texthl = "DapBreakpointRejected" })

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.api.nvim_set_hl(0, "DapBreakpoint", { link = "DiagnosticError" })
    vim.api.nvim_set_hl(0, "DapBreakpointCondition", { link = "DiagnosticWarn" })
    vim.api.nvim_set_hl(0, "DapLogPoint", { link = "DiagnosticInfo" })
    vim.api.nvim_set_hl(0, "DapStopped", { link = "DiagnosticOk" })
    vim.api.nvim_set_hl(0, "DapBreakpointRejected", { link = "DiagnosticHint" })
    vim.api.nvim_set_hl(0, "DapStoppedLine", { link = "CursorLine" })
  end,
})
