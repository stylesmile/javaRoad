docker run --name redis -d -p 6380:6379 redis --appendonly yes 
docker run --name redis -d -p 6379:6379 redis --appendonly yes 
docker run --name redis -d -p 6379:6379 redis --appendonly yes -v /root/db
docker run --name redis78 -d -v /root/mongo-back:/root/mongo-back -p 6380:6379 redis --appendonly yes
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

