在conf/broker.conf 中 加入 两行配置
namesrvAddr = 你的公网IP:9876
brokerIP1=你的公网IP

docker run -d -p 9876:9876 --restart=always -v /root/java/rocketmq-all-4.7.1-bin-release-docker:/mq --name nameserver adoptopenjdk/openjdk8-openj9  sh /mq/bin/mqnamesrv
docker logs -f nameserver
docker run -d -p 10909:10909 -p 10910:10910 -p 10911:10911 --restart=always -v /root/java/rocketmq-all-4.7.1-bin-release-docker:/mq --name mqbroker adoptopenjdk/openjdk8-openj9  sh /mq/bin/mqbroker -n 39.97.250.105:9876 -c /mq/conf/broker.conf autoCreateTopicEnable=true
docker logs -f mqbroker
#####查看ip
docker inspect nameserver