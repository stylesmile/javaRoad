简易版本

```
docker run -d --name minio-server -p 9000:9000 -p 9001:9001 -e MINIO_ROOT_USER=minioadmin -e MINIO_ROOT_PASSWORD=minioadmin! --restart unless-stopped minio/minio server /data --console-address ":9001"
docker run -d --name minio-server -p 9000:9000 -p 9001:9001 -e MINIO_ROOT_USER=minioadmin -e MINIO_ROOT_PASSWORD=minioadmin! -v minio-data:/data --restart unless-stopped minio/minio server /data --console-address ":9001"
```
命令详解
-e MINIO_ROOT_USER 指定用户名
-e MINIO_ROOT_PASSWORD 指定密码
-v 挂载目录,持久化minio目录 /data/minio/data 本机目录
新版minio有两个端口注意 9000给客户端使用,9001登录服务端使用
开放端口浏览器进行访问：http://ip:9000 （账号 密码：minio admin）