PMM
## 官网
```
https://docs.percona.com/percona-monitoring-and-management
```

```
docker run --detach --restart always \
--publish 443:7443 \
--env PMM_METRICS_RESOLUTION=5s \
--volume pmm-data:/srv \
--name pmm-server \
percona/pmm-server:3
```

docker run --detach --restart always --publish 7443:8443  --env PMM_METRICS_RESOLUTION=5s --volume pmm-data:/srv --name pmm-server percona/pmm-server:3

### 默认账号密码
admin/admin

### 查看日志
docker logs --tail=100 -f pmm-server


### 安装pmm客户端
```
wget https://repo.percona.com/apt/percona-release_latest.generic_all.deb

dpkg -i percona-release_latest.generic_all.deb

启用PMM客户端仓库：

percona-release enable pmm3-client release

安装PMM客户端包：

apt update
apt install -y pmm-client

配置服务
pmm-admin config --server-insecure-tls --server-url=https://admin:admin123@114.55.134.67:7443
```

###  要将运行在 Docker 容器中的 MySQL 接入 PMM 进行监控，主要分为两个核心步骤：在容器内创建专用的监控账号，以及通过 PMM 客户端将其添加为监控服务。
以下是具体的操作指南：
第一步：在 MySQL 容器中创建监控账号
首先，需要进入你的 MySQL Docker 容器，并创建一个专门用于 PMM 监控的数据库用户。根据你使用的 MySQL 版本，执行以下 SQL 语句：

### 对于 MySQL 8.0：
```
CREATE USER 'pmm'@'%' IDENTIFIED BY '<你的密码>' WITH MAX_USER_CONNECTIONS 10;
GRANT SELECT, PROCESS, REPLICATION CLIENT, RELOAD, BACKUP_ADMIN ON *.* TO 'pmm'@'%';
FLUSH PRIVILEGES;
```

### 对于 MySQL 5.7：
```
CREATE USER 'pmm'@'%' IDENTIFIED BY '<你的密码>' WITH MAX_USER_CONNECTIONS 10;
GRANT SELECT, PROCESS, REPLICATION CLIENT, RELOAD, SUPER ON *.* TO 'pmm'@'%';
FLUSH PRIVILEGES;
```

### 将 Docker 中的 MySQL 添加到 PMM
在安装了 PMM Client 的宿主机上，使用 pmm-admin add mysql 命令将容器内的 MySQL 实例添加进去。
1. 基础添加命令
   你需要指定宿主机 IP（或 127.0.0.1）、容器映射到宿主机的端口（例如 3307），以及刚才创建的账号密码。

```bash
pmm-admin add mysql \
--username=pmm \
--password='<你的密码>' \
--host=127.0.0.1 \
--port=3307 \
--service-name=my-docker-mysql
```

### 2. 指定 SQL 分析数据源（推荐）
   为了能够捕获慢 SQL 并记录具体执行时间点，建议加上 --query-source=perfschema 参数（要求 MySQL 5.6.9 及以上版本）。
```bash
pmm-admin add mysql \
--username=pmm \
--password='<你的密码>' \
--host=127.0.0.1 \
--port=3307 \
--query-source=perfschema \
--service-name=my-docker-mysql
```


###  第三步：验证监控状态
添加完成后，你可以运行以下命令来检查该服务是否成功接入且正在运行：


pmm-admin list
在输出结果中，确认 my-docker-mysql 对应的 mysqld_exporter 状态为 Running 即可。随后，你就可以登录 PMM 的 Web 界面查看该数据库的监控数据了。
MySQL 容器映射到宿主机的端口是多少？我帮你把命令里的端口号填好。
