return {
    {
        'luukvbaal/statuscol.nvim',
        config = function()
            local builtin = require("statuscol.builtin")

            require('statuscol').setup {
                relculright = true,
                segments = {
                    { sign = { namespace = { "gitsign" } } },
                    -- uncomment to add marks (when relevant)
                    -- {
                    --     text = {
                    --         function(args)
                    --             for _, mark in ipairs(vim.fn.getmarklist(args.buf)) do
                    --                 if mark.pos[2] == args.lnum then
                    --                     return mark.mark:sub(-1)
                    --                 end
                    --             end
                    --             return ''
                    --         end
                    --
                    --     }
                    -- },
                    { sign = { namespace = { 'diagnostic' } } },
                    { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
                    { text = { builtin.lnumfunc, ' ' }, click = 'v:lua.ScLa' },
                },
            }
        end
    }
}
