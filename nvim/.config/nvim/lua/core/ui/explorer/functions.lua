local snacks = require "snacks"
local events = require "neo-tree.events"

local M = {}

local function toggle(source, reveal)
  local rev = reveal and " reveal " or ""

  local win = vim.api.nvim_get_current_win()
  local buf = vim.api.nvim_win_get_buf(win)
  local buf_name = vim.api.nvim_buf_get_name(buf)

  if buf_name:match "neo%-tree" and buf_name:match(source) then
    vim.cmd("Neotree " .. source .. " close")
  else
    vim.cmd("Neotree " .. source .. " focus " .. rev .. " left")
  end
end

function M.focus_filesystem()
  toggle("filesystem", true)
end

function M.toggle_filesystem()
  toggle("filesystem", false)
end

function M.toggle_buffers()
  toggle("buffers", true)
end

function M.toggle_git_status()
  toggle("git_status", true)
end

function M.delete_buffer(bufnr)
  vim.notify('test')
  snacks.bufdelete(bufnr)
end

function M.on_move(data)
  snacks.rename.on_rename_file(data.source, data.destination)
end

M.explorer_events = events

return M
