"syntax enable
"filetype plugin indent on     " required!
"autocmd FileType php :setlocal sw=4 ts=4 sts=4
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
"filetype off

"if exists('py2') && has('python')
"elseif has('python3')
"endif

call plug#begin('~/.vim/plugged')
"Plug 'airblade/vim-gitgutter'
"Plug 'Yggdroot/indentLine'
"Plug 'tpope/vim-fugitive'
"Plug 'tommcdo/vim-fubitive'
"Plug 'ap/vim-css-color'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
"Plug 'SirVer/ultisnips'

"Autocompletion
"Plug 'neoclide/coc.nvim', {'branch': 'release'}


" Javascript Development
"Plug 'pangloss/vim-javascript'
"Plug 'posva/vim-vue'
"Plug 'mxw/vim-jsx'
"Plug 'leafgarland/typescript-vim'
"Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}

" Uuid Generator
"Plug 'kburdett/vim-nuuid'

" Csv Files
"Plug 'chrisbra/csv.vim'

" Pug
"Plug 'digitaltoad/vim-pug'

"Plug 'ludovicchabant/vim-gutentags'

"Markdown
"Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
"
"Plug 'ap/vim-buftabline'

"Plug 'jiangmiao/auto-pairs'

" necessary to follow styles of a project
"Plug 'editorconfig/editorconfig-vim'

call plug#end()


"if executable('intelephense')
"  augroup LspPHPIntelephense
"    au!
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'intelephense',
"        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'intelephense --stdio']},
"        \ 'whitelist': ['php'],
"        \ 'initialization_options': {'storagePath': '/tmp/intelephense'},
"        \ 'workspace_config': {
"        \   'intelephense': {
"        \     'files': {
"        \       'maxSize': 1000000,
"        \       'associations': ['*.php', '*.phtml'],
"        \       'exclude': [],
"        \     },
"        \     'completion': {
"        \       'insertUseDeclaration': v:true,
"        \       'fullyQualifyGlobalConstantsAndFunctions': v:false,
"        \       'triggerParameterHints': v:true,
"        \       'maxItems': 100,
"        \     },
"        \     'format': {
"        \       'enable': v:true
"        \     },
"        \   },
"        \ }
"        \})
"  augroup END
"endif



"nmap <leader>rn <Plug>(coc-rename)


"let g:gutentags_ctags_exclude = [
"      \ '*.git', '*.svg', '*.hg',
"      \ 'build',
"      \ 'dist',
"      \ '*sites/*/files/*',
"      \ 'bin',
"      \ 'node_modules',
"      \ 'bower_components',
"      \ 'cache',
"      \ 'compiled',
"      \ 'docs',
"      \ 'example',
"      \ 'bundle',
"      \ 'vendor',
"      \ '*.md',
"      \ '*-lock.json',
"      \ '*.lock',
"      \ '*bundle*.js',
"      \ '*build*.js',
"      \ '.*rc*',
"      \ '*.json',
"      \ '*.min.*',
"      \ '*.map',
"      \ '*.bak',
"      \ '*.zip',
"      \ '*.pyc',
"      \ '*.class',
"      \ '*.sln',
"      \ '*.Master',
"      \ '*.csproj',
"      \ '*.tmp',
"      \ '*.csproj.user',
"      \ '*.cache',
"      \ '*.pdb',
"      \ 'tags*',
"      \ 'cscope.*',
"      \ '*.css',
"      \ '*.less',
"      \ '*.scss',
"      \ '*.exe', '*.dll',
"      \ '*.mp3', '*.ogg', '*.flac',
"      \ '*.swp', '*.swo',
"      \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
"      \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
"      \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
"      \ ]

" CUSTOM FUNCTIONS
":command JsonFormat :%!python -m json.tool
"command RemoveTrail execute "%s/\s\+$//"
"inoremap <Leader>rt :RemoveTrail<CR>
"cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"function! ConfigVdebug(project)
"  VdebugOpt ide_key GETLIFE_DOCKER
"  let g:vdebug_options.path_maps = {"/app": "/home/lucas/getlife/" . a:project}
"endfunction

