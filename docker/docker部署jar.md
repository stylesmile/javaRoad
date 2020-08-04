docker pull java:8
docker pull java:8u191

docker run -d -p 8280:8280 -v /root/label-service/art.jar:/root/label-service/art.jar --name art java:8 java -Xms2g -Xmx2g -jar /root/label-service/art.jar --spring.profiles.active=en --server.port=8280
docker update --restart=always art
docker run -d -p 8280:8280 --restart=always -v /root/label-service:/root/label-service --name art java:8 java -Xms2g -Xmx2g -jar /root/label-service/art.jar --spring.profiles.active=en --server.port=8280 
#官网服务docker部署命令
ker run -d -p 9039:9039 --restart=always -v /root/www-service:/root/www-service --name futve java:8  java -Dlogging.file=/root/www-service/futve.log -jar /root/www-service/futve.jar --spring.profiles.active=43 --server.port=9039

docker run -d -p 80:80 -v /root/label-frontend:/root/label-frontend --name front node:12 node /root/label-frontend/server.js --env=production

docker run -d -p 80:80 --restart=always -v /root/label-frontend:/root/label-frontend --name front node:12 cd /root/label-frontend/ && node server.js --env=production

docker run -d -p 80:80 -v /root/label-frontend:/root/label-frontend --name front node:12 node sh /root/label-frontend/start.sh

node /root/label-frontend/server.js --env=production
docker run -d -p 80:80 --restart=always front -v /root/label-frontend:/root/label-frontend --name front node:12 sh /root/label-frontend/start.sh
docker update --restart=always front

p 8380:8280 表示将容器的端口 映射成宿主主机的端口，否则8280端口访问不到

-v /usr/springboot-1.jar:/usr/springboot-1.jar 表示将宿主主机的jar文件，映射到容器中（分号前为宿主主机的路径，分号后为容器中的路径）

--name art 表示为该容器取一个全局唯一的名称，这里我取的名称为springboot

java:8u191 表示镜像文件的名称和tag

java -jar /root/label-service/art.jar 表示运行jar包，注意：这里的jar包为容器中的位置，是通过前面的-v属