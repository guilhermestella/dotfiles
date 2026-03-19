-- ════════════════════════════════════════════════════════════════════════════
-- Esc Action
-- ════════════════════════════════════════════════════════════════════════════
vim.keymap.set("n", "<Esc>", function()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_config(win).relative ~= "" then
      vim.api.nvim_win_close(win, false)
      return
    end
  end
  vim.cmd("nohlsearch")
end, { noremap = true, silent = true, desc = "Esc Action" })

-- ════════════════════════════════════════════════════════════════════════════
-- Quit Operation
-- ════════════════════════════════════════════════════════════════════════════
vim.keymap.set("n", "<leader>Q", "<cmd>qa<cr>", { desc = "Quit all" })
