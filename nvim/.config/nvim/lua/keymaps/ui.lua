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
  vim.cmd("nohlsearch")
end, { noremap = true, silent = true, desc = "Esc Action" })

-- ════════════════════════════════════════════════════════════════════════════
-- Quit Operation
-- ════════════════════════════════════════════════════════════════════════════
vim.keymap.set("n", "<leader>Q", "<cmd>qa<cr>", { desc = "Quit all" })
