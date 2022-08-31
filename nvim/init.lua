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
require 'plugins.coqq'
require 'plugins.lsp-config'
--require'lspconfig'.tsserver.setup{}
require 'plugins.lspsignature'
require 'plugins.intelephense'
require 'plugins.cmp'
--[[require'lspconfig'.sumneko_lua.setup{
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
}]]

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
