local keymap = function(mode, shortcut, command) 
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

vim.g.mapleader = ','

keymap('n', '<leader>w', ':w<cr>')
--keymap('n', '<leader>f', ':Files<cr>')
keymap('n', '<leader>a', ':NvimTreeToggle<cr>')
keymap('n', '<leader>tv', ':botright vnew <Bar> :terminal<cr>')
keymap('n', '<leader>th', ':botright new <Bar> :terminal<cr>')
keymap('t', '<Esc>', '<C-\\><C-n>')

keymap('n', '<leader>f', ':Telescope find_files<cr>')
keymap('n', '<leader>s', ':Telescope live_grep<cr>')

keymap('n', '<C-j>', '<C-W>j')
keymap('n', '<C-k>', '<C-W>k')
keymap('n', '<C-h>', '<C-W>h')
keymap('n', '<C-l>', '<C-W>l')

-- ALE
keymap('n', '<leader>li', ':ALEFix<cr>')

-- PhpActor
keymap('n', '<leader>u', ':call phpactor#UseAdd()<cr>')
keymap('n','<leader>mm', ':call phpactor#ContextMenu()<cr>')
keymap('n','<leader>nn', ':call phpactor#Navigate()<cr>')
keymap('n','<leader>o', ':call phpactor#GotoDefinition()<cr>')
keymap('n','<leader>K', ':call phpactor#Hover()<cr>')
keymap('n','<leader>tt', ':call phpactor#Transform()<cr>')
keymap('n','<leader>cc', ':call phpactor#ClassNew()<cr>')
keymap('n','<silent><leader>ee', ':call phpactor#ExtractExpression(v:false)<cr>')
keymap('v','<silent><leader>ee', ':<C-U>call phpactor#ExtractExpression(v:true)<cr>')
keymap('v','<silent><leader>eem', ':<C-U>call phpactor#ExtractMethod()<cr>')
keymap('v','<silent><leader>eec', ':<C-U>call phpactor#ExtractConstant()<cr>')
keymap('n', '<leader>u', ':phpactor#UseAdd()<cr>')

local map = vim.api.nvim_set_keymap
opts = {}
opts = { noremap=true, silent=true }
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
map('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
map('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)


local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)


-- vdebug
-- Snakeize
-- UltiSnips






--[[
function! ConfigVdebug(project)
  VdebugOpt ide_key GETLIFE_DOCKER
  let g:vdebug_options.path_maps = {"/app": "/home/lucas/getlife/" . a:project}
endfunction

command! VdbgCustomer call ConfigVdebug('customer/back')
command! VdbgAdmin call ConfigVdebug('admin/back')
command! VdbgBroker call ConfigVdebug('customer/back')

function! s:Snakeize(range) abort
  if a:range == 0
    s#\C\(\<\u[a-z0-9]\+\|[a-z0-9]\+\)\(\u\)#\l\1_\l\2#g
  else
    s#\%V\C\(\<\u[a-z0-9]\+\|[a-z0-9]\+\)\(\u\)\%V#\l\1_\l\2#g
  endif
endfunction

command! -range SnakeCase silent! call <SID>Snakeize(<range>)

-- UltiSnips Configuration
let g:UltiSnipsExpandTrigger="<nop>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
--]]
