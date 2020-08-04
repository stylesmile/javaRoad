文章目录
docker实践之docker-compose部署mysql
1、安装部署docker
2、编写docker-compose文件
3、编写配置文件和初始化文件
4、启动数据库
5、检查初始化的数据
6、验证远程连接
docker实践之docker-compose部署mysql
前面用golang写了一个api server，但是要用到一些测试数据，又要方便给别人，想来用docker部署环境最简单了。只需要简单执行两个命令就可以搞定了。博主的环境是windows然后在windows里面部署一个centos7的虚拟机。在虚拟机里面安装部署了docker。

1、安装部署docker
在linux下面只需简单的一个命令：

yum install docker
1
其他的系统类似。

2、编写docker-compose文件
version: '2'
services:
    mysql:
        network_mode: "host"
        environment:
            MYSQL_ROOT_PASSWORD: "yourpassword"
            MYSQL_USER: 'test'
            MYSQL_PASS: 'yourpassword'
        image: "docker.io/mysql:latest" 
        restart: always
        volumes:
            - "./db:/var/lib/mysql"
            - "./conf/my.cnf:/etc/my.cnf"
            - "./init:/docker-entrypoint-initdb.d/"

这里稍微解释一下，其中，network_mode为容器的网络模式，一般自己测试用host模式就可以了。MYSQL_ROOT_PASSWORD为数据库的密码，也就是root用户的密码。MYSQL_USER和MYSQL_PASS另外一个用户名和密码。image为你拉取镜像的地址和版本，当然也可以换成自己的镜像仓库，这里使用官方的。volumes里面的参数为映射本地和docker容器里面的文件夹和目录。./db 用来存放了数据库表文件，./conf/my.cnf存放自定义的配置文件，./init存放初始化的脚本。ports 为映射主机和容器的端口。写好docker-compose.yml后把相应的文件夹建好，当然也可以换成你自己的。下面的是博主的文件夹结构。

root@localhost mysql # tree
.
├── conf
│   └── my.cnf
├── db
├── docker-compose.yml
└── init
    └── init.sql

3、编写配置文件和初始化文件
root@localhost conf # cat my.cnf 
[mysqld]
user=mysql
default-storage-engine=INNODB
character-set-server=utf8
[client]
default-character-set=utf8
[mysql]
default-character-set=utf8

这里的配置文件只是一个简单的举例，大家需要根据自己的配置来更改。

root@localhost init # cat init.sql 
use mysql;
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'yourpassword';
create database test;
use test;
create table user
(
    id int auto_increment primary key,
    username varchar(64) unique not null,
    email varchar(120) unique not null,
    password_hash varchar(128) not null,
    avatar varchar(128) not null
);
insert into user values(1, "zhangsan","test12345@qq.com","passwd","avaterpath");
insert into user values(2, "lisi","12345test@qq.com","passwd","avaterpath");

ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'yourpassword';这一句比较重要，放开root登入权限，如果你要在其他的主机用root用户登入到数据库就需要写入这句话。其他的语句就是建表操作和插入数据的操作了。

4、启动数据库
root@localhost mysql # docker-compose pull

.......下载镜像过程

root@localhost mysql # docker-compose up -d

mysql_mysql_1_234be9b015e4 is up-to-date
root@localhost mysql # 
1
2
3
4
5
6
7
8
此处需要在存放docker-compose.yml的文件夹进行操作。

5、检查初始化的数据
root@localhost mysql # docker ps
CONTAINER ID        IMAGE                    COMMAND                  CREATED             STATUS              PORTS               NAMES
cffe8d56f222        docker.io/mysql:latest   "docker-entrypoint..."   21 minutes ago      Up 21 minutes                           mysql_mysql_1_234be9b015e4
root@localhost mysql # docker exec -it cffe8d56f222 bash
root@localhost:/# mysql -uroot -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 11
Server version: 8.0.13 MySQL Community Server - GPL

Copyright (c) 2000, 2018, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use test;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> select * from user;
+----+----------+------------------+---------------+------------+
| id | username | email            | password_hash | avatar     |
+----+----------+------------------+---------------+------------+
|  1 | zhangsan | test12345@qq.com | passwd        | avaterpath |
|  2 | lisi     | 12345test@qq.com | passwd        | avaterpath |
+----+----------+------------------+---------------+------------+
2 rows in set (0.00 sec)

可以看到数据存入到数据库当中去。
