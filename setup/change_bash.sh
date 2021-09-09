#!/bin/sh
set -Ceu

# ログインシェルをbashに変更

readonly BASH_PATH=$(which bash)

# ログインシェルがbash以外のとき
if test "$SHELL" != "$BASH_PATH"; then
    chsh -s $BASH_PATH
    echo "ログインシェルをbashに変更しました。ターミナルを再起動してください。"
fi
