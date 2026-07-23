# javaRoad

#### 介绍
Java学习之路，涵盖Java基础、高并发、高可用、分布式、微服务等知识体系，同时包含开发工具、数据库、容器化、CI/CD等实战内容。

---

## 📚 目录总览

### 🤖 AI 编程工具
- [从零安装 Claude Code](ai-coding/从零安装 Claude Code.md)
- [命令行安装 Claude Code 和 Codex 及升级](ai-coding/命令行安装Claude code 和 codex及升级.md)
- [DeepSeek 接入 Claude Code](ai-coding/deepseek接入 Claude Code.md)
- [Claude Code 切换](ai-coding/cc-switch.md)
- [分析项目](ai-coding/分析项目.md)
- [常用 Skill](ai-coding/skill/常用skill.md)

### 🧮 算法
- [10大排序算法](algorithm算法/10大排序算法.md)

### 📱 Android
- [Android 环境变量](android/android环境变量.md)
- [Gradle User Home](android/gradle_user_home.md)

### 💬 ChatGPT
- [3款好用的 IntelliJ IDEA ChatGPT 插件](chatgtp/3款好用的IntelliJ IDEA ChatGPT插件.md)

### 🗄️ 数据库

#### MongoDB
- [MongoDB Ubuntu 安装](db/mongo/mongodb-ubuntu安装.md)
- [Mongo 常用 SQL 命令](db/mongo/mongo常用sql命令.md)
- [Mongo 分组统计](db/mongo/mongo-分组统计.md)
- [Mongo 索引](db/mongo/mongo-索引.md)
- [MongoDB 备份还原](db/mongo/mongodb备份还原.md)
- [MongoDB 批量修改](db/mongo/mongodb批量修改.md)

#### MySQL
- [MySQL 修改最大连接数](db/mysql/mysql修改最大连接数.md)
- [MySQL 基于 Binlog 日志还原数据](db/mysql/mysql基于binlog日志还原数据.md)
- [MySQL Windows 备份](db/mysql/mysql-window备份.md)

#### Oracle
- [Oracle 创建用户](db/oracle/oracle%20创建用户.md)

#### PostgreSQL
- [序列 (ID 自增)](db/postgres/序列(id自增).md)

#### Redis
- [Redis Ubuntu 安装](db/redis/redis-ubuntu安装.md)
- [Redis 数据迁移](db/redis/redis数据迁移.md)

### 🐳 Docker

#### Docker 基础
- [Docker 基础](docker/docker.md)
- [Docker 清理空间](docker/docker清理空间.md)
- [Docker 清理日志](docker/docker清理日志.md)
- [Docker 国内镜像](docker/docker国内镜像.md)
- [Docker 查看镜像版本号](docker/docker查看镜像版本号.md)
- [Docker 容器中修改时区](docker/docker容器中修改时区.md)
- [Docker 中容器间通信](docker/docker中容器间通信.md)
- [Docker 限制资源内存 CPU](docker/docker限制资源内存cpu.md)
- [Docker 访问宿主机数据库](docker/docker访问宿主机数据库.md)
- [Docker 给运行中的容器设置端口映射的方法](docker/Docker%20给运行中的容器设置端口映射的方法.md)
- [Docker 更新配置](docker/docker%20更新配置.md)
- [Docker 部署 Jar](docker/docker部署jar.md)
- [Docker 给运行中的容器设置端口映射](docker/Docker%20给运行中的容器设置端口映射的方法.md)
- [Docker Snapshot](docker/docker-snapshot.md)
- [Linux 离线安装 Docker MySQL Redis Mongo](docker/linux%20离线安装%20docker%20mysql%20redis%20mongo.md)

#### Docker 数据库
- [Docker MongoDB](docker/db/docker-mongodb.md)
- [Docker MongoDB3](docker/db/docker-mongodb3.md)
- [Docker MongoDB 恢复备份](docker/db/docker-mongo-恢复备份.md)
- [Docker Oracle](docker/db/docker-oracle.md)
- [Docker PostgreSQL](docker/db/docker-postgresql.md)
- [Docker Redis](docker/db/docker-redis.md)
- [Docker Redis7](docker/db/docker-redis7.md)
- [Docker Redis8](docker/db/docker-redis8.md)
- [Docker MariaDB](docker/db/mysql/docker-mariadb.md)
- [Docker MySQL](docker/db/mysql/docker-mysql.md)
- [Docker KINGBASE](docker/db/docker-kingbase.md)
- [Docker Coturn](docker/db/docker-coturn.md)

##### MongoDB (详细)
- [MongoDB](docker/db/mongodb/docker-mongodb.md)
- [MongoDB3](docker/db/mongodb/docker-mongodb3.md)
- [Mongo 恢复备份](docker/db/mongodb/docker-mongo-恢复备份.md)
- [Mongo7](docker/db/mongodb/mongo7.md)
- [Mongo7 副本集](docker/db/mongodb/mongo7副本集.md)
- [Mongo8 副本集](docker/db/mongodb/mongo8副本集.md)
- [Docker 安装 Percona Server MongoDB7](docker/db/mongodb/docker安装percona-server-mongodb7.md)

