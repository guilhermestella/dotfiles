local opt_path = vim.fn.stdpath "config" .. "/lua/core/keymaps"

for _, file in ipairs(vim.fn.readdir(opt_path)) do
  local mod = file:match "^(.+)%.lua$"
  if mod and mod ~= "init" then
    require("core.keymaps." .. mod)
  end
end
