local snacks = require "snacks"

vim.api.nvim_create_user_command("Q", function(opts)
  snacks.bufdelete(nil, opts.bang)
end, { bang = true })

vim.api.nvim_create_user_command("X", function(opts)
  if not opts.bang and vim.bo.modified then
    vim.cmd "write"
  end
  snacks.bufdelete(nil, opts.bang)
end, { bang = true })

vim.cmd [[cnoreabbrev <expr> q getcmdtype() == ':' && getcmdline() == 'q' ? 'Q' : 'q']]
vim.cmd [[cnoreabbrev <expr> x getcmdtype() == ':' && getcmdline() == 'x' ? 'X' : 'x']]
