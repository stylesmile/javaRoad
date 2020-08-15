##1.开启日志
修改配置文件 vi /etc/my.cnf
增加
```$xslt
server-id=1
log-bin=binlog
```
重启数据库服务
systemctl restart mysqld

##2.操作数据库
mysql> create database mydb charset utf8mb4;
mysql> use mydb;
mysql> create table test(id int)engine=innodb charset=utf8mb4;
mysql> insert into test values(1);
mysql> insert into test values(2);
mysql> insert into test values(3);
mysql> insert into test values(4);
mysql> commit;
mysql> update test set id=10 where id=4;
mysql> commit;


##3.查看二进制日志信息
```$xslt
show master status\G;
```


##4.查找创库和删库的点,为219和1868
```$xslt
mysql> show binlog events in 'binlog.000001';

```

##5.另存为二进制日志信息
```$xslt
mysqlbinlog --start-position=219 --stop-position=1868 /var/lib/mysql/binlog.000001 > /tmp/binlog.sql
```

##恢复数据
#临时关闭二进制日志记录以免重复记录
mysql> set sql_log_bin=0;
#恢复数据
mysql> source /tmp/binlog.sql
#重启二进制日志记录
mysql> set sql_log_bin=1;

##6.查看数据恢复情况
show databases;