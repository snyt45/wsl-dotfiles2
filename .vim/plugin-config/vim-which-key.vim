" By default timeoutlen is 1000 ms
set timeoutlen=500

" Map leader to which_key
nnoremap <silent> <leader> :<C-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<C-u>WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map = {}

" Single mappings
let g:which_key_map['-'] = [ '<C-W>s'  , 'split below']
let g:which_key_map['v'] = [ '<C-W>v'  , 'split right']
let g:which_key_map['e'] = [ ':Fern .' , 'explorer open']

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" t is for terminal
let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ 'g' : [':FloatermNew --height=1.0 --width=0.9 lazygit' , 'git'],
      \ 't' : [':FloatermToggle'      , 'toggle'],
      \ }

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'b' : [':BlamerToggle'      , 'git blame toggle'],
      \ 'n' : [':GitGutterNextHunk' , 'git next hunk'],
      \ 'p' : [':GitGutterPrevHunk' , 'git previous hunk'],
      \ }

" Hide status line
augroup vimrc_vim_which_key
  autocmd!
  autocmd FileType which_key set laststatus=0 noshowmode noruler
augroup END

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
