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
--require 'plugins.intelephense'
require 'plugins.cmp2'
--require 'plugins.luasnip'
require 'plugins.buferline'
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
--lspconfig.intelephense.setup({
--  on_attach = lsp_status.on_attach,
--  capabilities = lsp_status.capabilities
--})
--lspconfig.sumneko_lua.setup({
--  on_attach = lsp_status.on_attach,
--  capabilities = lsp_status.capabilities
--})

require('nord').set()
require('lualine').setup {
  options = {
    theme = 'nord'
  }
}



