local fn = require "core.dev.debug.functions"

return function(runner, args)
  local arg = fn.split_args(args)
  table.insert(arg, "--no-file-parallelism")
  table.insert(arg, "--testTimeout=30000")

  return {
    type = "pwa-node",
    request = "launch",
    name = "Vitest",
    cwd = "${workspaceFolder}",
    program = "${workspaceFolder}" .. "/node_modules/.bin/" .. runner,
    args = arg,
    console = "integratedTerminal",
  }
end
