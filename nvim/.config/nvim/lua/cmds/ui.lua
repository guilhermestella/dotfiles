-- ════════════════════════════════════════════════════════════════════════════
-- Windows, buffers, etc commands
-- ════════════════════════════════════════════════════════════════════════════

-- ════════════════════════════════════════════════════════════════════════════
-- Override closing commands
-- ════════════════════════════════════════════════════════════════════════════
local bd = require('utils.bufdelete')

vim.api.nvim_create_user_command("Bdelete", function(opts)
  local force = opts.bang
  local bufnr = opts.args ~= "" and tonumber(opts.args) or vim.api.nvim_get_current_buf()
  bd.bufdelete(force, bufnr)
end, { bang = true, nargs = "?", desc = "Delete buffer without closing windows" })

-- Define the commands
vim.api.nvim_create_user_command("Q", function(opts)
  bd.bufdelete(nil, opts.bang)
end, { bang = true })

vim.api.nvim_create_user_command("X", function(opts)
  if not opts.bang and vim.bo.modified then vim.cmd("write") end
  bd.bufdelete(nil, opts.bang)
end, { bang = true })

vim.cmd([[cnoreabbrev <expr> q getcmdtype() == ':' && getcmdline() == 'q' ? 'Q' : 'q']])
vim.cmd([[cnoreabbrev <expr> x getcmdtype() == ':' && getcmdline() == 'x' ? 'X' : 'x']])
