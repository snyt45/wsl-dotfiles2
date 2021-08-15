#!/bin/sh

#==============================
# メッセージ
#==============================

# カラーパレット
readonly GRAY="\033[1;38;5;243m"
readonly BLUE="\033[1;34m"
readonly GREEN="\033[1;32m"
readonly RED="\033[1;31m"
readonly PURPLE="\033[1;35m"
readonly YELLOW="\033[1;33m"
readonly NONE="\033[0m"

title() {
    echo "${PURPLE}$1${NONE}"
    echo "${GRAY}==============================${NONE}"
}

error() {
    echo -e "${RED}Error: ${NONE}$1"
    exit 1
}

warning() {
    echo -e "$YELLOW}Warning: ${NONE}$1"
}

info() {
    echo "${BLUE}Info: ${NONE}$1"
}

success() {
    echo "${GREEN}$1${NONE}"
}

#==============================
# セットアップ
#==============================

readonly DOTPATH=~/.dotfiles

# linuxbrewのインストール
setup_linuxbrew() {
    title "Setup linuxbrew"

    # brewコマンドが存在しない場合
    if test ! "$(which brew)"; then
        info "依存関係をインストール(Debian or Ubuntu)"
        sudo apt-get install build-essential procps curl file git

        info "linuxbrewをインストール"
        curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

        info "linuxbrewのパスを通す"
        test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
        test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
        test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
        echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
    # brewコマンドが存在する場合
    else
        info "linuxbrewは既にインストール済みです。"
    fi
}

# Gitのセットアップ
# dependency: setup_linuxbrew実行後
# note: 
setup_git() {
    title "Setup Git"

    defaultName=$(git config user.name)
    defaultEmail=$(git config user.email)

    read -rp "Name [$defaultName] " name
    read -rp "Email [$defaultEmail] " email

    # Gitでユーザー名とメールアドレスを設定する
    git config --global user.name "${name:-$defaultName}"
    git config --global user.email "${email:-$defaultEmail}"

    # Gitで認証情報ヘルパーにGit Credential Manager Coreを使う(Windowsにインストールが必要)
    # https://github.com/microsoft/Git-Credential-Manager-Core#windows
    homeDirName="snyt45"

    read -rp "homeDirName [$homeDirName] " homedirname
    
    gitCredentialManagerCoreExe="/mnt/c/Users/${homedirname}/AppData/Local/Programs/Git Credential Manager Core/git-credential-manager-core.exe"

    # WindowsにGit Credential Manager Coreがインストールされている場合
    if test -e "${gitCredentialManagerCoreExe}"; then
        git config --global credential.helper "${gitCredentialManagerCoreExe}"
    else
        info "WindowsにGit Credential Manager Coreをインストールして下さい。"
    fi
}

case "$1" in
    linuxbrew)
        setup_linuxbrew
        ;;
    git)
        setup_git
        ;;
    *)
        echo -e $"\nUsage: $(basename "$0") {linuxbrew|git}\n"
        exit 1
        ;;
esac

success "Done."
