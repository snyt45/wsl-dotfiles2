# wsl-dotfiles2
snyt45のdotfilesです。

## 前提条件

このリポジトリはWSL2上のUbuntuで実行され、以下に依存します。

[こちら](https://snyt45.com/posts/20210806/wsl2-multiple-linux-distribution/)の記事をもとにWindows10+WSL2+Dockerの環境を用意します。

- Windows10 Home(or Pro)
  - Docker Desktop
  - Windows Terminal
  - FiraCode(フォント) ※任意
    - [インストール手順](https://github.com/snyt45/windows10-dotfiles/blob/master/setup/manually_settings.txt#L100)
    - [Windows Terminalでフォント指定](https://github.com/snyt45/windows10-dotfiles/blob/master/setup/manually_settings.txt#L183)
  - Git Credential Manager Core(Gitの認証情報ヘルパーとして使う) ※任意
    - [インストール手順](https://github.com/microsoft/Git-Credential-Manager-Core#windows)
  - WSL2
    - Ubuntu 20.04(Microsoft Store経由)

## セットアップ
###  1. WSLにUbuntuをインポート

#### 1-1. WSLで作業します。tarファイルをエクスポートします。

`C:\temp\`に`ubuntu-unminimize.tar`という名前のtarファイルがエクスポートされます。

[ベースになるUbuntuのDockerfileはこちら](https://github.com/snyt45/ubuntu-unminimize)
```
# tempフォルダを作成
cd /mnt/c
mkdir temp

# curlコマンドが必要
curl https://raw.githubusercontent.com/snyt45/wsl-dotfiles2/main/export_tar.sh | sh
```

#### 1-2. PowerShellを開き、tarファイルをWSLにインポートします。

```
$script = (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/snyt45/wsl-dotfiles2/main/import_tar.ps1')

# -DistroName: ディストリビューション名(必須)
# -InstallLocation: インストール先(必須)
# -InstallTarFile: インポートするtarファイルの場所(必須)
Invoke-Expression("&{$script} -DistroName 'dev' -InstallLocation 'C:\Users\snyt45\AppData\Local\Packages\dev' -InstallTarFile 'C:\temp\ubuntu-unminimize.tar'")
```

### 2. Docker セットアップ

dockerコマンドを使えるようにするため、Dockerの設定 > WSLインテグレーションにて追加したLinuxディストリビューションを有効にする。

### 3. Windows Terminal セットアップ

```
{
    "background": "#300030",  // 背景色を変更
    "bellStyle": "none",  // ベル通知OFF
    "fontFace": "Fira Code", // フォントをFira Code指定
    "fontSize": 11, // フォントサイズ変更
    "guid": "{7dd682f4-0485-5308-9489-8941b3c7641c}",
    "hidden": false,
    "name": "<DistroName>",
    "source": "Windows.Terminal.Wsl",
    "startingDirectory": "//wsl$/<DistroName>/home/<HomeDirName>", // 開始ディレクトリをLinuxのホームディレクトリに指定
    "suppressApplicationTitle": true, // タブ名を反映させるために必要
    "tabColor": "#300030",  // タブ色変更
    "tabTitle": "dev"  // タブ名変更
}
```

### 4. dotfiles セットアップ
```
git clone https://github.com/snyt45/wsl-dotfiles2.git ~/.dotfiles
cd ~/.dotfiles

# linuxbrewのインストール ※カレントシェルで実行
. setup/linuxbrew.sh

# gitのセットアップ
sh setup/git.sh

# dev toolのインストール
xargs brew install < my_formula.txt

# シンボリックリンク配置
sh setup/symlinks.sh

# Vimのセットアップ
# https://github.com/junegunn/vim-plug#vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vi
:PlugInstall

# fishのセットアップ
sh setup/change_fish.sh
# fisher
# https://github.com/jorgebucaran/fisher#installation
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
```

シェルの切り替え
```
# ログインシェルをfishに変更
sh setup/change_fish.sh

# ログインシェルをbashに変更
sh setup/change_bash.sh
```

## リセット
### WSL登録解除

```
wsl --unregister <DistroName>
```

## brew

```
# 書き出し
brew leaves > my_formula.txt
# インストール
xargs brew install < my_formula.txt
```