#### Docker Compose
- [MySQL](docker/docker-compose/mysql/ReadMe.md)
- [MySQL 主从](docker/docker-compose/mysql主从/ReadMe.md)
- [MySQL 主从问题](docker/docker-compose/mysql主从/error.md)

#### Docker DevOps
- [Docker Jenkins](docker/jenkins/docker-jenkins.md)
- [Jenkins](docker/jenkins/Jenkins.md)
- [Jenkins 重置密码](docker/jenkins/jenkins重置密码.md)
- [Docker GitLab](docker/docker-gitlab.md)
- [GitLab 修改域名配置](docker/docker-gitlab修改域名配置.md)
- [GitLab 内存占用太多](docker/docker-gitlab内存占用太多.md)
- [Docker Gitea](docker/git/docker-gitea.md)

#### Docker 中间件
- [Docker RocketMQ](docker/mq/docker-rocketmq.md)
- [Docker RocketMQ 5.1.3](docker/mq/docker-rocketmq-5.1.3.md)
- [Docker RocketMQ 5.1.4](docker/mq/docker-rocketmq-5.1.4.md)
- [Docker Nacos](docker/注册中心/docker-nacos.md)
- [Docker Zookeeper](docker/注册中心/docker-zookeeper.md)
- [Docker MinIO](docker/minio/docker-minio.md)
- [Docker MinIO2](docker/minio/docker-minio2.md)
- [Docker Nexus](docker/nexus私服/docker-nexus.md)
- [Docker HBase](docker/docker-hbase.md)

#### Docker 其他
- [Docker SonarQube](docker/docker-sonarqube.md)
- [Docker Theia](docker/docker-theia.md)
- [Docker YApi](docker/docker-yapi.md)
- [Docker 禅道](docker/docker-禅道.md)
- [Docker Elasticsearch](docker/es/docker-elasticsearch.md)
- [Docker RustFS](docker/docker-rustfs.md)

### 🎯 Flutter
- [Flutter 环境](flutter/flutter环境.md)

### 💻 Go 语言
- [Go Goland 环境搭建](go/00.go%20goland%20环境搭建.md)
- [解决 Go 编译速度慢的问题](go/解决%20Go%20编译速度慢的问题%20.md)

### 🛠️ IDE
- [Eclipse 设置启动 JDK 版本](ide/eclipse/eclipse%20设置启动jdk版本.md)
- [IDEA 模板](ide/idea/idea模板.md)

### ☕ Java

#### Spring Boot
- [Spring Boot 高级用法 AOP 自定义注解实现日志](java/springboot高级用法/Spring%20Boot%20高级用法%20AOP%20自定义注解实现日志.md)

#### Java 架构
- [BOM 管理 Jar 版本](java架构/bom管理jar版本.md)

### 📄 JavaScript
- [Excel 处理](js/file/excel_deal.md)

### 🐧 Linux

#### 通用
- [Linux 编译安装 Nginx](linux/linux编译安装nginx.md)
- [Linux 下载依赖离线安装](linux/linux下载依赖离线安装.md)
- [Linux 生成 SSH 密钥](linux/ssh/linux生成ssh密钥.md)
- [启动停止 Java 服务](linux/start_java启动停止java服务.md)
- [定时任务 Crontab](linux/定时任务crontab.md)
- [VSFTP](linux/vsftp.md)

#### Ubuntu
- [dpkg 用法](linux/ubuntu/dpkg.md)
- [Ubuntu 修改时区](linux/ubuntu/ubuntu修改时区.md)
- [更新-修复漏洞](linux/ubuntu/更新-修复漏洞.md)
- [错误解决](linux/ubuntu/错误解决.md)

### 🍎 Mac 工具
- [Brew 国内镜像安装](mac工具/brew国内镜像安装.md)

### 📦 Maven
- [Maven 定制化打包后的包名 (加入时间戳)](maven/Maven定制化打包后的包名(加入时间戳).md)
- [Maven 打包包含 Lib 的 Jar](maven/maven打包包含lib的jar.md)
- [国内镜像仓库](maven/国内镜像仓库.md)

### 📨 消息队列
- [RocketMQ 怎么保证的消息不丢失](mq/RocketMQ%20怎么保证的消息不丢失.md)
- [RocketMQ 启动 Linux](mq/rocketmq-start-linux.md)

