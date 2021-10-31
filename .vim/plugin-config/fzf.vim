" Use fzf installed with linuxbrew
set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf

" ripgrep
" https://zoshigayan.net/ripgrep-and-fzf-with-vim/
if executable('rg')
  function! FZGrep(query, fullscreen)
    " --hidden 隠しファイルも隠しディレクトリも含める
    " --follow シンボリックリンクも含める
    " --glob   対象ファイルのファイルパターンを指定
    let command_fmt = 'rg --column --line-number --no-heading --hidden --follow --glob "!.git/*" --color=always --smart-case -- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
  endfunction

  " RGマンドを定義。同名コマンドが定義されていた場合上書きする
  " RGコマンドはFZGrep関数を呼び出す
  command! -nargs=* -bang RG call FZGrep(<q-args>, <bang>0)
endif
