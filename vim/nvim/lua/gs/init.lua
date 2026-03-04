require('gs.keymaps')
require('gs.options')
require('lazy').setup({
    spec = {
        { import = 'gs.plugins.ui' },
        { import = 'gs.plugins.code' },
        { import = 'gs.plugins.nav' },
        { import = 'gs.plugins.git' },
    },
})
