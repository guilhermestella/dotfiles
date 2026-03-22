return {
  "Hajime-Suzuki/vuffers.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  keys = {
    { "<c-w>`", function() require("vuffers").toggle() end, desc = "➜ Toggle Vuffers" },
  },
  config = function()
    local vuffers = require("vuffers")

    vuffers.setup({
      debug = {
        enabled = false,
        level = "error",
      },
      exclude = {
        filenames = { "term://" },
        filetypes = { "lazygit", "NvimTree", "qf" },
      },
      handlers = {
        on_delete_buffer = function(bufnr)
          vim.api.nvim_command(":bwipeout " .. bufnr)
        end,
      },
      keymaps = {
        use_default = true,
        view = {
          open = "<CR>",
          delete = "d",
          pin = "p",
          unpin = "P",
          move_up = "U",
          move_down = "D",
        },
      },
      sort = {
        type = "none",
        direction = "asc",
      },
      view = {
        modified_icon = "󰛿",
        pinned_icon = "󰐾",
        show_file_extension = true,
        window = {
          auto_resize = true,
          width = 40,
          focus_on_open = false,
        },
      },
    })

    local function set_vuffers_highlights()
      local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
      local yellow = vim.api.nvim_get_hl(0, { name = "GruvboxYellow" })
      local green = vim.api.nvim_get_hl(0, { name = "GruvboxGreen" })
      local orange = vim.api.nvim_get_hl(0, { name = "GruvboxOrange" })
      local aqua = vim.api.nvim_get_hl(0, { name = "GruvboxAqua" })

      vim.api.nvim_set_hl(0, "VuffersWindowBackground", {
        fg = normal.fg,
      })
      vim.api.nvim_set_hl(0, "VuffersActiveBuffer", {
        fg = yellow.fg,
        bold = true,
      })
      vim.api.nvim_set_hl(0, "VuffersModifiedIcon", {
        fg = orange.fg,
      })
      vim.api.nvim_set_hl(0, "VuffersPinnedIcon", {
        fg = aqua.fg,
      })
      vim.api.nvim_set_hl(0, "VuffersActivePinnedIcon", {
        fg = green.fg,
        bold = true,
      })
    end

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "vuffers",
      callback = function(ev)
        vim.api.nvim_buf_set_name(ev.buf, "~~~ Opened Buffers ~~~")
      end
    })

    set_vuffers_highlights()

    vim.api.nvim_create_autocmd("User", {
      pattern = "SnacksDashboardClosed",
      desc = "Open vuffers after leaving dashboard",
      callback = function()
        vim.schedule(function()
          vuffers.open()
        end)
      end,
    })
  end,
}
