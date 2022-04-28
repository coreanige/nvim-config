if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

if has("nvim")
  Plug 'neovim/nvim-lspconfig'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'tami5/lspsaga.nvim', { 'branch': 'nvim6.0' }
  Plug 'folke/lsp-colors.nvim'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'hrsh7th/vim-lamp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'    
  Plug 'hrsh7th/cmp-cmdline' 
  Plug 'hrsh7th/nvim-cmp'
  " For vsnip users.
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'

  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'onsails/lspkind-nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'BurntSushi/ripgrep'
  Plug 'windwp/nvim-autopairs'
  Plug 'windwp/nvim-ts-autotag'
endif

Plug 'groenewege/vim-less', { 'for': 'less' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" nerdtree 用來開啟樹狀圖目錄
Plug 'preservim/nerdtree'
" easymotion
Plug 'easymotion/vim-easymotion'

" commentary
Plug 'tpope/vim-commentary'

Plug 'tpope/vim-surround'
Plug 'posva/vim-vue'
Plug 'sadko4u/lsp-plugins'
Plug 'johnsoncodehk/volar'
Plug 'yaegassy/coc-volar-tools', {'do': 'yarn install --frozen-lockfile'}

" Plug 'rafamadriz/friendly-snippets'
" lspkind
Plug 'onsails/lspkind-nvim'

"Plug 'posva/vim-vue'
" 打開命令列模式
Plug 'akinsho/toggleterm.nvim'
" 
Plug 'terryma/vim-multiple-cursors'
"Dashboard
Plug 'glepnir/dashboard-nvim'
Plug 'prettier/vim-prettier'
call plug#end()
