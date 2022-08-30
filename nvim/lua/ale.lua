vim.g['ale_enabled'] = 1
vim.g['ale_lint_on_text_changed'] = 'always'
--vim.g['ale_linter_aliases'] = {'vue'= ['vue', 'javascript']}
vim.g['ale_php_phpcbf_standard']='PSR12'
vim.g['ale_php_phpcs_standard']='PSR12'

vim.g['ale_linters'] = {
   javascript= {'eslint'},
   php= {'phpcs', 'php', 'psalm'},
   vue= {'eslint', 'vls'},
   typescript= {'eslint'},
   json= {'prettier'}
  }

vim.g['ale_fixers'] = {                 
   php ={'phpcbf'},
   javascript= {'eslint'},
   typescript= {'eslint'},
   json= {'prettier'}
  }

vim.g['ale_fix_on_save'] = 1

