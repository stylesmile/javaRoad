### linux yum 下载docker安装包及依赖安装包，并离线安装

有时我们去无网环境部署服务器时，例如机房，需要离线安装很多软件，如gcc, lib,make等，这时就要提前在有网环境下下载离线安装包，有的软件只需要一个单独的deb包安装即可，如net-tools，而有的软件有很多的依赖包，如gcc，这时就需要一个简单的方法来批量下载所有依赖deb包，方法如下：


先在一台有网的电脑下载依赖

sudo yum install -y yum-utils


下载docker到当前目录

这步会把docker和docker需要的依赖一起下下来


yum -y install --downloadonly --downloaddir=./docker docker

安装rpm

rpm -Uvh --force --nodeps *.rpm

可以把当前目录的安装包，安装到其他服务器，就可以离线安装了，要保持服务器版本一致

apt 包管理器

1.查看依赖

apt-cache depends XXX

2.下载deb及其依赖包

apt-get download $(apt-cache depends --recurse --no-recommends --no-suggests --no-conflicts --no-breaks --no-replaces --no-enhances --no-pre-depends XXX | grep -v i386 | grep "^\w")

3.使用dpkg命令离线安装

sudo dpkg -i *.deb
