call plug#begin('~/.vim/plugged')

" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Coding
Plug 'Yggdroot/indentLine'
Plug 'ntpeters/vim-better-whitespace'

" Other
Plug 'vim-jp/vimdoc-ja'
Plug 'liuchengxu/vim-which-key'

call plug#end()

" Load Plugin Config
runtime! plugin-config/*.vim
