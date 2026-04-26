local sp = require "smart-splits"
local snacks = require "snacks"

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

M.resize_left = sp.resize_left
M.resize_down = sp.resize_down
M.resize_up = sp.resize_up
M.resize_right = sp.resize_right

M.move_cursor_left = sp.move_cursor_left
M.move_cursor_down = sp.move_cursor_down
M.move_cursor_up = sp.move_cursor_up
M.move_cursor_right = sp.move_cursor_right

function M.search()
  snacks.picker.grep()
end

function M.search_selection()
  snacks.picker.grep_word { live = true }
end

function M.find_files()
  snacks.picker.smart()
end

function M.undo_history()
  snacks.picker.undo()
end

return M
