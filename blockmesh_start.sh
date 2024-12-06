#!/bin/bash

# 脚本保存路径
SCRIPT_PATH="$HOME/BlockMesh.sh"

# 检查是否以 root 用户运行脚本
if [ "$(id -u)" != "0" ]; then
    echo "此脚本需要以 root 用户权限运行。"
    echo "请尝试使用 'sudo -i' 命令切换到 root 用户，然后再次运行此脚本。"
    exit 1
fi

curl -s https://raw.githubusercontent.com/jiangyaqiii/envirment/main/docker.sh |bash

# 创建目标目录
mkdir -p target/release

curl -L https://github.com/sdohuajia/Blockmesh/raw/refs/heads/main/target/release/blockmesh-cli -o target/release/blockmesh-cli

# 设置执行权限
chmod +x target/release/blockmesh-cli

# # 输入账号信息
# read -p "请输入您的 BlockMesh 邮箱账号: " email
# read -s -p "请输入您的 BlockMesh 密码: " password
# echo
echo "$email"
echo ''
echo "$password"

# 创建并运行 Docker 容器
docker run -d --rm \
    --name blockmesh-cli-container \
    -v $(pwd)/target/release:/app \
    -e EMAIL="$email" \
    -e PASSWORD="$password" \
    --workdir /app \
    ubuntu:22.04 ./blockmesh-cli --email "$email" --password "$password"

rm -f blockmesh_start.sh
