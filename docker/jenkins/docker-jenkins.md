### 下载jenkins
https://mirrors.jenkins.io/war-stable/
### 下载docker镜像
docker pull ibm-semeru-runtimes:open-21.0.4.1_7-jdk-jammy
### 启动
sudo docker run -d -p 7088:7088 --restart=always -v /home/ubuntu/java/jenkins:/jenkins -e JAVA_OPTS="-Xmx128m -Xms1024m" --name jenkins2 ibm-semeru-runtimes:open-21.0.4.1_7-jdk-jammy  java -jar /jenkins/jenkins2.462.2.war --httpPort=7088
sudo docker run -d -p 7088:7088 --restart=always -v /home/ubuntu/java/jenkins:/jenkins --name jenkins2 ibm-semeru-runtimes:open-21.0.4.1_7-jdk-jammy  java -jar /jenkins/jenkins2.462.2.war --httpPort=7088
