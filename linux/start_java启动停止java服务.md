使用说明
保存与赋权：
将上述代码保存为 start_java.sh（与 app.jar 放在同一目录下），并赋予执行权限：
bash

编辑



chmod +x start_java.sh
常用操作命令：
bash

编辑



./start_java.sh start     # 启动服务
./start_java.sh stop      # 停止服务
./start_java.sh restart   # 重启服务
./start_java.sh status    # 查看服务状态
核心机制说明：
精准控制：通过读取 PID_FILE 记录进程号，避免了使用 ps -ef | grep 可能导致的误杀其他同名 Java 进程的问题。
优雅停机：停止时优先发送 kill -15 (SIGTERM) 信号，给 Spring Boot 等应用预留 30 秒时间处理完当前请求并释放资源；超时未退出才会使用 kill -9 (SIGKILL) 强制终止。