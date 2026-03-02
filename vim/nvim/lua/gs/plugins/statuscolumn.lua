return {
    'luukvbaal/statuscol.nvim',
    config = function()
        local builtin = require("statuscol.builtin")
        require('statuscol').setup {
            relculright = true,
            segments = {
                -- Git signs on the left
                {
                    sign = { namespace = { "gitsign" }, colwidth = 2, auto = false },
                    click = "v:lua.ScSa",
                },
                -- LSP/diagnostic signs on the middle
                {
                    sign = { namespace = { ".*" }, name = { ".*" }, colwidth = 2, auto = false },
                    click = "v:lua.ScSa",
                },
                -- Line number in the right
                {
                    text = { builtin.lnumfunc, " " },
                    click = "v:lua.ScLa",
                },
            },
        }
    end
}
