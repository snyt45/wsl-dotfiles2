" By default blamer_delay is 1000 ms
let g:blamer_delay = 100

let g:blamer_date_format = '%y/%m/%d'

" Execute after loading the color schema
" https://teratail.com/questions/29844#reply-46767
augroup vimrc_blamer
  autocmd!
  " git blame color
  autocmd VimEnter,ColorScheme * highlight Blamer guifg=darkgray ctermfg=darkgray
augroup END
