
docker run -v /root/mongo-back:/root/mongo-back -d -p 27018:27017 --name mongo  mongo 
#2020-0314最新稳定版为4.2.3
docker run -v /root/mongo-back:/root/mongo-back -d -p 27018:27017 --name mongo423  mongo:4.2.3
docker run -v /root/mongo-back:/root/mongo-back -d -p 27018:27017 --name mongo423  mongo:4.2.3
docker run -v /root/mongo-back:/root/mongo-back -d -p 27018:27017 --name mongo423  mongo:4.2.3 --auth
docker run -v /root/mongo-back:/root/mongo-back -d -p 27016:27017 --name mongo34  mongo:3.4 --auth
docker run -v /root/mongo-back:/root/mongo-back -d -p 27015:27017 --name mongo3420  mongo:3.4.20 --auth
docker update --restart=always mongo423
docker run -v /root/mongo-back:/root/mongo-back -d -p 27018:27017 --name mongo  mongo --auth
docker run -v /root/mongo-back:/root/mongo-back -d -p 27018:27017 --name mongo  mongo:3.2 --auth
docker run -v /root/mongo-back:/root/mongo-back -d -p 27017:27017 --name mongo  mongo:3.4

docker update --restart=always mongo
docker update --restart=always mongo34
docker update --restart=on-failure:3 mongo34


docker run --name mongo-server \
-p 27019:27017 \
--mount type=bind,src=/root/mongo-back,dst=/data/configdb \
--restart=on-failure:3 \
-d mongo

docker run --name mongo-server \
-p 27017:27017 \
--mount type=bind,src=/root/docker/mongo/conf,dst=/root/mongo-back \
--mount type=bind,src=/root/docker/mongo/data,dst=/data/db \
--restart=on-failure:3 \
-d mongo


--name：为容器指定一个名字
-p：指定端口映射，格式为：主机(宿主)端口:容器端口
-e：username="xxx"，设置环境变量
--restart=on-failure:3：是指容器在未来出现异常退出（退出码非0）的情况下循环重启3次
-mount：绑定挂载
-d：后台运行容器，并返回容器 id

#管理员方式进入容器
docker exec -it mongo423 mongo admin
docker exec -it mongo34 mongo admin
docker exec -it mongo3420 mongo admin
docker exec -it mongo mongo admin
#进入容器
docker exec -it mongo bash
#创建admin（所有数据库角色）
db.createUser({ user: 'root', pwd: 'root123456!', roles: [ { role: "userAdminAnyDatabase", db: "admin" } ] });
db.grantRolesToUser ( "root", [ { role: "dbAdminAnyDatabase", db: "admin" } ] )
db.grantRolesToUser ( "root", [ { role: "dbAdminAnyDatabase", db: "admin" } ] )
db.grantRolesToUser ( "root", [ { role: "readWriteAnyDatabase", db: "admin" } ] )

#认证用户
db.getSiblingDB("admin").auth("root", "root123456!")
db.auth("root", "root123456!")
use tasks
db.createUser({ user: 'tasks', pwd: 'admin123456!', roles: [ { role: "dbAdmin", db: "tasks" } ] });
db.grantRolesToUser ( "tasks", [ { role: "dbOwner", db: "tasks" } ] )
db.grantRolesToUser ( "tasks", [ { role: "dbAdmin", db: "tasks" } ] )
db.auth("tasks", "admin123456!")
db.auth("tasks", "m6pCEPrTZI84Lvka")
db.test1.insert({1:1})

use logs
db.createUser({ user: 'logs', pwd: 'admin123456!', roles: [ { role: "dbAdmin", db: "logs" } ] });
db.grantRolesToUser ( "logs", [ { role: "dbOwner", db: "logs" } ] )
db.auth("logs", "admin123456!")
db.test1.insert({1:1})


use yapi
db.createUser({ user: 'yapi', pwd: 'admin123456!', roles: [ { role: "dbAdmin", db: "yapi" } ] });
db.grantRolesToUser ( "yapi", [ { role: "dbOwner", db: "yapi" } ] )
db.auth("yapi", "admin123456!")
db.test1.insert({1:1})

