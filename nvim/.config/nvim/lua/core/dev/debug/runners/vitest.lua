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
  table.insert(arg, "--inspect-brk")
  table.insert(arg, "--no-file-parallelism")
  table.insert(arg, "--testTimeout=30000")

  return {
    type = "pwa-node",
    request = "launch",
    name = "Vitest",
    cwd = "${workspaceFolder}",
    program = "${workspaceFolder}" .. "/" .. runner,
    args = arg,
    console = "integratedTerminal",
  }
end
