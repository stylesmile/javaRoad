cd /home/chenye

查看容器docker ps -a
 

停止容器docker stop dfafc85bd908
 

删除容器 docker rm dfafc85bd908
查看 镜像

docker images

删除镜像

docker rmi 396299b75924

 

 

将jar 和dockerfile复制到当前目录，

----  start  ---
#定义基础环境，后续执行在此基础上进行的，即jdk环境
FROM java:8
#指定作者
MAINTAINER chenye
#复制本地jar到镜像中
ADD pigtest.jar /app.jar
#暴露给容器外的端口
EXPOSE 9290
#执行的命令
ENTRYPOINT ["java","-Xms2g","-Xmx2g","-jar","app.jar","--spring.profiles.active=hk","--server.port=8280"]
-----  end  --- 


home/chenye

用jar生成镜像

docker build -t art .

启动镜像
docker run -d -p 8280:8280 art

————————————————
版权声明：本文为CSDN博主「qq_34874784」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/qq_34874784/article/details/103480342