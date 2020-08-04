docker run -d --name hbase001 -P harisekhon/hbase:1.3

或

docker run -d --name hbase001 -p 16010:16010 harisekhon/hbase:1.3

或

docker run -d -h myhbase -p 2181:2181 -p 8081:8080 -p 8085:8085 -p 9090:9090 -p 9095:9095 -p 16000:16000 -p 16010:16010 -p 16201:16201 -p 16301:16301 --name hbase1.3 harisekhon/hbase:1.3
docker run -d -h myhbase -p 2181:2181 -p 8081:8080 -p 8085:8085 -p 9090:9090 -p 9095:9095 -p 16000:16000 -p 16010:16010 -p 16201:16201 -p 16301:16301 --name hbase harisekhon/hbase

  -p : 指定主机的端口 16010映射到宿主机上(容器)的开放端口 16010
  -P ：主机随机分配端口与宿主机上的端口进行映射 

注意：hbase60010端口无法访问web页面，web端访问的接口变更为16010