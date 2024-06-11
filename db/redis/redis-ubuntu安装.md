1.Redis安装和配置**执行以下命令安装redis服务
```
sudo apt-get install redis-server
```
修改绑定ip，执行sudo vi /etc/redis/redis.conf，
将127.0.0.1修改为当前主机ip
bind 192.168.0.38

修改密码
# requirepass foobared修改为
requirepass pwd123456

