es6
```agsl

```
docker run -d -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" -e "cluster.name=elasticsearch" -e "node.name=elasticsearch" docker.elastic.co/elasticsearch/elasticsearch:6.6.1

## es7
```
## 1、拉去镜像
docker pull docker.io/elasticsearch:7.1.1
## 2、查看镜像
docker images
## 3、运行容器启动 Elasticsearch
docker run -d --name es -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" b0e9f9f047e6
3.1、参数解释：
-d：后台启动
--name：容器名称
-p：端口映射
-e：设置环境变量
discovery.type=single-node：单机运行
b0e9f9f047e6：镜像id
如果启动不了，可以加大内存设置：-e ES_JAVA_OPTS="-Xms512m -Xmx512m"
3.2、使用 docker ps 命令查看容器状态

## 4、开机启动 
docker update es --restart=always
```

## es 8
官网文档地址
https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html
```dock
docker run --name es01 --net elastic -p 9200:9200 -it -m 1GB docker.elastic.co/elasticsearch/elasticsearch:8.12.2
```

docker update es01 --restart=always