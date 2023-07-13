在conf/broker.conf 中 加入 两行配置
namesrvAddr = 172.16.4.240:9876
brokerIP1=你的公网IP

## nameserver
docker run -d -p 9876:9876 --restart=always -v /opt/java/rocketmq-all-5.1.3-bin-release:/mq --name nameserver adoptopenjdk/openjdk8-openj9  sh /mq/bin/mqnamesrv
docker logs -f nameserver
如需修改内存
runserver.sh文件中的 xmx xms设置
## broker
docker run -d -p 10909:10909 -p 10910:10910 -p 10911:10911 --restart=always -v /opt/java/rocketmq-all-5.1.3-bin-release:/mq --name mqbroker adoptopenjdk/openjdk8-openj9  sh /mq/bin/mqbroker -n 172.16.4.240:9876 -c /mq/conf/broker.conf autoCreateTopicEnable=true --enable-proxy
如需修改内存
runbroker.sh文件中的 xmx xms设置

docker logs -f mqbroker
#####查看ip
docker inspect nameserver