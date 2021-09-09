#!/bin/sh
# 設定ファイルを反映する際に~/.bashrcで$force_color_promptが未定義のためエラーが出てしまうためset -uはしない
set -Ce

# linuxbrewのインストール
# note: 依存関係のインストール
# note: linuxbrewのインストール
# note: パスを通す

# brewコマンドが存在しない場合
if test ! "$(which brew)"; then
    sudo apt-get install build-essential procps curl file git
    echo "依存関係をインストールしました。"

    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash --login
    echo "linuxbrewをインストールしました。"

    test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
    test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >> ~/.bash_profile
    test -r ~/.profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >> ~/.profile
    # 設定ファイルを反映
    test -r ~/.bash_profile && . ~/.bash_profile
    test -r ~/.profile && . ~/.profile

    if test "$(which brew)"; then
        echo "linuxbrewのパスを通しました。"
        echo "brew doctorを実行してlinuxbrewに問題がないことを確認してください。"
    else
        echo "linuxbrewのパスが通っていません。ターミナルを再起動してください。"
    fi
else
    echo "linuxbrewは既にインストール済みです。"
fi

echo "Done."
