sudo docker run -d --restart=always -p 27017:27017 --name mongo7  mongo:7 --replSet appSet
sudo docker run -d --restart=always -p 27015:27017 --name mongo70  mongo:7 mongod --dbpath /data/db --replSet appSet

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
