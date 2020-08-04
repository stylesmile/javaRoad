Slave failed to initialize relay log info structure from the repository

##日志位置
show variables like 'general_log_file';
##查看日志
tail -30 /var/lib/mysqld.log

可以看到报错，原来是找不到./server246-relay-bin.index文件，找到原因所在了，由于我使用的是冷备份文件恢复的实例，在mysql库中的slave_relay_log_info表中依然保留之前relay_log的信息，所以导致启动slave报错。
mysql提供了工具用来删除记录：slave reset；
slave reset执行候做了这样几件事：
1、删除slave_master_info ，slave_relay_log_info两个表中数据；
2、删除所有relay log文件，并重新创建新的relay log文件；
3、不会改变gtid_executed 或者 gtid_purged的值
————————————————
版权声明：本文为CSDN博主「无知的蜗牛」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/weixin_37998647/article/details/79950133