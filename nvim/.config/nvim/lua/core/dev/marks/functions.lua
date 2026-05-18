local snacks = require "snacks"

local M = {}

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
        ["<M-m>"] = { "close", mode = { "i", "n" } },
        ["<Esc>"] = { "unfocus", mode = "i" },
      },
    },
  },
}

function M.show_marks()
  local pickers = snacks.picker.get { source = "marks" }
  if pickers[1] then
    if pickers[1]:is_focused() then
      pickers[1]:close()
    else
      pickers[1]:focus()
    end
  else
    snacks.picker.marks(opts)
  end
end

function M.toggle_mark()
  local line = vim.fn.line "."
  local next_char = vim.fn.getcharstr()
  local mark = vim.fn.getpos("'" .. next_char)
  if mark[2] == line then
    vim.cmd("delmarks " .. next_char)
  else
    vim.cmd("mark " .. next_char)
  end
  vim.cmd "redraw!"
end

return M
