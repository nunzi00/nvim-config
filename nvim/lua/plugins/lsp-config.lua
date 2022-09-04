local lsp_defaults = {
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
  on_attach = function(client, bufnr)
  vim.api.nvim_exec_autocmds('User', {pattern = 'LspAttached'})
  end
} 
local lspconfig= require('lspconfig')

lspconfig.util.default_config = vim.tbl_deep_extend(
  'force',
  lspconfig.util.default_config,
  lsp_defaults
)
lspconfig.sumneko_lua.setup({
  single_file_support = true,
  on_attach = function(client, bufnr)
    print('hello')
    lspconfig.util.default_config.on_attach(client, bufnr)
  end
})
vim.api.nvim_create_autocmd('User', {
  pattern = 'LspAttached',
  desc = 'LSP actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = {buffer = true}
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Displays hover information about the symbol under the cursor
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

    -- Jump to the definition
    bufmap('n', 'gd', 'vim.lsp.buf.definition<cr>')

    -- Jump to declaration
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

    -- Lists all the implementations for the symbol under the cursor
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

    -- Jumps to the definition of the type symbol
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

    -- Lists all the references 
    bufmap('n', 'gr', 'vim.lsp.buf.references<cr>')

    -- Displays a function's signature information
    bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

    -- Renames all references to the symbol under the cursor
    bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

    -- Selects a code action available at the current cursor position
    bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')

    -- Show diagnostics in a floating window
    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

    -- Move to the previous diagnostic
    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

    -- Move to the next diagnostic
    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
  end
})
require("nvim-lsp-installer").setup({
    ensure_installed = { 'dockerls', 'dotls', 'eslint', 'tsserver', 'remark_ls', 'intelephense', 'phpactor', 'psalm', 'volar', 'lemminx', 'yamlls', 'bashls'} ,
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})


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
--require'lspconfig'.efm.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.phpactor.setup{}
require'lspconfig'.psalm.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.vuels.setup{}
--[[local lsp = {
  protocol = protocol,

  handlers = default_handlers,

  buf = require('vim.lsp.buf'),
  diagnostic = require('vim.lsp.diagnostic'),
  codelens = require('vim.lsp.codelens'),
  util = util,

  -- Allow raw RPC access.
  rpc = lsp_rpc,

  -- Export these directly from rpc.
  rpc_response_error = lsp_rpc.rpc_response_error,
}
-- maps request name to the required server_capability in the client.
lsp._request_name_to_capability = {
  ['textDocument/hover'] = { 'hoverProvider' },
  ['textDocument/signatureHelp'] = { 'signatureHelpProvider' },
  ['textDocument/definition'] = { 'definitionProvider' },
  ['textDocument/implementation'] = { 'implementationProvider' },
  ['textDocument/declaration'] = { 'declarationProvider' },
  ['textDocument/typeDefinition'] = { 'typeDefinitionProvider' },
  ['textDocument/documentSymbol'] = { 'documentSymbolProvider' },
  ['textDocument/prepareCallHierarchy'] = { 'callHierarchyProvider' },
  ['textDocument/rename'] = { 'renameProvider' },
  ['textDocument/prepareRename'] = { 'renameProvider', 'prepareProvider' },
  ['textDocument/codeAction'] = { 'codeActionProvider' },
  ['textDocument/codeLens'] = { 'codeLensProvider' },
  ['codeLens/resolve'] = { 'codeLensProvider', 'resolveProvider' },
  ['workspace/executeCommand'] = { 'executeCommandProvider' },
  ['workspace/symbol'] = { 'workspaceSymbolProvider' },
  ['textDocument/references'] = { 'referencesProvider' },
  ['textDocument/rangeFormatting'] = { 'documentRangeFormattingProvider' },
  ['textDocument/formatting'] = { 'documentFormattingProvider' },
  ['textDocument/completion'] = { 'completionProvider' },
  ['textDocument/documentHighlight'] = { 'documentHighlightProvider' },
}
]]
