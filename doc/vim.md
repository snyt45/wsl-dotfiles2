
## fzf.vim

- `SPC + r`
  - コマンド履歴検索(`:History:`)
- `SPC + p`
  - ファイル検索(`:GFiles`)
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

## any-jump.vim

- `SPC + j`
  - カーソルが置かれた定義元にジャンプするポップアップウィンドウを開く

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
- `gps`
    - Push(`:Git push`)
- `gpl`
    - Pull(`:Git pull`)

## gv.vim

- `gl`
  - コミットブラウザを開く(`:GV`)
- `gll`
  - カレントファイルのコミットブラウザを開く(`:GV!`)
- `q`
  - コミットブラウザを閉じる

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

## vim-table-mode
- `:TableModeToggle`
  - テーブルモードを切り替える(`SPC + tm`)

## vim-marktable
- `:MakeTable`
  - 選択した行をテーブル表記にする
- `:MakeTable!`
  - 選択した行の1行目をヘッダーにしてテーブル表記にする
- `:UnmakeTable`
  - テーブル表記を解除する

## vim-lsp

- `ld`
  - メソッドの定義箇所に移動(`:LspDefinition`)
- `ldd`
  - 詳細なエラー情報を別ウィンドウで表示(`:LspDocumentDiagnostics`)
- `lf`
  - ドキュメント整形(`:LspDocumentFormat`)
- `lh`
  - カーソル下のシンボルの情報をホバー表示(`:LspHover`)
- `lr`
  - カーソル下のシンボルのリネーム(`:LspRename`)
- `:LspInstallServer`
  - lspServerをインストール
- `:LspManageServers`
  - LSPの管理画面を開く。 `i`でインストール。`x`でアンインストール、`b`でブラウザで開く、`?`で補足情報を表示

## translate.vim

- 翻訳したい箇所を選択して`Translate`

## vim-rails

- `:A`
  - 対応するSpecファイルを開く
- `gf`
  - カーソル下の文字列から対応するファイルを開く

## bracey.vim

- `:Bracey`
  - サーバー起動。ブラウザでライブプレビュー画面が開く。
- `:BraceyReload`
  - サーバー再起動
- `:BraceyStop`
  - サーバー停止。不具合だと思うがプロセスは残りっぱなしになる。`pgrep node | xargs kill -9`でプロセスをキルする。

## vim-sonictemplate

- `:Template <Tab>`
  - 言語ごとにテンプレートが用意されている。`<Tab>`で切り替えてエンターでテンプレートが挿入される。

## vim-plug

- `:PlugInstall`
  - プラグインをインストール
- `:PlugClean`
  - プラグインをアンインストール

## vim-terminal

- `sh`(`:term ++close bash`)
  - bashを対話シェルとして起動。ジョブモードを終了したときに自動的にターミナルを閉じる。
- `C-t C-t`(`Ctrl + w + N`)
  - Terminal-Normalモードに切り替え。
	- `i`や`A`を追すと通常のターミナルモードに戻る。

## netrw

- `F1`
  - netrwのヘルプを開く
- `t`
  - ファイルをタブで開く
- `o`
  - ファイルを水平分割して開く
- `v`
  - ファイルを垂直分割して開く
- `P`
  - 前開いたウィンドウでファイルを開く
- `-`
  - 一つ上のディレクトリに移動
- `gn`
  - ツリーのトップを変更
- `:NetrwSettings`
  - netrwの設定を確認する
- `b:netrw_curdir`
  - netrwのブラウジングディレクトリを確認できる

## grep
- いわゆる外部grep(`ripgrep`があるときは`ripgrep`を使う)
- `:grep 検索文字 | cw`
  - `ripgrep`が使われるときはデフォルトで再帰検索されるのでディレクトリ指定しなくてよい
  - カレントディレクトリ以下の`検索文字`を検索し、ヒットした結果をQuickfixウィンドウで開く

## fold

- `zc`
  - 折り畳み(カーソル位置)
- `zo`
  - 展開(カーソル位置)
- `zR`
  - 展開(ファイル全体)

## tab

- `:tabnew`
  - タブの生成(`SPC + t`)
- `:tabnext`/`:tabprevious`
  - 次のタブへ移動(`gt`、`Ctrl + l`)/前のタブへ移動(`gT`、`Ctrl + h`)
- `:tabs`
  - タブ一覧の表示

## WSLとWindowsとのクリップボード共有

```
augroup Yank
  au!
  autocmd TextYankPost * :call system('clip.exe', @")
augroup END
```
