#!/bin/sh
set -Ceu

# Gitのセットアップ
# note: ユーザー名とメールアドレスの設定
# note: 認証情報ヘルパーを設定

readonly DEFAULT_NAME=$(git config user.name)
readonly DEFAULT_EMAIL=$(git config user.email)
readonly DEFAULT_DIFF_TOOL="vimdiff"

echo "Gitでユーザー名とメールアドレスを設定します。"
read -rp "Name [$DEFAULT_NAME] " name
read -rp "Email [$DEFAULT_EMAIL] " email

git config --global user.name "${name:=$DEFAULT_NAME}"
git config --global user.email "${email:=$DEFAULT_EMAIL}"
echo "Gitでユーザー名とメールアドレスを設定しました。"

echo "Gitで認証情報ヘルパーを設定します。"

credential_manager="/mnt/c/Program Files/Git/mingw64/libexec/git-core/git-credential-manager-core.exe"
credential_manager_git="/mnt/c/Program\\ Files/Git/mingw64/libexec/git-core/git-credential-manager-core.exe"

if test -e "${credential_manager}"; then
    git config --global credential.helper "${credential_manager_git}"
    # リポジトリ毎に認証を求めらるようになるため、結果リポジトリ毎に対応したアカウントで認証できるようになる。
    # reference: https://github.com/Microsoft/Git-Credential-Manager-for-Windows/blob/master/Docs/Configuration.md#usehttppath
    git config --global credential.useHttpPath true
    echo "Gitで認証情報ヘルパーを設定しました。"
else
    echo "WindowsにGit Credential Manager Coreをインストールして下さい。 https://github.com/microsoft/Git-Credential-Manager-Core"
fi

echo "Done."
