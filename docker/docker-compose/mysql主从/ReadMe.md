
##主库
###主服务器log-bin日志
执行 show master status;
记下File, Position
##查看binlog是否开启
show variables like "%log_bin%";
##日志位置
show variables like 'general_log_file';



## 配置mysql主从复制
在从机上需要进行CHANGE MASTER TO操作，以确定需要同步的主机IP，用户名，密码，binlog文件，binlog位置等信息。
CHANGE MASTER TO
MASTER_HOST='192.168.0.38',
MASTER_PORT=3316,
MASTER_USER='root',
MASTER_PASSWORD='123456',
MASTER_LOG_FILE='binlog.000002',
MASTER_LOG_POS=1660;


start slave;
stop slave;
##查看状态
show slave status;
当 Slave_IO_Running: Yes Slave_SQL_Running: Yes时 配置成功！







3.根据配置文件生成容器并运行
在Linux Shell中执行

docker-compose up -d
1
会如下输出类似的信息

Creating network "wen_jznet" with driver "bridge"
Creating wen_mysql-slave_1
Creating wen_mysql-master_1
1
2
3
4.在主库中创建同步用户
此时使用数据库客户端工具连接上Master主数据库，

或直接使用

docker exec -it “容器ID” /bin/bash
1
进入容器，使用

mysql -u root -p
1
输入在docker-compose.yml中配置的MYSQL_ROOT_PASSWORD为密码进入到MySQL Shell，输入以下命令创建允许主从复制的用户 repl ，密码为 Ron_master_1

CREATE USER 'repl'@'%' IDENTIFIED WITH mysql_native_password BY 'Ron_master_1';
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';
1
2
⚠️注意，用户权限问题
此时的用户没有创建库或表的权限，以root用户登录主库并执行以下命令赋予repl用户权限

GRANT ALL PRIVILEGES ON  *.* TO ‘repl’@‘%’ IDENTIFIED BY 'Ron_master_1’；
1
5.在从库中配置主库信息
切换到 Slave数据库，执行以下命令，设置主库信息

CHANGE MASTER TO
MASTER_HOST='172.18.4.24',
MASTER_USER='repl',
MASTER_PASSWORD='Ron_master_1',
MASTER_LOG_FILE='binlog.000002',
MASTER_LOG_POS=642;
1
2
3
4
5
6
6.开始同步
然后在Slave数据库中再执行以下命令，开始同步

start slave;
1
7.查看从库同步状态
可以执行以下命令查看从库状态

show slave status\G;
1
输出结果如下表示从库运行正常

mysql> show slave status\G;
*************************** 1. row ***************************
               Slave_IO_State: Waiting for master to send event
                  Master_Host: 172.18.4.24
                  Master_User: repl
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: binlog.000003
          Read_Master_Log_Pos: 4067
               Relay_Log_File: f3f3d65fee1e-relay-bin.000002
                Relay_Log_Pos: 1730
        Relay_Master_Log_File: binlog.000003
             Slave_IO_Running: Yes
            Slave_SQL_Running: Yes
              Replicate_Do_DB: 
          Replicate_Ignore_DB: 
           Replicate_Do_Table: 
       Replicate_Ignore_Table: 
      Replicate_Wild_Do_Table: 
  Replicate_Wild_Ignore_Table: 
                   Last_Errno: 0
                   Last_Error: 
                 Skip_Counter: 0
          Exec_Master_Log_Pos: 4067
              Relay_Log_Space: 1946
              Until_Condition: None
               Until_Log_File: 
                Until_Log_Pos: 0
           Master_SSL_Allowed: No
           Master_SSL_CA_File: 
           Master_SSL_CA_Path: 
              Master_SSL_Cert: 
            Master_SSL_Cipher: 
               Master_SSL_Key: 
        Seconds_Behind_Master: 0
