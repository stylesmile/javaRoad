### docker安装mariadb

sudo docker run --privileged -d -p 3308:3306 --name mariadb --restart=always -e TIMEZONE=Asia/Shanghai -e MYSQL_ROOT_PASSWORD=db123456 -v /data/docker/mariadb:/var/lib/mysql mariadb --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci --character-set-client-handshake=FALSE
sudo docker run --privileged -d -p 3308:3306 --name mariadb --restart=always -e TIMEZONE=Asia/Shanghai -e MYSQL_ROOT_PASSWORD=db123456 mariadb --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci --character-set-client-handshake=FALSE
sudo docker run --privileged -d -p 3303:3306 --name mariadb --restart=always -e TIMEZONE=Asia/Shanghai -e MYSQL_ROOT_PASSWORD=db123456 mariadb --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci --character-set-client-handshake=FALSE

sudo docker update --restart=always mariadb 