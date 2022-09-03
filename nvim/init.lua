require 'options'
require 'keymaps'
require 'plugins'

require 'plugins.nvimtree'
require 'plugins.treesiter'
require 'plugins.lua-line'
--require 'plugins.coc'
require 'plugins.ale'
require 'plugins.phpcs'
require 'plugins.php-refactoring'
require 'functions'
--require 'plugins.coqq'
require 'plugins.lsp-config'
require 'plugins.lspsignature'
require 'plugins.intelephense'
require 'plugins.cmp2'
require'lspconfig'.sumneko_lua.setup{
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          'vim'
        }
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false
      }
    }
  }
}

require'lspconfig'.intelephense.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.dockerls.setup{}
require'lspconfig'.dotls.setup{}
require'lspconfig'.efm.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.phpactor.setup{}
require'lspconfig'.psalm.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.vuels.setup{}




require 'colorizer'.setup()
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

local lsp_status = require('lsp-status')

lsp_status.register_progress()

local lspconfig = require('lspconfig')

-- Some arbitrary servers
--[[lspconfig.clangd.setup({
  handlers = lsp_status.extensions.clangd.setup(),
  init_options = {
    clangdFileStatus = true
  },
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities
})
]]
--[[lspconfig.pyls_ms.setup({
  handlers = lsp_status.extensions.pyls_ms.setup(),
  settings = { python = { workspaceSymbols = { enabled = true }}},
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities
})
]]
lspconfig.ghcide.setup({
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities
})
lspconfig.rust_analyzer.setup({
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities
})

-- Example config in lua
vim.g.nord_contrast = true
vim.g.nord_borders = false
vim.g.nord_disable_background = false
vim.g.nord_italic = false
vim.g.nord_uniform_diff_background = true
require('nord').set()
require('lualine').setup {
  options = {
    theme = 'nord'
  }
}
