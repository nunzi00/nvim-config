vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'w0rp/ale',
    ft = {'bash', 'html', 'javascript', 'json', 'lua', 'make', 'markdown', 'php', 'sql', 'typescript', 'vim', 'vue',  'xml', 'yaml'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }
  use 'neovim/nvim-lspconfig'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.x',
    requires = {'nvim-lua/plenary.nvim'}
  }
  use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
--[[  use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'octaltree/cmp-look', 
            'hrsh7th/cmp-path', 
            'hrsh7th/cmp-calc',
            'f3fora/cmp-spell', 
            'hrsh7th/cmp-emoji'  
        }
  }]]
  use 'L3MON4D3/LuaSnip'
  use {
  'kyazdani42/nvim-tree.lua',
  requires = {
    'kyazdani42/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
}
  use 'ap/vim-css-color'
  use 'SirVer/ultisnips'
--  use {'neoclide/coc.nvim', branch= 'release'}
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }
  use 'editorconfig/editorconfig-vim'
  use 'jiangmiao/auto-pairs'

  -- PHP
  use {'StanAngeloff/php.vim', ft = 'php'}
  use {'phpactor/phpactor' ,  run =  'composer install -o', ft= 'php'}
  use {'lumiliet/vim-twig', ft = 'php'}
  use {'adoy/vim-php-refactoring-toolbox', ft = 'php'}
  use {'vim-vdebug/vdebug', ft = 'php'}
  use {'stephpy/vim-php-cs-fixer', ft = 'php'}
  use {'yaegassy/coc-intelephense', run =  'yarn install --frozen-lockfile', ft= 'php'}
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
end)


