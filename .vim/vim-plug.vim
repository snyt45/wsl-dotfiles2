call plug#begin('~/.vim/plugged')
" Colorscheme
Plug 'tomasiser/vim-code-dark'

" File Explorer
Plug 'lambdalisue/fern.vim'
  Plug 'yuki-yano/fern-preview.vim'
  Plug 'lambdalisue/fern-git-status.vim'
  Plug 'lambdalisue/fern-hijack.vim'

" Git
Plug 'APZelos/blamer.nvim'
Plug 'airblade/vim-gitgutter'

Plug 'voldikss/vim-floaterm'

Plug 'vim-jp/vimdoc-ja'
Plug 'liuchengxu/vim-which-key'
call plug#end()

" Load Plugin Config
runtime! plugin-config/*.vim
