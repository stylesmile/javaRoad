##方式一：Slaveof
Redis Slaveof 命令可以将当前服务器转变为指定服务器的从属服务器(slave server)。

如果当前服务器已经是某个主服务器(master server)的从属服务器，
那么执行 SLAVEOF host port 将使当前服务器停止对旧主服务器的同步，丢弃旧数据集，转而开始对新主服务器进行同步。

另外，对一个从属服务器执行命令 SLAVEOF NO ONE 将使得这个从属服务器关闭复制功能，
并从从属服务器转变回主服务器，原来同步所得的数据集不会被丢弃。
redis 127.0.0.1:6379> SLAVEOF 127.0.0.1 6379
查看
info
redis 127.0.0.1:6379> SLAVEOF NO ONE
OK


##二、方式二，安装redis-dump工具
yum install ruby rubygems ruby-devel
gem sources -a http://ruby.taobao.org/
gem install redis-dump -V 
redis-dump导入导出
# 导出命令 
redis-dump –u 127.0.0.1:6379 > test.json
# 导出指定数据库数据 
redis-dump -u 127.0.0.1:6379 -d 15 > test.json
# 如果redis设有密码
redis-dump –u :password@127.0.0.1:6379> test.json 
#导入命令 
< test.json redis-load –u 127.0.0.1:6379
# 如果redis设有密码 
< test.json redis-load -u :password@127.0.0.1:6379
 
