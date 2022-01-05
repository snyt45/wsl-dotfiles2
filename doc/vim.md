
## fzf.vim

- `SPC + p`
  - ファイル検索(`:GFiles`)
- `SPC + P`
  - git statusのファイル検索(`:GFiles?`)
- `SPC + f`
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

## WSLとWindowsとのクリップボード共有

```
augroup Yank
  au!
  autocmd TextYankPost * :call system('clip.exe', @")
augroup END
```
