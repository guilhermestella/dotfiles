return {
  -- https://github.com/StevanFreeborn/nvim-config/blob/main/lua/plugins/debugging.lua
  {
    type = "pwa-chrome",
    request = "launch",
    name = "Launch Brave (nvim-dap)",
    url = "http://localhost:4200",
    webRoot = "${workspaceFolder}",
    sourceMaps = true,
    runtimeExecutable = "/usr/bin/brave-browser",
  },
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file using Node.js (nvim-dap)",
    program = "${file}",
    args = "${args}",
    cwd = "${workspaceFolder}",
    console = "integratedTerminal",
  },
}
