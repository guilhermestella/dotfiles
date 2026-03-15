local opt_path = vim.fn.stdpath("config") .. "/lua/lsp"

for _, file in ipairs(vim.fn.readdir(opt_path)) do
  local mod = file:match("^(.+)%.lua$")
  if mod and mod ~= "init" then
    require("lsp." .. mod)
  end
end