use data
db.createUser({ user: 'data', pwd: 'admin123456!', roles: [ { role: "dbAdmin", db: "data" } ] });
db.grantRolesToUser ( "data", [ { role: "dbOwner", db: "data" } ] )
db.auth("data", "admin123456!")
db.test1.insert({1:1})









备份
mongodump --host 192.168.0.1 --port 37017 --username user --password "pass" --gzip --out /opt/backup/mongodump-2019-04-17
mongodump -h dbhost -d dbname -o dbdirectory
mongodump -h 127.0.0.1:27017 -d tasks --gzip --out /root/mongo-back/20200103tasks.archive
mongodump -h 127.0.0.1:27017 -d tasks --gzip --archive=/root/mongo-back/20200115-1054tasks.archive
mongodump -h 127.0.0.1:27017 -d tasks --gzip --archive=/root/mongo-back/20200314-1607tasks.archive
mongodump -h 127.0.0.1:27017 -d tasks --gzip --archive=/root/mongo-back/20200314-1607tasks.archive -u root -p root123456!
mongodump -h 127.0.0.1:27017 -d tasks --gzip --archive=/root/mongo-back/20200314-1655tasks.archive -u tasks -p admin123456!
mongodump -h 127.0.0.1:27017 -d tasks --gzip --archive=/root/mongo-back/20200115-1054tasks.archive -u tasks -p admin123456!
mongodump -h 127.0.0.1:27017 -d tasks --gzip --archive=/root/20200314-1616tasks.archive -u tasks -p m6pCEPrTZI84Lvka!


恢复
mongo i27.0.0.1:27017/admin -u root -p root123456!

mongorestore -h {host}:27017 -u {user} -p {user_password} -d {db_name} --drop --gzip --archive={back_path}.archive 
mongorestore -h 127.0.0.1:27017 -d tasks --drop --gzip --archive=/root/mongo-back/mongo-back/tasks.archive
mongorestore -h 127.0.0.1:27017 -d tasks --drop --gzip --archive=/root/mongo-back/tasks.archive
mongorestore -h 127.0.0.1:27017 -d tasks --drop --gzip --archive=/root/mongo-back/20200120tasks.archive
mongorestore -h 127.0.0.1:27017 -d tasks --drop --gzip --archive=/root/mongo-back/tasks2020-0308.archive
mongorestore -u tasks -p admin123456! -h 127.0.0.1:27017 -d tasks --drop --gzip --archive=/root/mongo-back/tasks2020-0308.archive


报错处理
如果navicat连接Mongo报错 not authorized on root to execute command

docker exec -it mongo423 mongo admin
db.auth("root","root123456!")
#增加权限
db.grantRolesToUser ( "root", [ { role: "__system", db: "admin" } ] )
db.grantRolesToUser ( "tasks", [ { role: "__system", db: "tasks" } ] )
db.grantRolesToUser ( "tasks", [ { role: "__system", db: "logs" } ] )

db.grantRolesToUser ( "tasks", [ { role: "dbAdmin", db: "tasks" } ] )
db.grantRolesToUser ( "tasks", [ { role: "dbOwner", db: "tasks" } ] )
db.grantRolesToUser ( "logs", [ { role: "dbOwner", db: "logs" } ] )
db.grantRolesToUser ( "logs", [ { data: "dbAdmin", db: "data" } ] )
db.grantRolesToUser ( "logs", [ { role: "dbAdmin", db: "tasks" } ] )

1.数据库用户角色：read、readWrite;
2.数据库管理角色：dbAdmin、dbOwner、userAdmin；
3.集群管理角色：clusterAdmin、clusterManager、clusterMonitor、hostManager；
4.备份恢复角色：backup、restore
5.所有数据库角色：readAnyDatabase、readWriteAnyDatabase、userAdminAnyDatabase、dbAdminAnyDatabase
6.超级用户角色：root


./mongod --dbpath=/path/mongodb
./mongod --dbpath=/var/lib/mongodb
 /var/lib/mongodb
/usr/bin/mongod --dbpath=/var/lib/mongodb
/usr/bin/mongod --dbpath=/var/lib/mongodb &
 /usr/mongodb/bin/mongod --config /usr/mongodb/mongodb.conf 
/usr/bin/mongod --config /usr/mongodb/mongodb.conf 
