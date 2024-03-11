进入容器：
docker exec -it mongo bash

官方推荐
备份
mongodump -d 数据库名称 --username "root" --password "xxxxxx" --out /home/dump/
mongodump -d tasks --out /root/mongo-back/2020-0318-2243
mongodump --out /root/mongo-back/2020-0318-2242 --gzip
mongodump -d tasks --gzip --archive=/root/mongo-back/2020-0318-2237tasks.archive
mongodump -h 192.168.0.37:27017 -d tasks --gzip --archive=/root/mongo-back/2020-0616-1953tasks.archive
mongodump -h 192.168.0.36:27015 -d tasks --username "tasks" --password "admin123456!"  --gzip --archive=/root/mongo-back/2020-0724-1953tasks.archive

mongodump -h 192.168.0.37:27017 -d tasks --username "tasks" --password "m6pCEPrTZI84Lvka" --out /root/mongo-back/2020-0511-1511-pro
mongodump -h 192.168.0.38:27018 -d tasks --username "tasks" --password "admin123456!" --out /root/mongo-back/2020-0512-1810-test8
mongodump -h 192.168.0.37:27017 -d tasks --username "tasks" --password "m6pCEPrTZI84Lvka" --out /root/mongo-back/2020-0526-1822-pro
mongodump -h 192.168.0.36:27015 -d tasks --username "tasks" --password "admin123456!" --out /root/mongo-back/2020-0722-0703-pro

mongodump -h localhost:27017 --username "root" --password "root123456!" --out /root/mongo-back/2020-0327-1551-test32
mongodump -h localhost:27017 --username "root" --password "root123456!" --out /root/mongo-back/2020-0327-1551-test32
#mongo32备份
mongodump -h localhost:27017 --out /root/mongo-back/2020-0327-1551-test32

mongorestore  -d 数据库名称 --username "root" --password "xxxxxx" /home/dump/ 
mongorestore -d tasks --drop --gzip --archive=/root/mongo-back/2020-0318-2237tasks.archive
mongorestore -d tasks --username "tasks" --password "admin123456!" /root/mongo-back/2020-0318-2242
mongorestore -d tasks --username "tasks" --password "admin123456!" /root/mongo-back/2020-0318-2242
mongorestore -h 127.0.0.1:27018 -d tasks --username "tasks" --password "admin123456!" /root/mongo-back/2020-0319-1416/tasks --drop
mongorestore -d tasks --username "tasks" --password "admin123456!" /root/mongo-back/2020-0319-1416/tasks --drop
mongorestore -d tasks --username "tasks" --password "admin123456!" /root/mongo-back/2020-0319-1416-pro
mongorestore -d tasks --username "tasks" --password "admin123456!" /root/mongo-back/2020-0319-1519-pro
mongorestore -d tasks --username "root" --password "root123456!" /root/mongo-back/2020-0318-2242 
mongorestore --username "root" --password "root123456!" /root/mongo-back/2020-0319-1519-pro
mongorestore --username "root" --password "root123456!" /root/mongo-back/2020-0320-2132-pro
mongorestore --username "root" --password "root123456!" /root/mongo-back/2020-0407-0956-pro

#mongo34还原 -- 该方式很吃内存，可用少于4g，容易卡死
mongorestore --username "root" --password "root123456!" /root/mongo-back/2020-0327-1551-test32
mongorestore -h 127.0.0.1:27017 /root/mongo-back/2020-0327-1551-test32
mongorestore -h 127.0.0.1:27016 -d data --username "data" --password "admin123456!" /root/mongo-back/2020-0327-1551-test32/data
mongorestore -h 127.0.0.1:27016 -d yapi --username "yapi" --password "admin123456!" /root/mongo-back/2020-0327-1551-test32/yapi
mongorestore -h 127.0.0.1:27016 -d tasks --username "tasks" --password "admin123456!" /root/mongo-back/2020-0327-1551-test32/tasks
mongorestore -h 127.0.0.1:27016 -d tasks --username "tasks" --password "admin123456!" /root/mongo-back/2020-0407-0956-pro/tasks
mongorestore -h 127.0.0.1:27016 -d tasks --username "tasks" --password "admin123456!" /root/mongo-back/2020-0409-0853-pro/tasks
mongorestore -h 127.0.0.1:27016 -d tasks --username "tasks" --password "admin123456!" /root/mongo-back/2020-0418-2020-pro/tasks
mongorestore -h 127.0.0.1:27018 -d tasks --username "tasks" --password "admin123456!" /root/mongo-back/2020-0507-1749-pro/tasks
mongorestore -h 127.0.0.1:27018 -d tasks --username "tasks" --password "admin123456!" /root/mongo-back/2020-0511-1511-pro/tasks
mongorestore -h 127.0.0.1:27016 -d tasks --username "tasks" --password "admin123456!" /root/mongo-back/2020-0512-1810-test8/tasks
mongorestore -h 127.0.0.1:27015 -d tasks --username "tasks" --password "admin123456!" /root/mongo-back/2020-0526-1822-pro/tasks
mongorestore -h 127.0.0.1:27015 -d tasks --username "tasks" --password "admin123456!" /root/mongo-back/2020-0526-1822-pro/tasks
mongorestore -h 127.0.0.1:27015 -d tasks --username "tasks" --password "admin123456!" /root/mongo-back/2020-0512-1810-test8/tasks
mongorestore -h 127.0.0.1:27015 -d tasks --username "tasks" --password "admin123456!" //root/mongo-back/2020-0527-test/tasks
mongorestore -h 127.0.0.1:27014 -d tasks --username "tasks" --password "admin123456!" /root/mongo-back/2020-0722-0703-pro/tasks





备份为archive
mongodump -d tasks --gzip --archive=/root/mongo-back/2020-0318-2237tasks.archive
恢复备份

mongorestore -h {host}:27017 -u {user} -p {user_password} -d {db_name} --drop --gzip --archive={back_path}.archive
-h 指定ip port
-u用户
-p 密码
--drop 删除
mongorestore -h 127.0.0.1:27017 -d tasks --drop --gzip --archive=/root/mongo-back/tasks.archive
mongorestore -h 127.0.0.1:27017 -d tasks --drop --gzip --archive=/root/mongo-back/2020-0318-2237tasks.archive

mongorestore -h 192.168.0.37:27017 -d tasks --drop --gzip --archive=/root/mongo-back/2020-0318-2237tasks.archive

mongorestore -h 127.0.0.1:27015 -d tasks --username "tasks" --password "admin123456!" --drop --gzip --archive=/root/mongo-back/2020-0527tasks.archive
mongorestore -h 192.168.0.36:27015 -d tasks --username "tasks" --password "admin123456!" --drop --gzip --archive=/root/mongo-back/2020-0616tasks.archive
mongorestore -h 192.168.0.36:27015 -d tasks --username "tasks" --password "admin123456!" --drop --gzip --archive=/root/mongo-back/2020-0616-1953tasks.archive

docker命令
docker run -v /rootmongo-back:/root/mongo-back -d -p 27018:27017 --name mongo  mongo

映射/root:/root/mongo-back