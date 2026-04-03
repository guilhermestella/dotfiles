return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
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
        filtered_items = { visible = true },
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
    },
    config = function(_, opts)
      -- better toggle
      local function toggle(source)
        local win = vim.api.nvim_get_current_win()
        local buf = vim.api.nvim_win_get_buf(win)
        local buf_name = vim.api.nvim_buf_get_name(buf)

        if buf_name:match "neo%-tree" and buf_name:match(source) then
          vim.cmd("Neotree " .. source .. " close")
        else
          vim.cmd("Neotree " .. source .. " focus reveal left")
        end
      end

      -- IDE inheritance shortcuts
      vim.keymap.set("n", "<leader>e", function()
        toggle "filesystem"
      end, { desc = "➜ Toggle Explorer" })

      vim.keymap.set("n", "<M-1>", function()
        toggle "filesystem"
      end, { desc = "➜ Toggle Explorer" })

      vim.keymap.set("n", "<M-2>", function()
        toggle "buffers"
      end, { desc = "➜ Toggle Buffers" })

      vim.keymap.set("n", "<M-3>", function()
        toggle "git_status"
      end, { desc = "➜ Toggle Git Status" })

      vim.keymap.set("n", "<M-4>", function()
        toggle "document_symbols"
      end, { desc = "➜ Toggle Structure" })

      require("neo-tree").setup(opts)
    end,
  },
}