Master_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 0
                Last_IO_Error: 
               Last_SQL_Errno: 0
               Last_SQL_Error: 
  Replicate_Ignore_Server_Ids: 
             Master_Server_Id: 1
                  Master_UUID: 2388be4b-9b3a-11ea-8561-0242ac120418
             Master_Info_File: mysql.slave_master_info
                    SQL_Delay: 0
          SQL_Remaining_Delay: NULL
      Slave_SQL_Running_State: Slave has read all relay log; waiting for more updates
           Master_Retry_Count: 86400
                  Master_Bind: 
      Last_IO_Error_Timestamp: 
     Last_SQL_Error_Timestamp: 
               Master_SSL_Crl: 
           Master_SSL_Crlpath: 
           Retrieved_Gtid_Set: 
            Executed_Gtid_Set: 
                Auto_Position: 0
         Replicate_Rewrite_DB: 
                 Channel_Name: 
           Master_TLS_Version: 
       Master_public_key_path: 
        Get_master_public_key: 0
            Network_Namespace: 
1 row in set (0.00 sec)

ERROR: 
No query specified
67
查看主库状态,需要在主库中执行

show master status;
1
输出如下

mysql> show master status;
+---------------+----------+--------------+------------------+-------------------+
| File          | Position | Binlog_Do_DB | Binlog_Ignore_DB | Executed_Gtid_Set |
+---------------+----------+--------------+------------------+-------------------+
| binlog.000003 |     4067 |              |                  |                   |
+---------------+----------+--------------+------------------+-------------------+

其中File表示主从库同步所依赖的二进制文件，Position代表位置，

Position和Read_Master_Log_Pos数值一致代表此时主从库是一致的。

⚠️注意
主库必须使用具有从库同步权限的用户登录并进行操作才可以同步至从库。

附：安装过程中出现的错误
安装完成后主库和从库不会同步，在从库中查看从库状态

show slave status\G;
输出如下，

mysql> show slave status\G;
*************************** 1. row ***************************
               Slave_IO_State: 
                  Master_Host: 172.18.4.24
                  Master_User: repl
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: binlog.000002
          Read_Master_Log_Pos: 642
               Relay_Log_File: f3f3d65fee1e-relay-bin.000010
                Relay_Log_Pos: 321
        Relay_Master_Log_File: binlog.000002
             Slave_IO_Running: No
            Slave_SQL_Running: Yes
              Replicate_Do_DB: 
          Replicate_Ignore_DB: 
           Replicate_Do_Table: 
       Replicate_Ignore_Table: 
      Replicate_Wild_Do_Table: 
  Replicate_Wild_Ignore_Table: 
                   Last_Errno: 0
                   Last_Error: 
                 Skip_Counter: 0
          Exec_Master_Log_Pos: 642
              Relay_Log_Space: 702
              Until_Condition: None
               Until_Log_File: 
                Until_Log_Pos: 0
           Master_SSL_Allowed: No
           Master_SSL_CA_File: 
           Master_SSL_CA_Path: 
              Master_SSL_Cert: 
            Master_SSL_Cipher: 
               Master_SSL_Key: 
        Seconds_Behind_Master: NULL
Master_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 13114
                Last_IO_Error: Got fatal error 1236 from master when reading data from binary log: 'log event entry exceeded max_allowed_packet; Increase max_allowed_packet on master; the first event 'binlog.000002' at 642, the last event read from './binlog.000002' at 125, the last byte read from './binlog.000002' at 661.'
               Last_SQL_Errno: 0
               Last_SQL_Error: 
  Replicate_Ignore_Server_Ids: 
             Master_Server_Id: 1
                  Master_UUID: 2388be4b-9b3a-11ea-8561-0242ac120418
             Master_Info_File: mysql.slave_master_info
                    SQL_Delay: 0
          SQL_Remaining_Delay: NULL
      Slave_SQL_Running_State: Slave has read all relay log; waiting for more updates
           Master_Retry_Count: 86400
                  Master_Bind: 
      Last_IO_Error_Timestamp: 200521 08:55:15
     Last_SQL_Error_Timestamp: 
               Master_SSL_Crl: 
           Master_SSL_Crlpath: 
           Retrieved_Gtid_Set: 
            Executed_Gtid_Set: 
                Auto_Position: 0
         Replicate_Rewrite_DB: 
                 Channel_Name: 
           Master_TLS_Version: 
       Master_public_key_path: 
        Get_master_public_key: 0
            Network_Namespace: 
1 row in set (0.00 sec)

ERROR: 
No query specified


