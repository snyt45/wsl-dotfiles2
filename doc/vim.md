
## fzf.vim

- `SPC + r`
  - コマンド履歴検索(`:History:`)
- `SPC + p`
  - ファイル検索(`:GFiles` or `:Files`)
- `SPC + g`
  - git statusされているファイル検索(`:GFiles?`)
- `SPC + f`
  - ファイル全文検索(`:Rg`)
- `SPC + b`
  - バッファ検索(`:Buffers`)
- `SPC + l`
  - バッファ全文検索(`:BLines`)
- `SPC + h`
  - 最近開いたファイル検索(`:History`)
- `Ctrl + /`
  - プレビュー時、プレビューウィンドウ表示/非表示

## fugitive.vim

- `gs`
    - git status画面でadd、diffなどの操作を行う(`:Git`)
    - よく使う
        - `=`
            - カーソル下のファイルをdiff(トグル)
        - `s`
            - カーソル下のファイルをステージ
        - `u`
            - カーソル下のファイルをアンステージ
        - `U`
            - 全てのファイルをアンステージ
        - `ga`
            - 全てのファイルをステージ
        - `X`
            - カーソル下の変更を破棄
- `ga`
    - 全てのファイルをステージ(`:Git add -A`)
- `gc`
    - コメント付きコミット(`:Git commit`)
- `gb`
    - blame(`:Git blame`)
- `gd`
    - 一時バッファでdiff表示(`:Git diff`)
- `gl`
    - 一時バッファでlog表示(`:Git log`)
- `gps`
    - Push(`:Git push`)
- `gpl`
    - Pull(`:Git pull`)

## vim-gitgutter
- `]c`
    - 次のハンクにジャンプ
- `[c`
    - 前のハンクにジャンプ
- `SPC + hs`
    - ハンクをステージ
- `SPC + hu`
    - ハンクをアンステージ
- `SPC + hp`
    - ハンクをプレビュー

## markdown-preview.nvim

- `:MarkdownPreview`
  - ブラウザでマークダウンのプレビュー表示

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

## netrw

- カレントディレクトリ配下のファイルを検索
  - `g:netrw_keepdir=0`に依存
	- ディレクトリを開いた状態にするとVim上でカレントディレクトリになる
	- カレントディレクトリが変わった状態で`:Rg`、`:Files`を呼び出すことでカレントディレクトリ配下を対象に検索できる

## WSLとWindowsとのクリップボード共有

```
augroup Yank
  au!
  autocmd TextYankPost * :call system('clip.exe', @")
augroup END
```
