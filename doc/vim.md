
## fzf.vim

- `Ctrl + r`
  - コマンド履歴検索(`:History:`)
- `Ctrl + p`
  - ファイル検索(`:GFiles` or `:Files`)
- `Ctrl + f`
  - ファイル全文検索(`:Rg`)
- `SPC + b`
  - バッファ検索(`:Buffers`)
- `SPC + l`
  - バッファ全文検索(`:BLines`)
- `SPC + h`
  - 最近開いたファイル検索(`:History`)

## vim-lsp

- `:LspInstallServer`
  - lspServerをインストール

## vim-plug

- `:PlugInstall`
  - プラグインをインストール
- `:PlugClean`
  - プラグインをアンインストール

## vim-terminal

- `:term ++close bash -l`
  - bashをログインシェルとして起動。ジョブモードを終了したときに自動的にターミナルを閉じる。
- `Ctrl + w + N`
  - Terminal-Normalモードに切り替え。
	- `i`や`A`を追すと通常のターミナルモードに戻る。

## WSLとWindowsとのクリップボード共有

```
augroup Yank
  au!
  autocmd TextYankPost * :call system('clip.exe', @")
augroup END
```
