require('core.config.keymaps')
require('core.config.options')
require('core.config.autocmds')
require('lazy').setup({
    spec = {
        { import = 'core.plugins.ui' },
        { import = 'core.plugins.code' },
        { import = 'core.plugins.nav' },
        { import = 'core.plugins.git' },
    },
})
