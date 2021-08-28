#!/bin/sh
set -Ceu

readonly IMAGETAG="ubuntu-unminimize"
# reference: https://github.com/snyt45/ubuntu-unminimize
readonly DOCKERFILE_PATH="https://raw.githubusercontent.com/snyt45/ubuntu-unminimize/main/Dockerfile"
readonly USERNAME=$(whoami)
readonly PASSWORD="password"

has_command() {
    if test "$(which $1)"; then
        return 0
    else
        return 1
    fi
}

if ! has_command "docker"; then
    echo "dockerコマンドが存在しません"
    exit 1
fi

# Dockerイメージ作成
docker build -t $IMAGETAG \
             --build-arg USER=$USERNAME \
             --build-arg PASS=$PASSWORD \
             -file $DOCKERFILE_PATH


# コンテナをバックグラウンドで起動しっぱなしにする
docker run -dit $IMAGETAG

# コンテナIDを取得
dockerContainerID=$(docker container ls -a | grep -i $IMAGETAG | awk '{print $1}')

# tarファイルをエクスポート
docker export $dockerContainerID >| /mnt/c/temp/$IMAGETAG.tar

# この方法だとWSLにインポートしたときに正しくディレクトリが生成されずに0x8007010bエラーを吐くのでコメントアウト
# docker save $IMAGETAG >| /mnt/c/temp/$IMAGETAG.tar

echo "Done."
