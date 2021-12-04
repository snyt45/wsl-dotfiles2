call plug#begin('~/.vim/plugged')
" Colorscheme
Plug 'tomasiser/vim-code-dark'

" File Explorer
Plug 'lambdalisue/fern.vim'
  Plug 'lambdalisue/fern-git-status.vim'

" fuzzy finder
Plug 'junegunn/fzf.vim' " Use fzf installed with linuxbrew

" Git
Plug 'APZelos/blamer.nvim'
Plug 'airblade/vim-gitgutter'

Plug 'voldikss/vim-floaterm'

" Other
Plug 'vim-jp/vimdoc-ja'
Plug 'liuchengxu/vim-which-key'
call plug#end()

" Load Plugin Config
runtime! plugin-config/*.vim
