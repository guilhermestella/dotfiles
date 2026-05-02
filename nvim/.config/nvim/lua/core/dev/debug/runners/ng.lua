local function jest_parser(args)
  local include = args:match "%-%-include=[\"'](.-)[\"']"
  local filter = args:match "%-%-filter=[\"'](.-)[\"']"
  if not (include and filter) then
    return nil
  end
  return string.format("'%s' --testNamePattern='%s'", include, filter)
end

return function(_, args)
  local path = vim.fn.getcwd() .. "/node_modules/.bin"
  local runners = {
    jest = {
      bin = path .. "/jest",
      parser = jest_parser,
    },
  }
  for runner, config in pairs(runners) do
    if vim.fn.executable(config.bin) == 1 then
      local parsed = config.parser(args)
      return require("core.dev.debug.runners." .. runner)(runner, parsed)
    end
  end
  vim.notify("Could not find ng runners in node_modules", vim.log.levels.ERROR)
  return nil
end
