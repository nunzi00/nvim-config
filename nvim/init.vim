set nocompatible
set background=dark

syntax on
set number
set list
set expandtab
set tabstop=2
set showtabline=2
set shiftwidth=2
set showcmd
set showmode
set laststatus=2
set mouse=a
" Speed up scrolling in Vim
set ttyfast
let mapleader = ','
set colorcolumn=120
set splitbelow
" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>
" Encoding
set encoding=utf-8
" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase
set showmatch

autocmd FileType php :setlocal sw=4 ts=4 sts=4
"autocmd VimEnter * ++nested  split term://zsh 
filetype off

filetype plugin indent on

"set termguicolors

if exists('py2') && has('python')
elseif has('python3')
endif

" Load vim-plug
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
    execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

" PLUGINS
call plug#begin()
"Linting
Plug 'w0rp/ale'

Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-fubitive'
Plug 'ap/vim-css-color'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'

"Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" PHP Development
Plug 'phpactor/phpactor' ,  {'do': 'composer install -o', 'for': 'php'}
Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug 'lumiliet/vim-twig'
Plug 'adoy/vim-php-refactoring-toolbox', {'for': 'php'}
Plug 'vim-vdebug/vdebug'
Plug 'stephpy/vim-php-cs-fixer', { 'for': 'php' }

" Javascript Development
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}

" Uuid Generator
Plug 'kburdett/vim-nuuid'

" Csv Files
Plug 'chrisbra/csv.vim'

" Pug
Plug 'digitaltoad/vim-pug'

" Themes
"Plug 'k4yt3x/ayu-vim-darker'
"Plug 'Siphalor/vim-atomified'
"Plug 'tomasiser/vim-code-dark'
"Plug 'trusktr/seti.vim'
"Plug 'patstockwell/vim-monokai-tasty'
"Plug 'nanotech/jellybeans.vim' , {'as': 'jellybeans'}
"Plug 'chuling/vim-equinusocio-material'
"Plug 'jaredgorski/spacecamp'
Plug 'arcticicestudio/nord-vim'
"Plug 'sainnhe/sonokai'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'

"Tags
Plug 'ludovicchabant/vim-gutentags'

"Markdown
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Iconos Tree Sitter
Plug 'ryanoasis/vim-devicons'

" LuaLine
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'

" Tabs
Plug 'ap/vim-buftabline'

" makes vim autocomplete (), [], {}, '', "", etc
Plug 'jiangmiao/auto-pairs'

" necessary to follow styles of a project
Plug 'editorconfig/editorconfig-vim'

call plug#end()


" Load LuaLine  Config
lua << END
require('lualine').setup({
options = {
      theme = 'auto', -- lualine theme
      icons_enabled = true,
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' }
      },
sections = {
  lualine_a = { "mode", "os.date('%c')", 
  {
          'diagnostics',
    
          -- Table of diagnostic sources, available sources are:
          --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
          -- or a function that returns a table as such:
          --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
          sources = { 'nvim_diagnostic', 'coc' },
    
          -- Displays diagnostics for the defined severity types
          sections = { 'error', 'warn', 'info', 'hint' },
    
          diagnostics_color = {
            -- Same values as the general color option can be used here.
            error = 'DiagnosticError', -- Changes diagnostics' error color.
            warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
            info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
            hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
          },
          symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
          colored = true,           -- Displays diagnostics status in color if set to true.
          update_in_insert = false, -- Update diagnostics in insert mode.
          always_visible = false,   -- Show diagnostics even if there are none.
        }
        },
  lualine_b = { "filename"},
  lualine_c = { "g:coc_status" },
  lualine_x = { "branch", "diff"},
  lualine_y = { "encoding",         {
          'fileformat',
          symbols = {
            unix = '', -- e712
            dos = '',  -- e70f
            mac = '',  -- e711
          }
        }},
  lualine_z = { "location" }
  },
  extensions = {'fzf', 'nerdtree'}
})
END

if executable('intelephense')
  augroup LspPHPIntelephense
    au!
    au User lsp_setup call lsp#register_server({
        \ 'name': 'intelephense',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'intelephense --stdio']},
        \ 'whitelist': ['php'],
        \ 'initialization_options': {'storagePath': '/tmp/intelephense'},
        \ 'workspace_config': {
        \   'intelephense': {
        \     'files': {
        \       'maxSize': 1000000,
        \       'associations': ['*.php', '*.phtml'],
        \       'exclude': [],
        \     },
        \     'completion': {
        \       'insertUseDeclaration': v:true,
        \       'fullyQualifyGlobalConstantsAndFunctions': v:false,
        \       'triggerParameterHints': v:true,
        \       'maxItems': 100,
        \     },
        \     'format': {
        \       'enable': v:true
        \     },
        \   },
        \ }
        \})
  augroup END
endif


" proper true colors for terminal
if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
set termguicolors

nmap <leader>rn <Plug>(coc-rename)

" Buftabline
nnoremap <C-q> :bnext<CR>
nnoremap <C-e> :bprev<CR>

"THEMING
let ayucolor='dark'
let g:equinusocio_material_darker = 1
let g:sonokai_style = 'shusia'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 0

let g:gruvbox_italic=1
let g:gruvbox_italicize_comments=1
let g:gruvbox_contrast_dark='hard'

colorscheme purify


"ALE
let g:ale_enabled = 1
let g:ale_lint_on_text_changed = 'always'

