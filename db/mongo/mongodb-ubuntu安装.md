1. Mongo安装和配置**执行命令安装mongo服务
```
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update
sudo apt-get install mongodb-org=3.2.21 mongodb-org-server=3.2.21 mongodb-org-shell=3.2.21 mongodb-org-mongos=3.2.21 mongodb-org-tools=3.2.21
```
修改mongo监听ip，执行sudo vi /etc/mongod.conf，将127.0.0.1修改为当前主机ip
![图片](https://images-cdn.shimo.im/BEaAvygfEkkTa6mR/image.image/png!thumbnail)

sudo service mongod restart

2.修改密码
vi /etc/mongod.conf
//注释这两句 => 关闭认证
#security:
# authorization: enabled

//打开这两句 => 启用认证
security:
 authorization: enabled
 

