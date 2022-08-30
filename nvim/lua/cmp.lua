--local luasnip = require('luasnip')require('luasnip.loaders.from_vscode').lazy_load()
require'cmp'.setup {
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
    }
}

