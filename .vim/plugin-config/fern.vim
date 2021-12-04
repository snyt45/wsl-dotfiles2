" Show hidden files
let g:fern#default_hidden=1

" Vim起動時にfernを開く
augroup vimrc_fern_settings
  autocmd!
  autocmd VimEnter * ++nested Fern . -drawer -stay -keep -toggle -reveal=%
augroup END
