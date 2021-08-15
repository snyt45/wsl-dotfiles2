# wsl-dotfiles2
## 概要
WSL2のLinuxディストリビューション(Ubuntu 20.04)上に私の最適な開発環境を構築するためのdotfilesです。

## インストールの前提条件

[こちら](https://snyt45.com/posts/20210806/wsl2-multiple-linux-distribution/)の記事をもとにWindows10+WSL2+Dockerの環境を用意しておく必要があります。

- Windows10 Home(Pro)
- WSL2
- Docker Desktop
- Windows Terminal
- Ubuntu 20.04(Microsoft Store経由)
- FiraCode(フォント)
  - [インストール手順](https://github.com/snyt45/windows10-dotfiles/blob/master/setup/manually_settings.txt#L100)
  - [Windows Terminalでフォント指定](https://github.com/snyt45/windows10-dotfiles/blob/master/setup/manually_settings.txt#L183)
- Git Credential Manager Core(Gitの認証情報ヘルパーとして使う)
  - [インストール手順](https://github.com/microsoft/Git-Credential-Manager-Core#windows)

## WSLにUbuntuをインポートする

### 1. Linuxディストリビューションのtarファイルをコンテナから取得する
WSLにインポートするためのLinuxディストリビューションのtarファイルを用意する必要があります。

既にtarファイルがある場合は、「2. 取得したtarファイルをWSLにインポートする」から進めて下さい。

[手順](https://snyt45.com/posts/20210806/wsl2-multiple-linux-distribution/#1-linux%E3%83%87%E3%82%A3%E3%82%B9%E3%83%88%E3%83%AA%E3%83%93%E3%83%A5%E3%83%BC%E3%82%B7%E3%83%A7%E3%83%B3%E3%81%AEtar%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%82%92%E3%82%B3%E3%83%B3%E3%83%86%E3%83%8A%E3%81%8B%E3%82%89%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B)

### 2. 取得したtarファイルをWSLにインポートする
tarファイルをインポートします。

```
wsl --import <DistroName> C:\Users\<HomeDirName>\AppData\Local\Packages\<DistroName> C:\temp\ubuntu.tar
```

[手順](https://snyt45.com/posts/20210806/wsl2-multiple-linux-distribution/#2-%E5%8F%96%E5%BE%97%E3%81%97%E3%81%9Ftar%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%82%92wsl%E3%81%AB%E3%82%A4%E3%83%B3%E3%83%9D%E3%83%BC%E3%83%88%E3%81%99%E3%82%8B)

## Ubuntu セットアップ

### 1. アップデート

この後、vimとsudoコマンドとgitが必要になるためインストールしています。

```
apt update
apt upgrade
apt install vim
apt install sudo
apt install git
```

### 2. ユーザーを作成

```
adduser <UserName>
```

### 3. 追加したユーザーをsudoグループに追加

```
usermod -G sudo <UserName>
```

### 4. ログイン時のデフォルトユーザーを設定

**設定を反映するには、一度wslを再起動(wsl -t <DistroName>)する必要があります。**

```
vi /etc/wsl.conf

# 下記を追加
[user]
default=<UserName>
```

### 5. ミニマム化されたUbuntuを標準のUbuntuに戻す

```
sudo unminimize
```

## Docker セットアップ

### 1. Dockerの設定からWSLインテグレーションを有効にする。

dockerコマンドを使えるようにします。

## Windows Terminal セットアップ

### 1. Windows Terminalの設定を行います。

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

## dotfiles セットアップ
```
git clone https://github.com/snyt45/wsl-dotfiles2.git ~/.dotfiles
cd ~/.dotfiles
  
sh install.sh linuxbrew
sh install.sh git
```

## Ubuntu リセット
  
```
wsl --unregister <DistributionName>
```

[手順](https://snyt45.com/posts/20210806/wsl2-multiple-linux-distribution/#%E3%82%A4%E3%83%B3%E3%83%9D%E3%83%BC%E3%83%88%E3%81%97%E3%81%9Flinux%E3%83%87%E3%82%A3%E3%82%B9%E3%83%88%E3%83%AA%E3%83%93%E3%83%A5%E3%83%BC%E3%82%B7%E3%83%A7%E3%83%B3%E3%81%AE%E7%99%BB%E9%8C%B2%E8%A7%A3%E9%99%A4)
