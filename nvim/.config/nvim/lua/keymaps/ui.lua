-- ════════════════════════════════════════════════════════════════════════════
-- Windows, Buffers, Operations, etc
-- ════════════════════════════════════════════════════════════════════════════

-- ════════════════════════════════════════════════════════════════════════════
-- Quit, Save Operation
-- ════════════════════════════════════════════════════════════════════════════

vim.keymap.set("n", "<C-w>Q", "<cmd>qa<cr>", { desc = "Quit all" })
vim.keymap.set("n", "<C-w>q", "<cmd>Bdelete!<cr>", { desc = "Delete buffer" })

-- ════════════════════════════════════════════════════════════════════════════
-- Esc Action
-- ════════════════════════════════════════════════════════════════════════════
vim.keymap.set("n", "<Esc>", function()
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
-- Window Navigation (no prefix for speed)
-- ════════════════════════════════════════════════════════════════════════════

-- Tab navigation is defined in tmux.lua plugin

-- Resize
vim.keymap.set({ "t", "n" }, "<M-Up>", ":resize -2<CR>", { desc = "Increase height" })
vim.keymap.set({ "t", "n" }, "<M-Down>", ":resize +2<CR>", { desc = "Decrease height" })
vim.keymap.set({ "t", "n" }, "<M-Left>", ":vertical resize -2<CR>", { desc = "Decrease width" })
vim.keymap.set({ "t", "n" }, "<M-Right>", ":vertical resize +2<CR>", { desc = "Increase width" })

-- ════════════════════════════════════════════════════════════════════════════
-- Buffer Navigation
-- ════════════════════════════════════════════════════════════════════════════
vim.keymap.set("n", "<M-j>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<M-k>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- ════════════════════════════════════════════════════════════════════════════
-- Marks
-- ════════════════════════════════════════════════════════════════════════════
vim.keymap.set("n", "m", function()
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
