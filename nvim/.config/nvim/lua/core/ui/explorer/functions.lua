local M = {}

local function toggle(source)
  local win = vim.api.nvim_get_current_win()
  local buf = vim.api.nvim_win_get_buf(win)
  local buf_name = vim.api.nvim_buf_get_name(buf)

  if buf_name:match "neo%-tree" and buf_name:match(source) then
    vim.cmd("Neotree " .. source .. " close")
  else
    vim.cmd("Neotree " .. source .. " focus reveal left")
  end
end

function M.toggle_filesystem()
  toggle "filesystem"
end

function M.toggle_buffers()
  toggle "buffers"
end

function M.toggle_git_status()
  toggle "git_status"
end

function M.toggle_symbols()
  toggle "document_symbols"
end

return M
