Docker部署Oracle数据库
在Docker中部署Oracle数据库，可以快速搭建不同版本（如19c、21c、23c）的测试或开发环境，避免繁琐的本地安装过程，并支持数据持久化与端口映射。

部署步骤（以Oracle 19c为例）

## 1. 创建数据目录并设置权限

mkdir -p /mydata/oracle19c/oradata
chmod 777 /mydata/oracle19c
## 2. 拉取镜像

docker pull registry.cn-hangzhou.aliyuncs.com/zhuyijun/oracle:19c
## 3. 启动容器

docker run -itd --name oracle19c \
--privileged=true \
--restart=always \
-p 1521:1521 \
-p 5500:5500 \
-e ORACLE_SID=orcl \
-e ORACLE_PDB=orclPDB1 \
-e ORACLE_PWD=123456 \
-e ORACLE_EDITION=standard \
-e ORACLE_CHARACTERSET=UTF8 \
-e TZ=Asia/Shanghai \
-v /mydata/oracle19c/oradata:/opt/oracle/oradata \
registry.cn-hangzhou.aliyuncs.com/zhuyijun/oracle:19c
## 4. 进入容器并配置数据库

docker exec -it oracle19c /bin/bash
sqlplus / as sysdba
ALTER USER system IDENTIFIED BY system;
ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;
验证与管理

验证监听状态

lsnrctl status
查看PDB列表

SHOW PDBS;
创建用户与表空间

CREATE TABLESPACE testdb DATAFILE '/opt/oracle/oradata/ORCL/testdb.dbf' SIZE 500M AUTOEXTEND ON;
CREATE USER test IDENTIFIED BY test123 DEFAULT TABLESPACE testdb;
GRANT DBA TO test;