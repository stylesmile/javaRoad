#jenkins docker 启动
docker run -d --name jenkins -p 8880:8080 -v /root/java/jenkins_docker:/jenkins_docker jenkins/jenkins:lts
#时区 加        -v /usr/share/zoneinfo/Asia/Shanghai:/etc/localtime
先 cat /usr/share/zoneinfo/Asia/Shanghai 查看
docker pull jenkins/jenkins:lts
docker run -d --name jenkins -p 8880:8080 -v /root/java/jenkins_docker:/jenkins_docker -v /usr/share/zoneinfo/Asia/Shanghai:/etc/timezone -v /usr/share/zoneinfo/Asia/Shanghai:/etc/localtime jenkins/jenkins:lts
docker run -d --name jenkins3 -p 8881:8080 -v /root/java/jenkins_docker3:/jenkins_docker -v /usr/share/zoneinfo/Asia/Shanghai:/etc/timezone -v /usr/share/zoneinfo/Asia/Shanghai:/etc/localtime jenkins/jenkins:lts
#守护进程
docker update --restart=on-failure:3 jenkins


docker run -it -p 80:8080 -v /外部Docker目录:/var/jenkins_home -v /外部DocketWar文件目录/jenkins.war:/usr/share/jenkins/jenkins.war jenkins

jenkins插件清华大学镜像地址
https://mirrors.tuna.tsinghua.edu.cn/jenkins/updates/update-center.json
http://mirror.xmission.com/

https://updates.jenkins-zh.cn/update-center.json
https://www.oschina.net/news/111266/jenkins-plugin-mirror
https://mirrors.tuna.tsinghua.edu.cn/jenkins/plugins/
#码云镜像
https://jenkins-zh.gitee.io/update-center-mirror/tsinghua/update-center.json

#默认
https://updates.jenkins.io/update-center.json

#jenkins密码
docker exec -it jenkins bash
cat /var/jenkins_home/secrets/initialAdminPassword
f41b167b420a478a9c2cf1a9e7111627


需要的插件
Folders Plugin
Folders Plugin OWASP Markup 
Formatter 
Build Timeout 
Credentials Binding 
Timestamper 
Workspace Cleanup 
Ant 
Gradle 
Pipeline GitHub Branch Source 
Pipeline: GitHub Groovy Libraries 
Pipeline: Stage View 
Git 
Subversion 
SSH Build Agents 
Matrix Authorization Strategy 
PAM Authentication 
LDAP 
Email Extension 
Mailer 
Localization: Chinese (Simplified)