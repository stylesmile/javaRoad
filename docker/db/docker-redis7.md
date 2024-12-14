安装
docker run --name redis -d --restart=always -p 6379:6379 redis:7 redis-server --appendonly yes --requirepass "123456"

123456是密码
# 
docker run  --name redis -p 6379:6379 -v $PWD/redis.conf:/etc/redis/redis.conf -v $PWD/data:/data -d redis:7 redis-server /etc/redis/redis.conf --appendonly yes
密码配置在redis.conf中，
