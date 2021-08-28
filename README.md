# wsl-dotfiles2
snyt45のdotfilesです。

## 前提条件

このリポジトリはWSL2上のUbuntuで実行され、以下に依存します。

[こちら](https://snyt45.com/posts/20210806/wsl2-multiple-linux-distribution/)の記事をもとにWindows10+WSL2+Dockerの環境を用意します。

- Windows10 Home(Pro)
- WSL2
- Docker Desktop
- Windows Terminal
- Ubuntu 20.04(Microsoft Store経由)
- FiraCode(フォント) ※任意
  - [インストール手順](https://github.com/snyt45/windows10-dotfiles/blob/master/setup/manually_settings.txt#L100)
  - [Windows Terminalでフォント指定](https://github.com/snyt45/windows10-dotfiles/blob/master/setup/manually_settings.txt#L183)
- Git Credential Manager Core(Gitの認証情報ヘルパーとして使う) ※任意
  - [インストール手順](https://github.com/microsoft/Git-Credential-Manager-Core#windows)

## セットアップ
###  1. WSLにUbuntuをインポート

#### 1-1. WSLで作業します。セットアップ用のリポジトリをクローンします。
```
git clone https://github.com/snyt45/wsl-dotfiles2.git ~/.dotfiles
```

#### 1-2. tarファイルをエクスポートします。

`C:\temp\`に`ubuntu-unminimize.tar`という名前のtarファイルがエクスポートされます。

[UbuntuのDockerfileはこちら](https://github.com/snyt45/ubuntu-unminimize)
```
cd ~/.dotfiles
sh export_tar.sh
```

#### 1-3. PowerShellを開き、tarファイルをWSLにインポートします。

`{distro}`は、ディストリビューションの任意の名前を指定します。

`{username}`は、ユーザー名を指定します。

インポートすると`C:\Users\{username}\AppData\Local\Packages\{distro}`に`実体(ext4.vhdx)`が作成されます。

```
cd C:\temp
wsl --import {distro} C:\Users\{username}\AppData\Local\Packages\{distro} C:\temp\ubuntu-unminimize.tar
```

### Docker セットアップ

dockerコマンドを使えるようにするため、Dockerの設定 > WSLインテグレーションにて追加したLinuxディストリビューションを有効にする。

### Windows Terminal セットアップ

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

### dotfiles セットアップ
```
git clone https://github.com/snyt45/wsl-dotfiles2.git ~/.dotfiles
cd ~/.dotfiles

. setup.sh linuxbrew
. setup.sh git
```

## リセット
### WSL登録解除

```
wsl --unregister <DistributionName>
```
