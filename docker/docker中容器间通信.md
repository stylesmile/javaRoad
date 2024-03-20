安装pg
docker run --restart=always --privileged=true --name pg16 -e POSTGRES_PASSWORD=db12345678 -p 15432:5432 -d postgres:16
安装mysql

docker run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=db123456! --name mysql8 -v /mnt/mysql8:/var/lib/mysql57 mysql:8 --character-set-server=utf8 --collation-server=utf8_unicode_ci --character-set-client-handshake=FALSE -e TZ=Asia/Shanghai
查看容器ip


docker inspect pg16
"Networks": {
"bridge": {
"IPAMConfig": null,
"Links": null,
"Aliases": null,
"MacAddress": "02:42:ac:11:00:03",
"NetworkID": "52fdcb4787be71dfac9695a1ffbf661ecf4990db234d2edf893ebfaeb3a46048",
"EndpointID": "55cf3ba61e4b86ae5d8c220db8d7ee99828d5d2ef7a6e432ffe927bceee9cfef",
"Gateway": "172.17.0.1",
"IPAddress": "172.17.0.3",
"IPPrefixLen": 16,
"IPv6Gateway": "",
"GlobalIPv6Address": "",
"GlobalIPv6PrefixLen": 0,
"DriverOpts": null,
"DNSNames": null
}
}
运行应用

sudo docker run --name rust --link pg16 -d -p 8000:3000 sboot:v0.0.7
