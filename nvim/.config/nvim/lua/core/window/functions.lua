local sp = require "smart-splits"

local M = {}

function M.close_float_window()
  local win = vim.api.nvim_get_current_win()
  local config = vim.api.nvim_win_get_config(win)

  -- close only if focused window is a floating window
  if config.relative ~= "" then
    vim.api.nvim_win_close(win, false)
    return
  end

  -- otherwise, just clear search highlights
  vim.cmd "nohlsearch"
end

local function get_replacement(buf)
  local alt = vim.fn.bufnr "#"
  if alt ~= -1 and alt ~= buf and vim.api.nvim_buf_is_valid(alt) and vim.bo[alt].buflisted then
    return alt
  end
  for _, b in ipairs(vim.api.nvim_list_bufs()) do
    if b ~= buf and vim.api.nvim_buf_is_valid(b) and vim.bo[b].buflisted then
      return b
    end
  end
  return -1
end

function M.bufdelete(bufnr, force)
  bufnr = (type(bufnr) == "number" and bufnr) or vim.api.nvim_get_current_buf()
  force = force or false

  if vim.bo[bufnr].buftype ~= "" then
    vim.notify("Not a regular buffer", vim.log.levels.WARN)
    return
  end

  if not force and vim.bo[bufnr].modified then
    vim.notify("Buffer has unsaved changes. Use :Bdelete! to force.", vim.log.levels.WARN)
    return
  end

  local replacement = get_replacement(bufnr)
  local wins = vim.fn.win_findbuf(bufnr)

  -- if no replacement exists and there are multiple windows,
  -- close all but one window showing this buffer, then let the last one get enew
  if replacement == -1 and #wins > 1 then
    -- keep only the first window, close the rest
    for i = 2, #wins do
      local win = wins[i]
      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end
    end
    wins = { wins[1] }
  end

  for _, win in ipairs(wins) do
    if vim.api.nvim_win_is_valid(win) then
      if replacement == -1 then
        vim.api.nvim_win_call(win, function()
          vim.cmd "enew"
        end)
      else
        vim.api.nvim_win_set_buf(win, replacement)
      end
    end
  end

  local ok, err = pcall(function()
    vim.cmd.bdelete { count = bufnr, bang = force }
  end)
  if not ok then
    vim.notify("bufdelete: " .. err, vim.log.levels.ERROR)
  end
end

M.resize_left = sp.resize_left
M.resize_down = sp.resize_down
M.resize_up = sp.resize_up
M.resize_right = sp.resize_right

M.move_cursor_left = sp.move_cursor_left
M.move_cursor_down = sp.move_cursor_down
M.move_cursor_up = sp.move_cursor_up
M.move_cursor_right = sp.move_cursor_right

return M
