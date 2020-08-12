docker run --privileged=true -d --name zookeeper --publish 2181:2181  -d zookeeper:latest

docker run -d -p 2181:2181 --name some-zookeeper --restart always zookeeper