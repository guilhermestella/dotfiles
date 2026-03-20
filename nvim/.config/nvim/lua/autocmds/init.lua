local opt_path = vim.fn.stdpath("config") .. "/lua/autocmds"

for _, file in ipairs(vim.fn.readdir(opt_path)) do
  local mod = file:match("^(.+)%.lua$")
  if mod and mod ~= "init" then
    require("autocmds." .. mod)
  end
end
