# set node master

MYSQL_PWD=${MYSQL_ROOT_PASSWORD} mysql -u root \
-e "CHANGE MASTER TO MASTER_HOST='mysql-master', \
MASTER_USER='${MYSQL_REPLICATION_USER}', \
MASTER_PASSWORD='${MYSQL_REPLICATION_PASSWORD}', \
MASTER_LOG_FILE='${LOG_FILE}', \
MASTER_LOG_POS=${LOG_POS};"

# start slave and show slave status

MYSQL_PWD=${MYSQL_ROOT_PASSWORD} mysql -u root -e "START SLAVE;show slave status\G"