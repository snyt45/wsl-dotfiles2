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
git clone https://github.com/snyt45/wsl-dotfiles2.git ~/.dotfiles
```

#### Gitのセットアップ

```
sh ~/.dotfiles/setup/git.sh
```

#### 必要な依存関係のインストール

##### Volta、Node.js

```
curl https://get.volta.sh | bash
volta install node@14
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

`sudo dpkg --force-overwrite -i bat*.deb`実行時にUbuntu20.04の問題でripgrepとbatのファイルがコンフリクトする。

`sudo apt --fix-broken install`すると解消する。

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

## WSLにLinux ディストリビューションを追加する

### 前提条件

OS: Windows11

Microsoft Store経由でインストールしたUbuntu(20.04)のセットアップが完了している状態を想定しています。

### 追加手順

1. tarファイルをexport(WSL)

```
# tempフォルダを作成
mkdir -p /mnt/c/temp

# C:\temp\にubuntu-unminimize.tarという名前のtarファイルをエクスポートする
sh ~/.dotfiles/distribution/export_tar.sh
```

2. WSLにUbuntuを追加(Windows PowerShell)

`[DistroName]`は適宜修正してください。

```
$script = (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/snyt45/wsl-dotfiles2/main/distribution/import_tar.ps1')

Invoke-Expression("&{$script} -DistroName '[DistroName]' -InstallLocation 'C:\Users\snyt45\AppData\Local\Packages\[DistroName]' -InstallTarFile 'C:\temp\ubuntu-unminimize.tar'")
```

### セットアップ

`sudo apt install bash-completion`は必ず行うこと。
bashではTAB または ESC連打で補完機能が働くが、何もない状態でも補完機能が働いてしまいフリーズする。
bash-completionを入れると、何も入力されていないときは補完機能が働かないようになってくれる。

上記以外は、適宜Ubuntu上でセットアップを行う。

### 追加したLinux ディストリビューションを登録解除

```
wsl --unregister <DistroName>
```
