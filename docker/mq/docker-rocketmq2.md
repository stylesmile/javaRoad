在conf/broker.conf 中 加入 两行配置
namesrvAddr = 你的公网IP:9876
brokerIP1=你的公网IP

ddocker run -d -p 9876:9876 --restart=always -v /opt/java/rocketmq-all-5.1.1-bin-release:/opt/java/rocketmq-all-5.1.1-bin-release --name mqbroker adoptopenjdk/openjdk11-openj9 sh /opt/java/rocketmq-all-5.1.1-bin-release/bin/mqbroker -n localhost:9876 --enable-proxy

docker run -d -p 10911:10911 -p 10909:10909 --restart=always -v /opt/java/rocketmq-all-5.1.1-bin-release:/opt/java/rocketmq-all-5.1.1-bin-release --name mqnamesrv adoptopenjdk/openjdk11-openj9 sh /opt/java/rocketmq-all-5.1.1-bin-release/bin/mqnamesrv -n localhost:9876 --enable-proxy

docker logs -f mqbroker
#####查看ip
docker inspect nameserver