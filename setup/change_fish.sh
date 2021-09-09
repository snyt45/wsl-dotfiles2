#!/bin/sh
set -Ceu

# ログインシェルをfishに変更

readonly FISH_PATH=$(which fish)

if test "$FISH_PATH"; then
    # /etc/shellsにfishが存在しないとき
    if ! grep "$FISH_PATH" /etc/shells; then
        echo "/etc/shellsに$FISH_PATHを追加しました。"
        echo "$FISH_PATH" | sudo tee -a /etc/shells
    fi

    # ログインシェルがfish以外のとき
    if test "$SHELL" != "$FISH_PATH"; then
        chsh -s "$FISH_PATH"
        echo "ログインシェルをfishに変更しました。ターミナルを再起動してください。"
    fi
fi
