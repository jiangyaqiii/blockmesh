# blockmesh

# 检查状态
curl -s https://raw.githubusercontent.com/jiangyaqiii/blockmesh/main/blockmesh_status.sh |bash

# 启动服务
export email

export password

wget -O blockmesh_start.sh https://raw.githubusercontent.com/jiangyaqiii/blockmesh/main/blockmesh_start.sh && chmod +x blockmesh_start.sh && ./blockmesh_start.sh

# 重启服务
export email

export password

wget -O blockmesh_restart.sh https://raw.githubusercontent.com/jiangyaqiii/blockmesh/main/blockmesh_restart.sh && chmod +x blockmesh_restart.sh && ./blockmesh_restart.sh 2>&1 | tee tmp.txt