经一番搜索后发现是从库的同步点和主库不一致造成的，此时在主库中查看二进制文件同步位置，

show master status;
1
输出如下，

mysql> show master status;
+---------------+----------+--------------+------------------+-------------------+
| File          | Position | Binlog_Do_DB | Binlog_Ignore_DB | Executed_Gtid_Set |
+---------------+----------+--------------+------------------+-------------------+
| binlog.000003 |     2658 |              |                  |                   |
+---------------+----------+--------------+------------------+-------------------+
1 row in set (0.01 sec)

对比发现，主库的Position为2658，从库的Exec_Master_Log_Pos为642。

停止从库同步,

stop slave;

在仓库中执行以下命令，手动把从库的同步点与主库对齐，

 change master to Master_Log_File='binlog.000003',Master_Log_Pos=2658;

开启同步

start slave

此时使用具有同步权限的用户登录主库，创建数据库，从库可以同步，完成。

⚠️注意
在手动将主库和从库的同步点对齐之前，即在执行以下命令之前，

 change master to Master_Log_File='binlog.000003',Master_Log_Pos=2658;
1
要手动将主库中的数据库和表及表中的数据同步至从库，否则从库在同步时，会出现没有此数据库或此表的错误。

例如，查看Slave状态时，输出如下，

ysql> show slave status\G;
*************************** 1. row ***************************
               Slave_IO_State: Waiting for master to send event
                  Master_Host: 172.18.4.24
                  Master_User: repl
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: binlog.000003
          Read_Master_Log_Pos: 1491
               Relay_Log_File: f3f3d65fee1e-relay-bin.000012
                Relay_Log_Pos: 540
        Relay_Master_Log_File: binlog.000003
             Slave_IO_Running: Yes
            Slave_SQL_Running: No
              Replicate_Do_DB: 
          Replicate_Ignore_DB: 
           Replicate_Do_Table: 
       Replicate_Ignore_Table: 
      Replicate_Wild_Do_Table: 
  Replicate_Wild_Ignore_Table: 
                   Last_Errno: 1049
                   Last_Error: Error 'Unknown database 'test'' on query. Default database: 'test'. Query: '/* ApplicationName=DataGrip 2020.1.3 */ create table test(
    id bigint primary key not null unique auto_increment,
    name varchar(255)
)'
                 Skip_Counter: 0
          Exec_Master_Log_Pos: 881
              Relay_Log_Space: 1531
              Until_Condition: None
               Until_Log_File: 
                Until_Log_Pos: 0
           Master_SSL_Allowed: No
           Master_SSL_CA_File: 
           Master_SSL_CA_Path: 
              Master_SSL_Cert: 
            Master_SSL_Cipher: 
               Master_SSL_Key: 
        Seconds_Behind_Master: NULL
Master_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 0
                Last_IO_Error: 
               Last_SQL_Errno: 1049
               Last_SQL_Error: Error 'Unknown database 'test'' on query. Default database: 'test'. Query: '/* ApplicationName=DataGrip 2020.1.3 */ create table test(
    id bigint primary key not null unique auto_increment,
    name varchar(255)
)'
  Replicate_Ignore_Server_Ids: 
             Master_Server_Id: 1
                  Master_UUID: 2388be4b-9b3a-11ea-8561-0242ac120418
             Master_Info_File: mysql.slave_master_info
                    SQL_Delay: 0
          SQL_Remaining_Delay: NULL
      Slave_SQL_Running_State: 
           Master_Retry_Count: 86400
                  Master_Bind: 
      Last_IO_Error_Timestamp: 
     Last_SQL_Error_Timestamp: 200521 09:23:00
               Master_SSL_Crl: 
           Master_SSL_Crlpath: 
           Retrieved_Gtid_Set: 
            Executed_Gtid_Set: 
                Auto_Position: 0
         Replicate_Rewrite_DB: 
                 Channel_Name: 
           Master_TLS_Version: 
       Master_public_key_path: 
        Get_master_public_key: 0
            Network_Namespace: 
1 row in set (0.00 sec)

ERROR: 
No query specified

————————————————
版权声明：本文为CSDN博主「梵莫」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/weixin_43981099/article/details/106267634