vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "nvim-treesitter" and kind == "update" then
      if not ev.data.active then
        vim.cmd.packadd "nvim-treesitter"
      end
      vim.cmd "TSUpdate"
    end
  end,
})

vim.pack.add {
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
}

require("nvim-treesitter").setup {
  highlight = { enable = true },
  auto_install = true,
  indent = { enable = true },
  ensure_installed = {
    "angular",
    "bash",
    "c",
    "css",
    "html",
    "java",
    "javascript",
    "json",
    "latex",
    "lua",
    "luadoc",
    "luap",
    "markdown",
    "markdown_inline",
    "proto",
    "python",
    "query",
    "regex",
    "rust",
    "scss",
    "svelte",
    "swift",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "vue",
    "yaml",
  },
}
