-- ════════════════════════════════════════════════════════════════════════════
-- Buffer Navigation
-- ════════════════════════════════════════════════════════════════════════════
vim.keymap.set("n", "<leader>bn", "<cmd>enew<cr>", { desc = "New buffer" })
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- ════════════════════════════════════════════════════════════════════════════
-- Marks
-- ════════════════════════════════════════════════════════════════════════════
vim.keymap.set("n", "m", function()
  local line = vim.fn.line(".")
  local next_char = vim.fn.getcharstr()
  local mark = vim.fn.getpos("'" .. next_char)
  if mark[2] == line then
    vim.cmd("delmarks " .. next_char)
  else
    vim.cmd("mark " .. next_char)
  end
  vim.cmd("redraw!")
end)