"command! VdbgCustomer call ConfigVdebug('customer/back')
"command! VdbgAdmin call ConfigVdebug('admin/back')
"command! VdbgBroker call ConfigVdebug('customer/back')

"function! s:Snakeize(range) abort
"  if a:range == 0
"    s#\C\(\<\u[a-z0-9]\+\|[a-z0-9]\+\)\(\u\)#\l\1_\l\2#g
"  else
"    s#\%V\C\(\<\u[a-z0-9]\+\|[a-z0-9]\+\)\(\u\)\%V#\l\1_\l\2#g
"  endif
"endfunction

"command! -range SnakeCase silent! call <SID>Snakeize(<range>)

"REMAPS

" Disable Nuuid mappings - conflic with PhpActor
"let g:nuuid_no_mappings = 1

"inoremap jj <Esc>
"noremap <C-l> gt
"noremap <C-h> gT
"noremap <S-l> <C-w>l
"noremap <S-h> <C-w>h
"noremap <S-j> <C-w>j
"noremap <S-k> <C-w>k
" Include use statement
"nmap <Leader>u :call phpactor#UseAdd()<CR>

" Invoke the context menu
"nmap <Leader>mm :call phpactor#ContextMenu()<CR>

" Invoke the navigation menu
"nmap <Leader>nn :call phpactor#Navigate()<CR>

" Goto definition of class or class member under the cursor
"nmap <Leader>o :call phpactor#GotoDefinition()<CR>

" Show brief information about the symbol under the cursor
"nmap <Leader>K :call phpactor#Hover()<CR>

" Transform the classes in the current file
"nmap <Leader>tt :call phpactor#Transform()<CR>

" Generate a new class (replacing the current file)
"nmap <Leader>cc :call phpactor#ClassNew()<CR>

" Extract expression (normal mode)
"nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>

" Extract expression from selection
"vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>

" Extract method from selection
"vmap <silent><Leader>eem :<C-U>call phpactor#ExtractMethod()<CR>
"
" Extract constant from selection
"vmap <silent><Leader>eec :<C-U>call phpactor#ExtractConstant()<CR>


"nmap <S-F2> <Plug>(coc-rename)

" Shortcut for :Files command
"nmap <Leader>f :Files<CR>
"nmap <Leader>fv :vnew<CR>:Files<CR>
"nmap <Leader>fh :new<CR>:Files<CR>
"nmap <Leader>ft :tabnew<CR>:Files<CR>

" Shortcut  for ALEFix
"nmap  <Leader>af :ALEFix<CR>

" Use <TAB> to select the popup menu:
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~ '\s'
"endfunction

" Insert <tab> when previous text is space, refresh completion if not.
"inoremap <silent><expr> <TAB>
"      \ coc#pum#visible() ? coc#pum#next(1):
"      \ <SID>check_back_space() ? "\<Tab>" :
"      \ coc#refresh()

"inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

"inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

" imap cll console.log()<Esc>==f(a
"au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
"nmap <S-F4> :execute "silent grep! -R " . expand("<cword>") . " ./**" <Bar> cw<CR>
" Highlight jenkinsfiles
"au BufNewFile,BufRead Jenkinsfile setf groovy
" Extract expression (normal mode)
"nmap <silent><Leader>ef :CocCommand eslint.executeAutofix<CR>
" UltiSnips Configuration
"let g:UltiSnipsExpandTrigger="<nop>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" NERDTreeConfig
"let g:NERDTreeQuitOnOpen=1

"let g:ultisnips_php_scalar_type=1
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l
"noremap <leader>s :CocSearch
"noremap <leader>tv :botright vnew <Bar> :terminal<cr>
"noremap <leader>th :botright new <Bar> :terminal<cr>
" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