let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_php_phpcbf_standard='PSR12'
let g:ale_php_phpcs_standard='PSR12'
let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'php': ['phpcs', 'php', 'psalm'],
\ 'python': ['pylint'],
\ 'vue': ['eslint', 'vls'],
\ 'typescript': ['eslint']
\}
let g:ale_fixers = {
  \ 'php': ['phpcbf', 'remove_trailing_lines', 'trim_whitespace'],
  \ 'javascript': ['eslint'],
  \ 'typescript': ['eslint'],
  \ 'python': ['black', 'add_blank_lines_for_python_control_statements', 'isort', 'remove_trailing_lines', 'reorder-python-imports', 'trim_whitespace', 'yapf']
  \}

let g:ale_fix_on_save = 1
" Allow JSX in normal JS files
let g:jsx_ext_required = 0


let Vimphpcs_Standard='PSR12'"

let g:vdebug_options = {
\    "break_on_open" : 0,
\    "port" : 9003,
\}
let g:vdebug_keymap = {
\    "eval_under_cursor" : "<Leader>ee"
\}

" NEWTR
" let g:netrw_liststyle = 3
let g:netrw_banner = 0

"set statusline+=%{gutentags#statusline()}
let g:gutentags_ctags_exclude = [
      \ '*.git', '*.svg', '*.hg',
      \ 'build',
      \ 'dist',
      \ '*sites/*/files/*',
      \ 'bin',
      \ 'node_modules',
      \ 'bower_components',
      \ 'cache',
      \ 'compiled',
      \ 'docs',
      \ 'example',
      \ 'bundle',
      \ 'vendor',
      \ '*.md',
      \ '*-lock.json',
      \ '*.lock',
      \ '*bundle*.js',
      \ '*build*.js',
      \ '.*rc*',
      \ '*.json',
      \ '*.min.*',
      \ '*.map',
      \ '*.bak',
      \ '*.zip',
      \ '*.pyc',
      \ '*.class',
      \ '*.sln',
      \ '*.Master',
      \ '*.csproj',
      \ '*.tmp',
      \ '*.csproj.user',
      \ '*.cache',
      \ '*.pdb',
      \ 'tags*',
      \ 'cscope.*',
      \ '*.css',
      \ '*.less',
      \ '*.scss',
      \ '*.exe', '*.dll',
      \ '*.mp3', '*.ogg', '*.flac',
      \ '*.swp', '*.swo',
      \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
      \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
      \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
      \ ]

" COC GLOBAL EXTENSIONS
let g:coc_global_extensions = [
      \'@yaegassy/coc-volar',
      \'coc-css',
      \'coc-docker',
      \'coc-eslint',
      \'coc-gitignore',
      \'coc-html',
      \'coc-jedi',
      \'coc-json',
      \'coc-marketplace',
      \'coc-phpls',
      \'coc-sh',
      \'coc-stylelint',
      \'coc-tsserver',
      \'coc-ultisnips',
      \'coc-webpack',
      \'coc-xml',
      \'coc-yaml',
      \]
" CUSTOM FUNCTIONS
:command JsonFormat :%!python -m json.tool
command RemoveTrail execute "%s/\s\+$//"
inoremap <Leader>rt :RemoveTrail<CR>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

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

"REMAPS
map <Leader>a :NERDTreeToggle<CR>
map <Leader>s :NERDTreeFocus<CR/back>

"map <Leader>a :vs .<CR>

" Disable Nuuid mappings - conflic with PhpActor
let g:nuuid_no_mappings = 1

inoremap jj <Esc>
noremap <C-l> gt
noremap <C-h> gT
noremap <S-l> <C-w>l
noremap <S-h> <C-w>h
noremap <S-j> <C-w>j
noremap <S-k> <C-w>k
" Include use statement
nmap <Leader>u :call phpactor#UseAdd()<CR>

" Invoke the context menu
nmap <Leader>mm :call phpactor#ContextMenu()<CR>

" Invoke the navigation menu
nmap <Leader>nn :call phpactor#Navigate()<CR>

" Goto definition of class or class member under the cursor
nmap <Leader>o :call phpactor#GotoDefinition()<CR>

" Show brief information about the symbol under the cursor
nmap <Leader>K :call phpactor#Hover()<CR>

" Transform the classes in the current file
nmap <Leader>tt :call phpactor#Transform()<CR>

" Generate a new class (replacing the current file)
nmap <Leader>cc :call phpactor#ClassNew()<CR>

" Extract expression (normal mode)
nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>

" Extract expression from selection
vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>

" Extract method from selection
vmap <silent><Leader>eem :<C-U>call phpactor#ExtractMethod()<CR>
"
" Extract constant from selection
vmap <silent><Leader>eec :<C-U>call phpactor#ExtractConstant()<CR>


nmap <S-F2> <Plug>(coc-rename)

" Shortcut for :Files command
nmap <Leader>f :Files<CR>
"nmap <Leader>fv :vnew<CR>:Files<CR>
"nmap <Leader>fh :new<CR>:Files<CR>
"nmap <Leader>ft :tabnew<CR>:Files<CR>

" Shortcut  for ALEFix
nmap  <Leader>af :ALEFix<CR>

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

" imap cll console.log()<Esc>==f(a
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
nmap <S-F4> :execute "silent grep! -R " . expand("<cword>") . " ./**" <Bar> cw<CR>
" Highlight jenkinsfiles
au BufNewFile,BufRead Jenkinsfile setf groovy
" Extract expression (normal mode)
nmap <silent><Leader>ef :CocCommand eslint.executeAutofix<CR>
" UltiSnips Configuration
let g:UltiSnipsExpandTrigger="<nop>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" NERDTreeConfig
let g:NERDTreeQuitOnOpen=1

let g:ultisnips_php_scalar_type=1
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
noremap <leader>s :CocSearch
noremap <leader>tv :botright vnew <Bar> :terminal<cr>
noremap <leader>th :botright new <Bar> :terminal<cr>
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
