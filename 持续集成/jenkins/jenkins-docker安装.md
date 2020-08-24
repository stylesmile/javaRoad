##拉取镜像
```
docker pull adoptopenjdk/openjdk11-openj9
```

##部署
```
docker run -d -p 7088:7088 --restart=always -v /root/java/jenkins:/chenye --name jenkins2 adoptopenjdk/openjdk11-openj9  java  -jar /chenye/jenkins2.253.war --httpPort=7088
```

##限制容器内存cpu
```
docker container update  example --cpus="1" --memory="1g"  --memory-swap="-1"
```
限制最多使用一个cpu,最多用一g内存


##查看 密码
cat /root/.jenkins/secrets/initialAdminPassword

##官网
https://www.jenkins.io/
##下载地址

https://mirrors.aliyun.com/jenkins/
https://mirrors.aliyun.com/jenkins/war/

java -jar jenkins.war --httpPort=9090

nohup java -jar jenkins.war --httpPort=9090 &
