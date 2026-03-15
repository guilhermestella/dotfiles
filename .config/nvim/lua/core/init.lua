require('core.options')
require('core.config.keymaps')
require('core.config.autocmds')
require('lazy').setup({
    spec = {
        { import = 'core.plugins.ui' },
        { import = 'core.plugins.git' },
        { import = 'core.plugins.lsp' },
        { import = 'core.plugins.code' },
        { import = 'core.plugins.debug' },
        { import = 'core.plugins.tools' },
    },
})
