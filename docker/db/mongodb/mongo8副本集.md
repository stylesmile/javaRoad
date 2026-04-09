### 安装
```install
## 非副本集
sudo docker run -d --restart=always -p 27017:27017 --name mongo7  mongo:7
sudo docker run -d --restart=always -p 27017:27017 --name mongo8  mongo:8
sudo docker run -d --restart=always -p 27017:27017 -v /data/mongo8/data/db:/data/db --name mongo8-2 mongo:8  mongod --dbpath /data/db


sudo docker run -d -p 27011:27017 --name mongo70  mongo:8 mongod --dbpath /data/db --replSet appSet

## 副本集
sudo docker run -d -p 27011:27017 --name mongo8  mongo:8 --replSet appSet
sudo docker run -d -p 27011:27017 --name mongo70  mongo:8 mongod --dbpath /data/db --replSet appSet
```
### 以管理员身份进入容器
```mongo
sudo docker exec -it mongo8 mongosh admin
```
### 初始化副本集
```mongo
rs.initiate()
```
### 日志
```log
{
  info2: 'no configuration specified. Using a default configuration for the set',
  me: '7987a69fe2a1:27017',
  ok: 1,
  '$clusterTime': {
    clusterTime: Timestamp({ t: 1729151292, i: 1 }),
    signature: {
      hash: Binary.createFromBase64('AAAAAAAAAAAAAAAAAAAAAAAAAAA=', 0),
      keyId: Long('0')
    }
  },
  operationTime: Timestamp({ t: 1729151292, i: 1 })
}
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


### 设置开机启动
```mongo
sudo docker update --restart=always mongo8 
```
