docker pull idoop/zentao

docker run -d -p 83:80 -p 3309:3306 -e USER="root" -e PASSWD="password" -e BIND_ADDRESS="false" -e SMTP_HOST="163.177.90.125 smtp.exmail.qq.com" -v /data/zbox/:/opt/zbox/ --name zentao-server idoop/zentao:latest

禅道默认用户密码为admin-123456
39.97.250.105修改为Chenye15002770045
