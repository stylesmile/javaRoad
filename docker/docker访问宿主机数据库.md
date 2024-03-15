获取到宿主机的ip
docker inspect <container-id-or-name> | grep Gateway
"Gateway": "",
"IPv6Gateway": "",
"Gateway": "172.18.0.1",
"IPv6Gateway": "",

对于docker应用程序内部，MySQL的指向宿主机的172.18.0.1:3306
