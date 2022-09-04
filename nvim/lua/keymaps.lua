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

-- Buftabline
keymap('n', '<leader>Q', ':bprevious<cr>')
keymap('n', '<leader>E', ':bnext<cr>')
keymap('v', '<C-/>','lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<cr>')




-- rename rn
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
-- NERDTreeConfig
let g:NERDTreeQuitOnOpen=1

let g:ultisnips_php_scalar_type=1
-- GoTo code navigation.
keymap('n','<silent> gd <Plug>(coc-definition)
keymap('n','<silent> gy <Plug>(coc-type-definition)
keymap('n','<silent> gi <Plug>(coc-implementation)
keymap('n','<silent> gr <Plug>(coc-references)

--]]
