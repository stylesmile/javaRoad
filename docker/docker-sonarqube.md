docker run --name sonarqube -d -v /root/mongo-back:/root/mongo-back -p 9009:9000 sonarqube
docker run --name sonarqube -d -p 9009:9000 sonarqube
docker run -d --name sonarqube3 -p 9020:9000 sonarqube

docker update --restart=always sonarqube 

