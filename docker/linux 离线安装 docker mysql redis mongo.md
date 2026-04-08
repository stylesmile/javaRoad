Ubuntu 离线安装 docker
1、下载离线包，网址：https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/

     离线安装docker需要下载3个包，containerd.io ，docker-ce-cli，docker-ce

2、下载完毕后拷贝到ubuntu上用 dpkg 命令安装，先安装 containerd.io 跟 docker-ce-cli，最后安装docker-ce，命令

sudo dpkg -i xxxx.deb


1、找到你想移动的 Docker 容器的 ID。

docker ps -a



我将使用 3a09b2588478 这个 ID 作为示例演示。

2、提交你的变更，并且把容器保存成镜像，命名为 mynewimage。

$ docker commit 3a09b2588478 mynewimage
4d2eab1c0b9a13c83abd72b38e5d4b4315de3c9967165f78a7b817ca99bf191e



3、把 mynewimage 镜像保存成 tar 文件

$ docker save mynewimage > /tmp/mynewimage.tar
or
$ docker save mynewimage -o /tmp/mynewimage.tar
$ docker save mongo:8 -o /tmp/mongo8.tar
$ docker save redis:8 -o /tmp/redis8.tar




4、把 mynewimage.tar 拷贝到新的 Docker 实例中

 使用任何工作在你环境中的方法，比如 FTP、SCP 等等，在你的新的 Docker 实例中运行 docker load命令，并且指定 tar 镜像文件的位置。

$ docker load < /tmp/mynewimage.tar



5、最后，运行 docker images 命令检查镜像现在是否可用。

docker images



Docker 通过 load 加载新的镜像后 repository 和 tag 名称都为 none 的解决方法


docker tag bfb29f4f9f35 web-test:1.0
