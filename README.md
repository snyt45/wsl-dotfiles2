# wsl-dotfiles2
snyt45のdotfilesです。

## Ubuntu(Microsoft Store)のセットアップ

### 前提条件

OS: Windows11

Microsoft Store経由でインストールしたUbuntu(20.04)のセットアップを行います。
※`wsl --install -d Ubuntu`してUbuntuがある状態を想定しています。

次のツール・ライブラリに依存します。

- Windows Terminal
- Docker Desktop
- Git Credential Manager
  - Gitの認証情報ヘルパー
- Nerd Font
	- starshipのアイコン表示に必要

### セットアップ

#### git cloneする

```
git clone https://github.com/snyt45/wsl-dotfiles2.git ~/.dotfile
```

#### Gitのセットアップ

```
sh ~/.dotfiles/setup/git.sh
```

#### 必要な依存関係のインストール

##### Volta

```
curl https://get.volta.sh | bash
```

##### Vim

最新バージョンのインストール

```
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
```

##### fzf

```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
# 全て「No」で進める
~/.fzf/install
```

##### ripgrep

```
sudo apt download ripgrep
sudo dpkg --force-overwrite -i ripgrep*.deb
```

##### bat

```
sudo apt download bat
sudo dpkg --force-overwrite -i bat*.deb

# PATHを通す
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
```

##### starship

```
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
```

##### Hugo

```
wget https://github.com/gohugoio/hugo/releases/download/v0.91.2/hugo_extended_0.91.2_Linux-64bit.deb
sudo apt install ./hugo_extended_0.91.2_Linux-64bit.deb
```

##### enhancd

```
sudo git clone https://github.com/b4b4r07/enhancd.git /usr/local/src/enhancd
```

#### シンボリックリンク配置

```
sh ~/.dotfiles/setup/symlinks.sh
```

#### Vimのセットアップ

vim-plugのセットアップ

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vi
:PlugInstall
```

### リセット
システム(`WIn + I`) > アプリ > アプリと機能 > Ubuntu > リセット
