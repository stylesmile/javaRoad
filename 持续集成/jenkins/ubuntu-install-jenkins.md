#在Ubuntu上安装Jenkins
#https://wiki.jenkins-ci.org/display/JENKINS/Installing+Jenkins+on+Ubuntu
先决条件
安装Java SDK

sudo apt-get install openjdk-8-jdk

#第1步 - 安装Jenkins
包含在默认Ubuntu软件包中的Jenkins版本往往落后于项目本身的最新版本。 为了利用最新的修复和功能，我们将使用项目维护的软件包来安装Jenkins。

首先，我们将存储库密钥添加到系统。

wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
添加密钥后，系统将返回OK 。 接下来，我们将Debian包存储库地址附加到服务器的sources.list ：

echo deb http://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
当这两个都到位时，我们将运行update ，以便apt-get将使用新的存储库：

sudo apt-get update
sudo apt-get install jenkins
指定早期版本可以安装

sudo apt-get install jenkins=2.138.1
如果太慢的话　可以去官网下载后　再安装

 

#第2步 - 开始Jenkins
使用systemctl我们将启动Jenkins：

sudo systemctl start jenkins
#我们将使用其status命令来验证它是否成功启动
sudo systemctl status jenkins
#第3步 - 开机启动
sudo systemctl enable jenkins
