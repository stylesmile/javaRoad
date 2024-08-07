docker run -d --restart=always -p 27018:27017 --name mongo7  mongo:7 
docker run -d -p 27017:27017 --name mongo7  mongo:7

docker update --restart=always mongo7 