管理员账号：admin@docker.yapi
管理员密码：adm1n

15002770045@139.com
ganyinglai123@foxmail.com
xujiebing1992@foxmail.com
#
docker run --rm -p 40001:3000 jayfong/yapi:play
docker run -d -p 40001:3000 jayfong/yapi:play
docker run -d -p 40001:3000 -p 2701:27017 jayfong/yapi:play

##开机启动
docker update --restart=always yapi 

参考
https://github.com/fjc0k/docker-YApi
https://github.com/YMFE/yapi
https://gitee.com/mirrors/YApi

备份
mongodump -h 127.0.0.1:2701 -d yapi --gzip --archive=/root/mongo-back/2020-0620-yapi.archive
还原
mongorestore -h 127.0.0.1:2701 -d yapi --drop --gzip --archive=/root/mongo-back/2020-0620-yapi.archive
