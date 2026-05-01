local path = vim.fn.stdpath "config" .. "/lua/plugins"
for name, type in vim.fs.dir(path) do
  if type == "file" and name:match "%.lua$" and name ~= "init.lua" then
    require("plugins." .. name:gsub("%.lua$", ""))
  end
end
