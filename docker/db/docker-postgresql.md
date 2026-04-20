docker run --name pg -e POSTGRES_PASSWORD=12345678 -p 5432:5432 -d postgres

docker update --restart=always pg 

##  postgres:16
docker run --name pg16 -e POSTGRES_PASSWORD=12345678 -p 5432:5432 -d postgres:16
docker run --restart=always --privileged=true --name pg16 -e POSTGRES_PASSWORD=12345678 -p 5432:5432 -d postgres:16
docker run --restart=always --privileged=true --name pg18 -e POSTGRES_PASSWORD=12345678 -p 5432:5432 -d postgres:18
### 映射磁盘安装方法
docker run -v /mnt/docker/pg16/data:/data --restart=always --privileged=true --name pg16 -e POSTGRES_PASSWORD=db12345678 -p 5432:5432 -d postgres:16

### 设置开启启动
docker update --restart=always pg16 

### 报错
initdb: error: program "postgres" is needed by initdb but was not found in the same directory as "/usr/lib/postgresql/16/bin/initdb"

加上 " --privileged=true" 可以解决