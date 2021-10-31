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
ln -snfv ~/.dotfiles/.vim/vim-plug.vim ~/.vim/
ln -snfv ~/.dotfiles/.vim/vimrc ~/.vim/

# ~/.vim/plugin-config
mkdir -p ~/.vim/plugin-config
ln -snfv ~/.dotfiles/.vim/plugin-config/blammer.vim ~/.vim/plugin-config/
ln -snfv ~/.dotfiles/.vim/plugin-config/fern-preview.vim ~/.vim/plugin-config/
ln -snfv ~/.dotfiles/.vim/plugin-config/fern.vim ~/.vim/plugin-config/
ln -snfv ~/.dotfiles/.vim/plugin-config/fzf.vim ~/.vim/plugin-config/
ln -snfv ~/.dotfiles/.vim/plugin-config/vim-floaterm.vim ~/.vim/plugin-config/
ln -snfv ~/.dotfiles/.vim/plugin-config/vim-gitgutter.vim ~/.vim/plugin-config/
ln -snfv ~/.dotfiles/.vim/plugin-config/vim-which-key.vim ~/.vim/plugin-config/
ln -snfv ~/.dotfiles/.vim/plugin-config/vimdoc-ja.vim ~/.vim/plugin-config/

###
# fish
###

# ~/.config/fish
mkdir -p ~/.config/fish
ln -snfv ~/.dotfiles/.config/fish/config.fish ~/.config/fish/
ln -snfv ~/.dotfiles/.config/fish/fish_plugins ~/.config/fish/

# ~/.config/fish/conf.d
mkdir -p ~/.config/fish/conf.d
ln -snfv ~/.dotfiles/.config/fish/conf.d/env.fish ~/.config/fish/conf.d
ln -snfv ~/.dotfiles/.config/fish/conf.d/linuxbrew.fish ~/.config/fish/conf.d
ln -snfv ~/.dotfiles/.config/fish/conf.d/starship.fish ~/.config/fish/conf.d

echo "Done."
