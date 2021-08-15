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

## Ubuntu セットアップ
### 1. WSL上にUbuntuをインポートする

[手順](https://snyt45.com/posts/20210806/wsl2-multiple-linux-distribution/#%E6%96%B0%E3%81%97%E3%81%8Flinux%E3%83%87%E3%82%A3%E3%82%B9%E3%83%88%E3%83%AA%E3%83%93%E3%83%A5%E3%83%BC%E3%82%B7%E3%83%A7%E3%83%B3%E3%82%92%E3%82%A4%E3%83%B3%E3%83%9D%E3%83%BC%E3%83%88%E3%81%99%E3%82%8B%E6%96%B9%E6%B3%95%E3%82%92%E8%A6%9A%E3%81%88%E3%81%9F)

### 2. Ubuntuのユーザー作成、Windows Terminalの開始ディレクトリ設定、dockerコマンドを使えるようにする

[手順](https://snyt45.com/posts/20210806/wsl2-multiple-linux-distribution/#ubuntu%E3%81%AE%E3%83%A6%E3%83%BC%E3%82%B6%E3%83%BC%E4%BD%9C%E6%88%90windows-terminal%E3%81%AE%E9%96%8B%E5%A7%8B%E3%83%87%E3%82%A3%E3%83%AC%E3%82%AF%E3%83%88%E3%83%AA%E8%A8%AD%E5%AE%9Adocker%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89%E3%82%92%E4%BD%BF%E3%81%88%E3%82%8B%E3%81%AB%E3%81%99%E3%82%8B)

### 3. sudoコマンドインストール、追加したユーザーをsudoグループに追加

[手順](https://snyt45.com/posts/20210813/wsl2-import-linux-distro-sudo/)

### 4. Windows Terminalのタブ名とタブ色を変える

作業しているLinuxディストリビューションを間違えないようにWindows Terminalのタブ名とタブ色を変えます。

[手順](https://snyt45.com/posts/20210809/windows-terminal-change-color/)

## dotfiles セットアップ
```
git clone https://github.com/snyt45/wsl-dotfiles2.git ~/.dotfiles
cd ~/.dotfiles
```

## Ubuntu リセット

[手順](https://snyt45.com/posts/20210806/wsl2-multiple-linux-distribution/#%E3%82%A4%E3%83%B3%E3%83%9D%E3%83%BC%E3%83%88%E3%81%97%E3%81%9Flinux%E3%83%87%E3%82%A3%E3%82%B9%E3%83%88%E3%83%AA%E3%83%93%E3%83%A5%E3%83%BC%E3%82%B7%E3%83%A7%E3%83%B3%E3%81%AE%E7%99%BB%E9%8C%B2%E8%A7%A3%E9%99%A4)