### 🌐 Nginx
- [Nginx HTTPS](nginx/https/nginx.md)
- [Nginx 负载均衡有 10 种方式](nginx/nginx%20负载均衡有10种方式.md)
- [Nginx Fair 自动转发到请求时间最短的服务器](nginx/nginx%20fair,自动把把请求转发到请求时间最短的服务器.md)
- [Nginx WebSocket](nginx/nginx_websocket.md)
- [Nginx MQTT](nginx/nignx_mqtt.md)
- [Nginx UI](nginx/nginx-ui/ReadMe.md)
- [Nginx WebUI](nginx/nginx-webui/ReadMe.md)
- [Nginx Proxy Manager](nginx/nginx_proxy_manger/nginx_proxy_manger.md)

### 🔧 工具
- [Alibaba 工具](tool/alibaba-tool.md)

### 🚀 持续集成 (CI/CD)

#### Jenkins
- [Jenkins 安装](持续集成/jenkins/jenkins安装.md)
- [Jenkins Docker 安装](持续集成/jenkins/jenkins-docker安装.md)
- [Ubuntu 安装 Jenkins](持续集成/jenkins/ubuntu-install-jenkins.md)
- [Jenkins 构建前端](持续集成/jenkins/build-front.md)
- [Jenkins Webhooks 配置](持续集成/jenkins/webhooks配置.md)
- [Shell 到达一定数量文件自动删除最久时间文件](持续集成/jenkins/shell%20到达一定数量文件自动删除最久时间文件.md)
- [Shell 以日期重命名](持续集成/jenkins/shell以日期重命名.md)
- [使用 Shell 脚本删除 30 天以前的文件](持续集成/jenkins/使用shell脚本删除30天以前的文件.md)
- [Jenkins 问题](持续集成/jenkins/jenkins问题/jenkins问题1.md)

#### Drone
- [Docker 安装 Drone](持续集成/drone/docker安装drone.md)

#### Gitea
- [Gitea](持续集成/gitea.md)

#### GoPLOY
- [Docker GoPLOY](持续集成/goploy/docker-goploy.md)

#### JPOM
- [Docker JPOM](持续集成/jpom/docker-jpom.md)

#### Git
- [Git SSH Key 生成步骤](持续集成/git/Git%20中%20SSH%20key%20生成步骤.md)
- [GitLab 令牌](持续集成/git/gitlab令牌.md)
- [GitLab 重置密码](持续集成/git/gitlab重置密码.md)
- [Git 分支命令](持续集成/git/git分支命令.md)
- [Git 记住密码](持续集成/git/git记住密码.md)

### 🔐 版本控制
- [Git 同时提交到 2 个仓库 Gitee GitHub](版本控制器/git/git同时提交到2个仓库gitee.github.md)

### 🔒 并发与锁
- [Synchronized 锁升级的过程](锁/Synchronized锁升级的过程.md)
- [乐观锁和悲观锁](锁/乐观锁和悲观锁.md)
- [多线程面基础](锁/多线程面基础.md)
- [锁的分类](锁/锁的分类.md)

### 🔍 问题排查
- [JAVA 线上故障排查完整套路 — 从 CPU、磁盘、内存、网络、GC 一条龙](问题排查/JAVA%20线上故障排查完整套路，从%20CPU、磁盘、内存、网络、GC%20一条龙.md)

### 📝 面试题
- [为什么 MySQL 索引要用 B+ 树而不是 B 树](面试题/mysql/为什么MySQL索引要用B+树，而不是B树.md)
- [Java 线程池的工作原理](面试题/多线程/Java线程池的工作原理.md)

### ⏰ 高效工作
- [时间管理](高效工作/时间管理.png)

### 📐 Gradle
- [Build 脚本示例](gradle/01build.gradle.kts)
- [Gradle Wrapper 配置](gradle/gradle-wrapper.properties)

---

## 🗂️ 按技术栈快速导航

| 分类 | 相关文档 |
|------|----------|
| **Java 基础** | BOM 管理、Spring Boot AOP、锁机制、线程池 |
| **数据库** | MySQL、MongoDB、Redis、Oracle、PostgreSQL |
| **Docker** | 基础操作、数据库容器化、中间件容器化、Compose |
| **Nginx** | 负载均衡、HTTPS、WebSocket、MQTT |
| **CI/CD** | Jenkins、Drone、Gitea、GoPLOY、JPOM |
| **消息队列** | RocketMQ |
| **Linux** | Ubuntu、SSH、定时任务、服务管理 |
| **开发工具** | IDEA、Eclipse、Maven、Gradle、Git |

---

## 📊 文档统计

- **总文档数**: 143 篇
- **涵盖技术**: AI 编程、算法、数据库、Docker、Nginx、CI/CD、Java 并发等
- **最后更新**: 2026-07-23

---

#### 软件架构
Java 技术栈全栈学习笔记

#### 安装教程
无

#### 使用说明
按目录浏览，或使用上方快速导航定位所需内容

#### 参与贡献
1. Fork 本仓库
2. 创建新分支 (Feat_xxx)
3. 提交代码
4. 创建 Pull Request

#### 特别鸣谢
感谢所有贡献者的支持

#### 关于
javaRoad — 一个 Java 开发者的学习之路
