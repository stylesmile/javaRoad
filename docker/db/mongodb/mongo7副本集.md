docker run -d --restart=always -p 27018:27017 --name mongo7  mongo:7
docker run -d -p 27017:27017 --name mongo7  mongo:7 --replSet appSet
docker run -d -p 27015:27017 --name mongo70  mongo:7 mongod --dbpath /data/db --replSet appSet

已管理员身份进入容器
```mongo
docker exec -it mongo70 mongosh admin
```

初始化副本集
```mongo
rs.initiate()
```

设置开机启动
```mongo
docker update --restart=always mongo7 
```
