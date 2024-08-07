### 加入 MongoDB 官方 repository
```
echo '[mongodb-org-4.4]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.4/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.4.asc'| tee /etc/yum.repos.d/mongodb-org-4.4.repo
```


### 安装
yum install mongodb-database-tools

### 备份
```mongodb
mongodump -h dds-j6c7ddc18f34e2041.mongodb.rds.aliyuncs.com:3717 -d dapp_winc --username "dapp_winc" --password "dapp_winc11" --out /root/mongo-back/2020-0722-0703-pro

mongodump -h dds-j6c7ddc18f34e2041.mongodb.rds.aliyuncs.com:3717 -d dapp_winc --username "dapp_winc" --password "dapp_winc11"  --gzip --archive=/root/mongo-back/2020-0724-1953tasks.archive

```
### 还原
```mongodb

mongorestore -h {host}:27017 -u {user} -p {user_password} -d {db_name} --drop --gzip --archive={back_path}.archive


#prod
mongorestore -h dds-j6c7ddc18f34e2041.mongodb.rds.aliyuncs.com:3717 -d dapp_winc --username "root" --password "admin123456!!" /root/mongo-back/2020-0722-0703-pro/tasks

#test
mongorestore -h 127.0.0.1:28016 -d dapp_winc_test --gzip --archive="/root/mongo-back/prod2024-08-01--00_19_02-dapp_winc.archive"
mongorestore -h 127.0.0.1:28016 -d dapp_winc_test --gzip --archive="/root/mongo-back/prod2024-08-01--00_19_02-dapp_winc.archive" --nsInclude=myns.mycollection

mongorestore --uri mongodb://127.0.0.1:28019/dapp_winc_test --gzip --drop --preserveUUID --archive="/root/mongo-back/prod2024-08-01--00_19_02-dapp_winc.archive" --nsInclude=myns.mycollection
mongorestore --uri mongodb://127.0.0.1:28016/dapp_winc --gzip --drop --archive="/root/mongo-back/prod2024-08-01--00_19_02-dapp_winc.archive" --nsInclude=myns.mycollection


```
