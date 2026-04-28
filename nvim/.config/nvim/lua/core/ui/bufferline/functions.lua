local snacks = require "snacks"

local M = {}

local function has_splits()
  local real_wins = 0
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    -- Skip floating windows and neo-tree
    if vim.api.nvim_win_get_config(win).relative == "" then
      local buf = vim.api.nvim_win_get_buf(win)
      if vim.bo[buf].filetype ~= "neo-tree" then
        real_wins = real_wins + 1
      end
    end
  end
  return real_wins > 1
end

function M.previous()
  vim.cmd "BufferPrevious"
end

function M.next()
  vim.cmd "BufferNext"
end

function M.close()
  snacks.bufdelete()
end

function M.close_split()
  if has_splits() then
    vim.cmd.close()
  else
    vim.notify("No split to close", vim.log.levels.WARN)
  end
end

function M.close_others()
  vim.cmd "BufferCloseAllButCurrent"
end

function M.restore()
  vim.cmd "BufferRestore"
end

return M
