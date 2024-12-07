docker stop blockmesh-cli-container
docker rm blockmesh-cli-container
# 创建并运行 Docker 容器
docker run -d --rm \
    --name blockmesh-cli-container \
    -v $(pwd)/target/release:/app \
    -e EMAIL="$email" \
    -e PASSWORD="$password" \
    --workdir /app \
    ubuntu:22.04 ./blockmesh-cli --email "$email" --password "$password"
