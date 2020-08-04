方法1
1、获得容器IP

将container_name 换成实际环境中的容器名
docker inspect container_name | grep IPAddress
docker inspect mysql | grep IPAddress
2、 iptable转发端口

将容器的8000端口映射到docker主机的8001端口
复制代码 代码如下:

iptables -t nat -A DOCKER -p tcp --dport 8001 -j DNAT --to-destination 172.17.0.19:8000
iptables -t nat -A DOCKER -p tcp --dport 3308 -j DNAT --to-destination 172.17.0.8:3306


方法2
1.提交一个运行中的容器为镜像

docker commit containerid foo/live
docker commit mysql 0619/mysql
2.运行镜像并添加端口

docker run -d -p 8000:80 foo/live /bin/bash
docker run -d -p 3339:3306 0619/mysql /bin/bash
docker run -d -p 3339:3306 0619/mysql --name mysql-test
docker run -d -p 3307:3306 -e MYSQL_ROOT_PASSWORD=db123456! --name mysql8 -v /mnt/mysql8:/var/lib/mysql57 mysql:8 --character-set-server=utf8 --collation-server=utf8_unicode_ci --character-set-client-handshake=FALSE -e TZ=Asia/Shanghai
