local select = require "nvim-treesitter-textobjects.select"
local move = require "nvim-treesitter-textobjects.move"
local snacks = require "snacks"

local M = {}

function M.select_around_function()
  select.select_textobject("@function.outer", "textobjects")
end

function M.select_inner_function()
  select.select_textobject("@function.inner", "textobjects")
end

function M.select_around_class()
  select.select_textobject("@class.outer", "textobjects")
end

function M.select_inner_class()
  select.select_textobject("@class.inner", "textobjects")
end

function M.select_around_argument()
  select.select_textobject("@parameter.outer", "textobjects")
end

function M.select_inner_argument()
  select.select_textobject("@parameter.inner", "textobjects")
end

function M.select_around_scope()
  select.select_textobject("@local.scope", "locals")
end

function M.goto_next_function()
  move.goto_next_start({ "@function.outer", "@class.outer", "@method.outer" }, "textobjects")
  vim.cmd "normal! zz"
end

function M.goto_previous_function()
  move.goto_previous_start({ "@function.outer", "@class.outer", "@method.outer" }, "textobjects")
  vim.cmd "normal! zz"
end

local layout = { layout = "ivy", win = { preview = { wo = { wrap = true } } } }

function M.show_marks()
  snacks.picker.marks(layout)
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
