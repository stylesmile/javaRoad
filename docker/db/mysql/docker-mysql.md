### docker 安装 mysql
```
docker run --privileged -d -p 3304:3306 \
--name mysql --restart=always -e TZ=Asia/Shanghai \
-e MYSQL_ROOT_PASSWORD=root -v /mnt/mysql:/var/lib/mysql mysql:8 \
--character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci \
--character-set-client-handshake=FALSE
```
```
sudo docker run --privileged -d -p 3304:3306 \
--name mysql8 --restart=always -e TZ=Asia/Shanghai \
-e MYSQL_ROOT_PASSWORD=db123456 \
mysql:8.0 \
--character-set-server=utf8mb4 \
--collation-server=utf8mb4_unicode_ci \
--character-set-client-handshake=FALSE
```

该 docker run 命令的具体功能如下：
启动容器：
docker run：启动一个新的 Docker 容器。
特权模式：
--privileged：以特权模式运行容器，增加容器内的权限，允许访问更多的底层系统资源。
后台运行：
-d：以后台方式运行容器。
端口映射：
-p 3309:3306：将宿主机的 3309 端口映射到容器内部的 3306 端口。
容器命名：
--name mysql：给容器命名为 mysql。
自动重启策略：
--restart=always：当宿主机重启时，自动重启容器。
环境变量设置：
-e TZ=Asia/Shanghai：设置容器内部的时区为上海时区。
-e MYSQL_ROOT_PASSWORD=root：设置 MySQL root 用户的密码为 root。
数据卷挂载：
-v /mnt/mysql:/var/lib/mysql：将宿主机的 /mnt/mysql 目录挂载到容器内的 /var/lib/mysql 目录，用于数据持久化。
指定镜像版本：
mysql:8：使用 MySQL 8 版本的镜像。
额外参数配置：
--character-set-server=utf8mb4：设置服务器字符集为 utf8mb4。
--collation-server=utf8mb4_unicode_ci：设置服务器排序规则为 utf8mb4_unicode_ci。
--character-set-client-handshake=FALSE：关闭客户端握手时的字符集协商。