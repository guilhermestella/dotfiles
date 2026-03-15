-- ════════════════════════════════════════════════════════════════════════════
-- <Esc> Action
-- ════════════════════════════════════════════════════════════════════════════
vim.keymap.set("n", "<Esc>", function()
  local closed = false
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_config(win).relative ~= "" then
      vim.api.nvim_win_close(win, false)
      closed = true
    end
  end
  if not closed then
    vim.cmd("nohlsearch")
  end
end, { noremap = true, silent = true, desc = "Esc Action" })
