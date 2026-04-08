local neo_tree = require "neo-tree"

neo_tree.setup {
  sources = {
    "filesystem",
    "buffers",
    "git_status",
    "document_symbols",
  },
  clipboard = { sync = "global" },
  hide_root_node = true,
  source_selector = {
    winbar = true,
    statusline = true,
    sources = {
      { source = "filesystem", display_name = " 󰉓 File " },
      { source = "buffers", display_name = " 󰈚 Buf " },
      { source = "git_status", display_name = " 󰊢 Git " },
      { source = "document_symbols", display_name = " 󰆧 Symb " },
    },
  },
  window = {
    position = "left",
    width = 40,
    mappings = {
      ["<space>"] = false,
      ["l"] = "open",
      ["h"] = "close_node",
      ["P"] = false,
      ["<C-f>"] = false,
      ["<C-b>"] = false,
      ["s"] = "open_split",
      ["v"] = "open_vsplit",
      ["t"] = false,
      ["w"] = false,
      ["C"] = false,
      ["Z"] = "expand_all_nodes",
      ["<C-r>"] = false,
      ["e"] = false,
      ["<"] = false,
      [">"] = false,
    },
  },
  filesystem = {
    filtered_items = {
      visible = false,
      always_show = {
        ".gitignore",
        ".babelrc",
        ".eslintrc*",
        ".github/",
      },
      hide_by_name = {
        ".git",
        "target/",
        "node_modules/",
      },
    },
    window = {
      mappings = {
        ["<bs>"] = false,
        ["."] = false,
      },
    },
  },
  buffers = {
    show_unloaded = true,
    window = {
      mappings = {
        ["<bs>"] = false,
        ["."] = false,
        ["bd"] = false,
        ["b"] = false,
      },
    },
  },
  git_status = {
    window = {
      mappings = {
        ["A"] = false,
        ["gu"] = false,
        ["gU"] = false,
        ["ga"] = false,
        ["gt"] = false,
        ["gr"] = false,
        ["gc"] = false,
        ["gp"] = false,
        ["gg"] = false,
        ["i"] = "show_file_details",
        ["b"] = false,
      },
    },
  },
}
