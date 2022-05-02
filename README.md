# wsl-dotfiles2
snyt45のdotfilesです。

## Ubuntu(Microsoft Store)のセットアップ

### 前提条件

OS: Windows11

Microsoft Store経由でインストールしたUbuntu(22.04)のセットアップを行います。

次のツール・ライブラリに依存します。

- Windows Terminal
- Docker Desktop
- Git Credential Manager ※最新のGit Bashに付属している
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

Node.jsはvim-lspの依存関係として必要。

```
curl https://get.volta.sh | bash
volta install node@14
```

##### fzf

```
sudo apt install fzf
```

##### ripgrep

```
sudo apt install ripgrep
```

##### bat

```
sudo apt install bat

# batで呼び出せるように設定
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
```

##### starship

```
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
```

##### zoxide

```
sudo apt install zoxide
```

#### rbenv

```
sudo apt install rbenv

# install ruby-build
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

# doctor check
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-doctor | bash

# install ruby
rbenv install 3.1.0
rbenv global 3.1.0
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

Microsoft Store経由でインストールしたUbuntu(22.04)のセットアップが完了している状態を想定しています。

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

### 追加したLinux ディストリビューションのセットアップ

一律下記を実行する。
`sudo apt install bash-completion`は必ず行うこと。

- `sudo apt install bash-completion`
  - bashではTAB または ESC連打で補完機能が働くが、何もない状態でも補完機能が働いてしまいフリーズする。
bash-completionを入れると、何も入力されていないときは補完機能が働かないようになってくれる。
- `sudo apt update && sudo apt upgrade`
- `sudo apt install git`
- `sudo apt install curl`
- `sudo apt-get install wget`
  - `code .`の依存関係
- `sudo apt install vim`


上記が終わったら、`Ubuntu(Microsoft Store)のセットアップ`と同じやり方でセットアップする。
※`rbenv`は除く

### 追加したLinux ディストリビューションを登録解除

```
wsl --unregister <DistroName>
```
