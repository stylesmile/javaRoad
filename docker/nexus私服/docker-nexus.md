##nexus2 安装
docker run -p 8082:8081 --name nexus2 sonatype/nexus

首页
http://39.97.250.105:8082/nexus/index.html
###默认用户名密码
admin
admin123

进入容器
docker exec -it nexus2 bash
查看密码

## nexus3 安装
```
docker run -p 8083:8081 --name nexus3 sonatype/nexus3
```
首页
http://39.97.250.105:8083

Your admin user password is located in
/nexus-data/admin.password on the server.
