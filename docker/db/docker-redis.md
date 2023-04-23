# 安装最新稳定版redis 密码 123456
docker run --name redis -d -p 6379:6379 redis redis-server --appendonly yes --requirepass "123456"
# 安装redis 7.x 密码 123456
docker run --name redis -d -p 6379:6379 redis:7 redis-server --appendonly yes --requirepass "123456"

# 其他
docker run --name redis -d -p 6380:6379 redis --appendonly yes 
docker run --name redis -d -p 6379:6379 redis --appendonly yes 
docker run --name redis -d -p 6379:6379 redis --appendonly yes -v /root/db
docker run --name redis78 -d -v /root/redis-back:/root/redis-back -p 6380:6379 redis --appendonly yes
docker run --name redis -d -v /root/db-backup:/root/db-backup -p 6380:6379 redis:6.0.5 --appendonly yes
docker update --restart=always redis 

#redis 备份
redis-cli  -p 6379
生成dump.rdb
SAVE
查看dump.rdb目录
config get dir 
##还原
把dump.rdb替换
/var/lib/redis的dump.rdb



1.redis-cli 进入客户端
redis-cli -h 127.0.0.1 -p 6379 -a "mypassword"
redis-cli -h 192.168.0.41 -p 6380
redis-cli -h 192.168.0.36 -p 6380
2.连接主
      >  slaveof ip port   
      >  slaveof 192.168.0.36 6380   
3.info查看是否复制成功
4.断开主
    > slaveof no one
    SLAVEOF NO ONE


