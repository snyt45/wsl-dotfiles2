call plug#begin('~/.vim/plugged')
" Colorscheme
Plug 'tomasiser/vim-code-dark'

" File Explorer
Plug 'lambdalisue/fern.vim'
  Plug 'lambdalisue/fern-git-status.vim'

" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git
Plug 'airblade/vim-gitgutter'

Plug 'voldikss/vim-floaterm'

" Coding
Plug 'Yggdroot/indentLine'
Plug 'ntpeters/vim-better-whitespace'

" Other
Plug 'vim-jp/vimdoc-ja'
Plug 'liuchengxu/vim-which-key'

call plug#end()

" Load Plugin Config
runtime! plugin-config/*.vim
