if [[ $(docker ps -qf name=blockmesh-cli-container) ]]; then
    echo '停止正在运行中的blockmesh容器'
    docker stop blockmesh-cli-container
    docker rm blockmesh-cli-container
else
    echo '无正在运行中的blockmesh容器'
fi

# 创建并运行 Docker 容器
docker run -d --rm \
    --name blockmesh-cli-container \
    -v $(pwd)/target/release:/app \
    -e EMAIL="$email" \
    -e PASSWORD="$password" \
    --workdir /app \
    ubuntu:22.04 ./blockmesh-cli --email "$email" --password "$password"

rm -f blockmesh_restart.sh
