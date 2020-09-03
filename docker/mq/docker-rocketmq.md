docker run -d -p 9876:9876 --restart=always -v /root/java/rocketmq-all-4.7.1-bin-release:/mq --name nameserver adoptopenjdk/openjdk8-openj9  sh /mq/bin/mqnamesrv
#####查看ip
docker inspect nameserver

docker run -d -p 10909:10909 -p 10910:10910 -p 10911:10911 --restart=always -v /root/java/rocketmq-all-4.7.1-bin-release:/mq --name mqbroker adoptopenjdk/openjdk8-openj9  sh /mq/bin/mqbroker -n 172.17.0.11:9876

