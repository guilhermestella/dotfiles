-- ════════════════════════════════════════════════════════════════════════════
-- Close buffer but does not mess with UI
-- ════════════════════════════════════════════════════════════════════════════

local M = {}

function M.new_scratch()
  vim.ui.input({ prompt = "Scratch name: " }, function(name)
    if name and name ~= "" then
      local cwd = vim.fn.getcwd()
      local scratch_dir = cwd .. "/.scratch"

      if vim.fn.isdirectory(scratch_dir) == 0 then
        vim.fn.mkdir(scratch_dir, "p")
      end

      local ext = vim.fn.fnamemodify(name, ":e")
      if ext == "" then
        name = name .. ".md"
      end

      vim.cmd("edit " .. scratch_dir .. "/" .. name)
    end
  end)
end

return M
