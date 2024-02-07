在conf/broker.conf 中 加入 两行配置
namesrvAddr = 172.31.164.94:9876
brokerIP1=你的公网IP
### 镜像官方地址
```url
https://hub.docker.com/_/ibm-semeru-runtimes/tags
```

docker pull ibm-semeru-runtimes:open-8u392-b08-jdk-jammy
## nameserver
docker run -d -p 9876:9876 --restart=always -v /data/docker/rocketmq-all-5.1.4-bin-release:/mq --name nameserver ibm-semeru-runtimes:open-8u392-b08-jdk-jammy  sh /mq/bin/mqnamesrv
docker logs -f nameserver



如需修改内存
runserver.sh文件中的 xmx xms设置
## broker
docker run -d -p 10909:10909 -p 10910:10910 -p 10911:10911 --restart=always -v /data/docker/rocketmq-all-5.1.4-bin-release:/mq --name mqbroker ibm-semeru-runtimes:open-8u392-b08-jdk-jammy  sh /mq/bin/mqbroker -n 172.31.164.94:9876 --enable-proxy
如需修改内存
runbroker.sh文件中的 xmx xms设置

docker logs -f mqbroker
#####查看ip
docker inspect nameserver


## rocketmq-console
拉取 命令:

docker pull styletang/rocketmq-console-ng

后台启动 命令:

docker run -d --restart=always -e "JAVA_OPTS=-Drocketmq.config.namesrvAddr=172.16.4.240:9876 -Drocketmq.config.isVIPChannel=false" -p 8181:8080 -t styletang/rocketmq-console-ng --name rocketmq-console

说明: namesrvAddr 是你nameServer的地址k,,k./543


## 错误排查
使用ibm-semeru-runtimes:open-8u392-b08-jre-jammy 会提示找不到JAVA_HOME
如果发生其他错误
使用docker logs 容器名称 排查
docker logs nameserver
docker logs mqbroker
