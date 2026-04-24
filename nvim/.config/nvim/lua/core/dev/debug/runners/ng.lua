local function split_args(cmd)
  local result = {}
  local inQuote = nil
  local current = {}
  for char in cmd:gmatch "." do
    if char == "'" and not inQuote then
      inQuote = "'"
    elseif char == "'" and inQuote == "'" then
      table.insert(result, table.concat(current))
      current = {}
      inQuote = nil
    elseif char == " " and not inQuote then
      if #current > 0 then
        table.insert(result, table.concat(current))
        current = {}
      end
    else
      table.insert(current, char)
    end
  end
  if #current > 0 then
    table.insert(result, table.concat(current))
  end
  return result
end

return function(runner, args)
  local arg = split_args(args)
  return {
    type = "pwa-node",
    request = "launch",
    name = "Ng",
    cwd = "${workspaceFolder}",
    program = "${workspaceFolder}" .. "/node_modules/.bin/" .. runner,
    args = arg,
    console = "integratedTerminal",
  }
end
