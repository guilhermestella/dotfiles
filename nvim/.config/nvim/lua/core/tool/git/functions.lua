local gs = require "gitsigns"
local snacks = require "snacks"

local M = {}

function M.reset_hunk_block()
  gs.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
end

function M.toggle_blame()
  local current_buf = vim.api.nvim_get_current_buf()

  if vim.bo[current_buf].filetype == "gitsigns-blame" then
    vim.cmd "bdelete!"
    return
  end

  local found = false
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].filetype == "gitsigns-blame" then
      vim.api.nvim_win_close(win, false)
      found = true
      break
    end
  end
  if not found then
    gs.blame { full = false }
  end
end

function M.nav_next_hunk()
  gs.nav_hunk "next"
end

function M.nav_prev_hunk()
  gs.nav_hunk "prev"
end

M.setup = gs.setup
M.preview_hunk = gs.preview_hunk
M.reset_hunk = gs.reset_hunk
M.reset_buffer = gs.reset_buffer

local opts = {
  layout = "ivy",
  show_empty = true,
  auto_close = false,
  actions = {
    unfocus = function(picker)
      vim.cmd "stopinsert"
      vim.schedule(function()
        if picker.main and vim.api.nvim_win_is_valid(picker.main) then
          vim.api.nvim_set_current_win(picker.main)
        end
      end)
    end,
  },
  win = {
    preview = { wo = { wrap = true } },
    input = {
      keys = {
        ["<M-g>"] = { "close", mode = { "i", "n" } },
        ["<M-G>"] = { "close", mode = { "i", "n" } },
        ["<Esc>"] = { "unfocus", mode = "i" },
      },
    },
  },
}

local function show_git_source(source)
  local pickers = snacks.picker.get { source = source }
  if pickers[1] then
    if pickers[1]:is_focused() then
      pickers[1]:close()
    else
      pickers[1]:focus()
    end
  else
    snacks.picker[source](opts)
  end
end

function M.show_log()
  show_git_source "git_log"
end

function M.show_file_log()
  show_git_source "git_log_file"
end

local layout = { layout = "ivy", win = { preview = { wo = { wrap = true } } } }

function M.show_status()
  snacks.picker.git_status(layout)
end

function M.show_branches()
  snacks.picker.git_branches(layout)
end

function M.show_diff()
  snacks.picker.git_diff(layout)
end

function M.show_line_log()
  snacks.picker.git_log_line(layout)
end

function M.show_stash()
  snacks.picker.git_stash(layout)
end

return M
