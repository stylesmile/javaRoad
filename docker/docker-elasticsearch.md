docker run -d -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" -e "cluster.name=elasticsearch" -e "node.name=elasticsearch" docker.elastic.co/elasticsearch/elasticsearch:6.6.1
