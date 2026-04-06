-- ════════════════════════════════════════════════════════════════════════════
-- UI Keymaps
-- ════════════════════════════════════════════════════════════════════════════
local set = vim.keymap.set

-- ════════════════════════════════════════════════════════════════════════════
-- Quit, Save Operation
-- ════════════════════════════════════════════════════════════════════════════
set("n", "<C-w>Q", "<cmd>qa<cr>", { desc = "Quit all" })
set("n", "<C-w>q", "<cmd>Bdelete!<cr>", { desc = "Delete buffer" })

-- ════════════════════════════════════════════════════════════════════════════
-- Esc Action
-- ════════════════════════════════════════════════════════════════════════════
set("n", "<Esc>", function()
  local win = vim.api.nvim_get_current_win()
  local config = vim.api.nvim_win_get_config(win)

  -- close only if focused window is a floating window
  if config.relative ~= "" then
    vim.api.nvim_win_close(win, false)
    return
  end

  -- otherwise, just clear search highlights
  vim.cmd "nohlsearch"
end, { noremap = true, silent = true, desc = "Esc Action" })

-- ════════════════════════════════════════════════════════════════════════════
-- Marks
-- ════════════════════════════════════════════════════════════════════════════
set("n", "m", function()
  local line = vim.fn.line "."
  local next_char = vim.fn.getcharstr()
  local mark = vim.fn.getpos("'" .. next_char)
  if mark[2] == line then
    vim.cmd("delmarks " .. next_char)
  else
    vim.cmd("mark " .. next_char)
  end
  vim.cmd "redraw!"
end)
