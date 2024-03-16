简易版本

解释
docker run -p 9000:9000 -p 9001:9001 \
--net=host \
--name minio \
-d --restart=always \
-e "MINIO_ACCESS_KEY=minioadmin" \
-e "MINIO_SECRET_KEY=minioadmin" \
minio/minio:RELEASE.2024-02-26T09-33-48Z server \
/data --console-address ":9001" -address ":9000"

挂载硬盘

解释
docker run -d  -p 9000:9000 -p 9001:9001 \
--name minio1  \
-d --restart=always \
-v /data/minio/data:/data \
-v /data/minio/config:/root/.minio \
-e "MINIO_ROOT_USER=minioadmin" \
-e "MINIO_ROOT_PASSWORD=minioadmin" \
minio/minio:RELEASE.2024-02-26T09-33-48Z  server /data --console-address ":9001"

命令详解
-e MINIO_ROOT_USER 指定用户名
-e MINIO_ROOT_PASSWORD 指定密码
-v 挂载目录,持久化minio目录 /data/minio/data 本机目录
新版minio有两个端口注意 9000给客户端使用,9001登录服务端使用
开放端口浏览器进行访问：http://ip:9000 （账号 密码：minio admin）