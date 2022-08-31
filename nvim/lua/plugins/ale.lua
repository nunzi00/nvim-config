vim.g['ale_enabled'] = 1
vim.g['ale_lint_on_text_changed'] = 'always'
--vim.g['ale_linter_aliases'] = {'vue'= ['vue', 'javascript']}
vim.g['ale_php_phpcbf_standard']='PSR12'
vim.g['ale_php_phpcs_standard']='PSR12'
vim.g['ale_completion_enabled'] = 1

vim.g['ale_linters'] = {
--   '*': ['remove_trailing_lines', 'trim_whitespace'],
   bash = {'shellcheck'},
   html = {'html-beautify', 'prettier'},
   javascript= {'eslint', 'prettier-eslint'},
   json= {'prettier'},
   lua = {'luafmt'},
   make = {'checkmake'},
   markdown= {'prettier'},
   php= {'phpcs', 'php', 'psalm', 'intelephense', 'phpactor', 'phpstan'},
   sql = {'sqlfmt'},
   typescript= {'eslint'},
   vim = {'vimls'},
   vue= {'eslint', 'vls'},
   xml = {'xmllint'},
   yaml = {'prettier'}
  }

vim.g['ale_fixers'] = {                 
   bash = {'shellfmt'},
   javascript= {'eslint'},
   json= {'prettier'},
   lua = {'luafmt'},
   make = {'checkmake'},
   markdown= {'prettier'},
   php ={'phpcbf'},
   typescript= {'eslint'},
   vim = {'vimls'},
   vue= {'vls'},
   yaml = {'prettier'}
  }

vim.g['ale_fix_on_save'] = 1

