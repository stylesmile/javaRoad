#!/bin/bash

# ===== 配置区 =====
APP_NAME="jl-platform-server"
JAR_NAME="distribution-platform.jar"
JAVA_OPTS="-Xms512m -Xmx512m"
LOG_FILE="nohup.out"
PID_FILE="${APP_NAME}.pid"
WAIT_TIME=30  # 优雅停机等待时间（秒）

# 获取当前进程 PID 的函数
get_pid() {
    if [ -f "$PID_FILE" ]; then
        PID=$(cat "$PID_FILE")
        if ps -p "$PID" > /dev/null 2>&1; then
            echo $PID
        else
            # PID 文件存在但进程已死，清理文件
            rm -f "$PID_FILE"
            echo ""
        fi
    else
        echo ""
    fi
}

# 启动函数
start() {
    PID=$(get_pid)
    if [ -n "$PID" ]; then
        echo "[$APP_NAME] 已经在运行中，PID: $PID"
        return 1
    fi

    echo "正在启动 [$APP_NAME]..."
    nohup /root/jl/jdk8u362-b09-jre/bin/java $JAVA_OPTS -jar $JAR_NAME > $LOG_FILE 2>&1 &
    NEW_PID=$!
    echo $NEW_PID > "$PID_FILE"

    sleep 2
    if ps -p "$NEW_PID" > /dev/null 2>&1; then
        echo "[$APP_NAME] 启动成功，PID: $NEW_PID"
    else
        echo "[$APP_NAME] 启动失败，请检查日志: $LOG_FILE"
        rm -f "$PID_FILE"
        return 1
    fi
}

# 停止函数
stop() {
    PID=$(get_pid)
    if [ -z "$PID" ]; then
        echo "[$APP_NAME] 未在运行中。"
        return 0
    fi

    echo "正在停止 [$APP_NAME] (PID: $PID)..."
    kill -15 "$PID"

    COUNT=0
    while [ $COUNT -lt $WAIT_TIME ]; do
        if ! ps -p "$PID" > /dev/null 2>&1; then
            echo "[$APP_NAME] 已优雅停止。"
            rm -f "$PID_FILE"
            return 0
        fi
        sleep 1
        COUNT=$((COUNT + 1))
    done

    echo "[$APP_NAME] 未在 ${WAIT_TIME}s 内停止，执行强制杀死..."
    kill -9 "$PID"
    rm -f "$PID_FILE"
    echo "[$APP_NAME] 已被强制停止。"
}

# 重启函数
restart() {
    stop
    sleep 2
    start
}

# 状态查询
status() {
    PID=$(get_pid)
    if [ -n "$PID" ]; then
        echo "[$APP_NAME] 正在运行，PID: $PID"
    else
        echo "[$APP_NAME] 未在运行。"
    fi
}

# ===== 主逻辑入口 =====
case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        restart
        ;;
    status)
        status
        ;;
    *)
        echo "用法: $0 {start|stop|restart|status}"
        exit 1
        ;;
esac
exit 0
