### docker安装mongo7
```官网问的
https://docs.percona.com/percona-server-for-mongodb/7.0/install/docker.html#__tabbed_1_1
https://hub.docker.com/r/percona/percona-server-mongodb
```

```percona-server-mongodb
sudo docker run -d --name mongo7 \
       -e MONGO_INITDB_ROOT_USERNAME=admin \
       -e MONGO_INITDB_ROOT_PASSWORD=admin123456 \
       -p 27013:27017 \
       percona/percona-server-mongodb:7.0
```
```percona-server-mongodb
sudo docker run -d --name mongo7 \
       -e MONGO_INITDB_ROOT_USERNAME=mongoadmin \
       -e MONGO_INITDB_ROOT_PASSWORD=admin123456 \
       -p 27013:27017 \
       percona/percona-server-mongodb:7.0 \
       mongod --replSet appSet 
```

```
```mongo
sudo docker run -d -p 27015:27017 --name mongo70  mongo:7 mongod --dbpath /data/db --replSet appSet
```
已管理员身份进入容器
```mongo
sudo docker exec -it mongo70 mongosh admin
```

初始化副本集
```mongo
rs.initiate()
```
添加副本集
```mongo
appSet:PRIMARY> rs.add('192.168.191.159:27018')
 {
     "ok" : 1,
     "operationTime" : Timestamp(1637841965, 1),
     "$clusterTime" : {
         "clusterTime" : Timestamp(1637841965, 1),
             "signature" : {
                 "hash" : BinData(0,"AAAAAAAAAAAAAAAAAAAAAAAAAAA="),
                 "keyId" : NumberLong(0)
             }
         }
 }
```

继续执行：rs.add('192.168.191.159:27019',true) 其中true表示这个节点是仲裁节点
使用 rs.conf() 查看副本集配置


设置开机启动
```mongo
sudo docker update --restart=always mongo70 
```
