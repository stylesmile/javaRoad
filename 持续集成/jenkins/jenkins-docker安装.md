##拉取镜像
```
docker pull adoptopenjdk/openjdk11-openj9
```

##部署
```
docker run -d -p 7088:7088 --restart=always -v /root/java/jenkins:/chenye --name jenkins2 adoptopenjdk/openjdk11-openj9  java  -jar /chenye/jenkins2.253.war --httpPort=7088
```

```
sudo docker run -d -p 7088:7088 --restart=always -v /home/ubuntu/java/jenkins:/jenkins --name jenkins2 ibm-semeru-runtimes:open-21-jdk-jammy java -jar /jenkins/jenkins2.462.2.war --httpPort=7088```
```
```
sudo docker run -d -p 7088:7088 --restart=always -v /home/ubuntu/java/jenkins:/jenkins --name jenkins2 ibm-semeru-runtimes:open-17-jdk-jammy java -Dhudson.security.csrf.DefaultCrumbIssuer.EXCLUDE_SESSION_ID=true -jar /jenkins/jenkins2.462.2.war --httpPort=7088
```

##限制容器内存cpu

限制最多使用一个cpu,最多用一g内存
```
docker container update  example --cpus="1" --memory="1g"  --memory-swap="-1"
```



##查看 密码
cat /root/.jenkins/secrets/initialAdminPassword

##官网
https://www.jenkins.io/
##下载地址

https://mirrors.aliyun.com/jenkins/
https://mirrors.aliyun.com/jenkins/war/

java -jar jenkins.war --httpPort=9090

nohup java -jar jenkins.war --httpPort=9090 &
