#!/bin/bash

if [[ $(docker ps -qf name=blockmesh-cli-container) ]]; then
    echo "blockmesh正在运行"
else
    echo "停止"
fi
