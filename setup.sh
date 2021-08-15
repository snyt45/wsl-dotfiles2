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
    echo "${RED}Error: ${NONE}$1"
    exit 1
}

warning() {
    echo "${YELLOW}Warning: ${NONE}$1"
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
        sudo apt-get install build-essential procps curl file git
        success "依存関係をインストール(Debian or Ubuntu)しました。"

        curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash --login
        success "linuxbrewをインストールしました。"

        test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
        test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
        test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
        echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
        # 設定ファイルを反映
        test -r ~/.bash_profile && . ~/.bash_profile
        test -r ~/.profile && . ~/.profile
        success "linuxbrewのパスを通しました。"
        warning "brew doctorを実行してlinuxbrewに問題がないことを確認してください。"
    else
        info "linuxbrewは既にインストール済みです。"
    fi
}

# Gitのセットアップ
# note: setup_linuxbrew実行後
setup_git() {
    title "Setup Git"

    defaultName=$(git config user.name)
    defaultEmail=$(git config user.email)

    info "Gitでユーザー名とメールアドレスを設定します。"
    read -rp "Name [$defaultName] " name
    read -rp "Email [$defaultEmail] " email

    git config --global user.name "${name:-$defaultName}"
    git config --global user.email "${email:-$defaultEmail}"
    success "Gitでユーザー名とメールアドレスを設定しました。"

    homeDirName="snyt45"

    info "Gitで認証情報ヘルパーを設定します。"
    read -rp "homeDirName [$homeDirName] " homedirname
    
    # ディレクトリチェック用
    gitCredentialManagerCoreExe="/mnt/c/Users/${homedirname}/AppData/Local/Programs/Git Credential Manager Core/git-credential-manager-core.exe"
    # Git設定用
    gitCredentialManagerCoreExeConfig="/mnt/c/Users/${homedirname}/AppData/Local/Programs/Git\\ Credential\\ Manager\\ Core/git-credential-manager-core.exe"

    # git-credential-manager-core.exeが存在する場合
    if test -e "${gitCredentialManagerCoreExe}"; then
        git config --global credential.helper "${gitCredentialManagerCoreExeConfig}"
        success "Gitで認証情報ヘルパーを設定しました。"
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
