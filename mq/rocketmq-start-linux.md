##配置环境
vim /etc/profile
增加
export ROCKETMQ_HOME=/root/java/rocketmq-all-4.7.1-bin-release
export NAMESRV_ADDR=localhost:9876

###使配置生效
source /etc/profile


##启动 nameServer注册中心
sh bin/mqnamesrv
###后台启动
nohup sh bin/mqnamesrv &
###查看日志
tail -f ~/logs/rocketmqlogs/namesrv.log



##启动 broker
nohup sh bin/mqbroker -n localhost:9876 &
###查看日志
tail -f ~/logs/rocketmqlogs/broker.log 
###停止
sh bin/mqshutdown namesrv
sh bin/mqshutdown broker
###公网启动
在conf/broker.conf 中 加入 两行配置
namesrvAddr = 你的公网IP:9876
brokerIP1=你的公网IP
nohup sh mqbroker -n localhost:9876 -c ../conf/broker.conf autoCreateTopicEnable=true &
nohup sh bin/mqbroker -n localhost:9876 -c conf/broker.conf &

##创建topic
bin/mqadmin updatetopic -n localhost:9876 -c DefaultCluster -t test_topic

##查看topic
bin/mqadmin topicList -n localhost:9876 -c DefaultCluster


