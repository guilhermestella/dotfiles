local text_objects = require "nvim-treesitter-textobjects"
local ufo = require "ufo"
local autopairs = require "nvim-autopairs"
local surround = require "nvim-surround"

text_objects.setup {
  select = {
    lookahead = true,
    selection_modes = {
      ["@parameter.outer"] = "v",
      ["@function.outer"] = "V",
      ["@class.outer"] = "V",
    },
    include_surrounding_whitespace = false,
  },
  move = {
    set_jumps = true,
  },
}

ufo.setup {
  provider_selector = function()
    return { "treesitter", "indent" }
  end,
}

autopairs.setup()
surround.setup()
