#正确
docker run -d -p 3307:3306 -e MYSQL_ROOT_PASSWORD=db123456! --name mysql -v /mnt/mysql:/var/lib/mysql57 mysql:5.7 --character-set-server=utf8 --collation-server=utf8_unicode_ci --character-set-client-handshake=FALSE
docker run -d -p 3304:3306 -e MYSQL_ROOT_PASSWORD=db123456! --name mysql -v /mnt/mysql:/var/lib/mysql57 mysql:5.7 --character-set-server=utf8 --collation-server=utf8_unicode_ci --character-set-client-handshake=FALSE
docker run -d -p 3307:3306 -e MYSQL_ROOT_PASSWORD=db123456! --name mysql8 -v /mnt/mysql8:/var/lib/mysql57 mysql:8 --character-set-server=utf8 --collation-server=utf8_unicode_ci --character-set-client-handshake=FALSE
docker run -d -p 3304:3306 -e MYSQL_ROOT_PASSWORD=db123456! --name mysql8-futve -v /mnt/mysql8:/var/lib/mysql57 mysql:8 --character-set-server=utf8 --collation-server=utf8_unicode_ci --character-set-client-handshake=FALSE
docker run -d -p 3305:3306 -e MYSQL_ROOT_PASSWORD=db123456!@ --name mysql8 -v /mnt/mysql8:/var/lib/mysql8 mysql:8 --character-set-server=utf8 --collation-server=utf8_unicode_ci --character-set-client-handshake=FALSE
docker run -d -p 3307:3306 -e MYSQL_ROOT_PASSWORD=db123456!@ --name mysql8 -v /mnt/mysql8:/var/lib/mysql8 mysql:8 --character-set-server=utf8 --collation-server=utf8_unicode_ci --character-set-client-handshake=FALSE
docker run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 --name mysql8 -v /mnt/mysql8:/var/lib/mysql57 mysql:8 --character-set-server=utf8 --collation-server=utf8_unicode_ci --character-set-client-handshake=FALSE


#错误，测试
docker run -d -p 3307:3306 -e MYSQL_ROOT_PASSWORD=db123456! --name mysql8 -v /mnt/mysql8:/var/lib/mysql mysql:8 --character-set-server=utf8 --collation-server=utf8_unicode_ci --character-set-client-handshake=FALSE
docker run -d -p 3307:3306 -e MYSQL_ROOT_PASSWORD=db123456! --name mysql8 -v /mnt/mysql8:/var/lib/mysql57 mysql:8 --character-set-server=utf8 --collation-server=utf8_unicode_ci --character-set-client-handshake=FALSE -e TZ=Asia/Shanghai
#说明，mysql8不支持映射空文件映射， 
例如，-v /mnt/mysql8:/var/lib/mysql
旧的时区换方式也不能用了 这个-e TZ=Asia/Shanghai


开机启动
docker update --restart=always mysql

--还原
mysql  -u  user   -p    [dbname]  <  filename.sql  
mysql  -u  root  db123456!  will_art < will_art.sql 
mysql  -u  root will_art < will_art.sql 
mysql –uroot –proot will_art < /var/lib/mysql/backup/will_art.sql
user  是执行  backup.sql  文件中语句的用户名;  p 表示用户密码；dbname 是数据库名。如果  filename.sgl  文件为mysqldump 工具创建的包含创建数据库语句的文件，执行的时候不需要指定数据库名。

--备份
mysqldump -h 192.168.1.100 -p 3306 -u root -p password --database cmdb > /data/backup/cmdb.sql

/var/lib/mysql/backup# pwd
/var/lib/mysql/backup
root@67e0113f3f23:/var/lib/mysql/backup# 





mysql -u root -p booksDB < F:\backup\booksDB_20180603.sql
