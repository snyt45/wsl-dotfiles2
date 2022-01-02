#!/bin/sh
set -Ceu

# ホームディレクトリに設定ファイルのシンボリックリンク作成

# s: シンボリックリンク作成
# n: 
# f: 上書きする
# v: リンクの作成時にリンクの情報を表示する

###
# vim
###

# ~/.vim
mkdir -p ~/.vim
ln -snfv ~/.dotfiles/.vim/vimrc ~/.vim/

###
# bash
###

ln -snfv ~/.dotfiles/.bash_profile ~/
ln -snfv ~/.dotfiles/.bashrc_custom ~/

echo "Done."
