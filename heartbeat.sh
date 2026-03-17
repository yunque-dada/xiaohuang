#!/bin/bash
# 自动心跳脚本 - 每小时检查服务器状态

LOG_FILE="/tmp/heartbeat.log"
DATA_FILE="/workspace/admin-system/data.json"

while true; do
    HOUR=$(date +%H)
    
    # 只在08:00-23:00执行
    if [ "$HOUR" -ge 8 ] && [ "$HOUR" -lt 23 ]; then
        TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
        
        # 检查端口
        PORT_3000=$(ss -tln | grep ":3000 " | wc -l)
        PORT_8608=$(ss -tln | grep ":8608 " | wc -l)
        
        if [ "$PORT_3000" -eq 0 ] || [ "$PORT_8608" -eq 0 ]; then
            echo "[$TIMESTAMP] WARNING: Port down - 3000:$PORT_3000 8608:$PORT_8608" >> $LOG_FILE
        else
            echo "[$TIMESTAMP] OK: 3000:$PORT_3000 8608:$PORT_8608" >> $LOG_FILE
        fi
    fi
    
    # 每小时执行一次
    sleep 3600
done
