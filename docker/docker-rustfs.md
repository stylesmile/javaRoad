## docker 安装 rustfs
```docker
docker run -d \
--name rustfs_container \
-p 9000:9000 \
-p 9001:9001 \
-v /mnt/rustfs/data:/data \
-e RUSTFS_ACCESS_KEY=rustfsadmin \
-e RUSTFS_SECRET_KEY=rustfsadmin \
-e RUSTFS_CONSOLE_ENABLE=true \
-e RUSTFS_SERVER_DOMAINS=example.com \
rustfs/rustfs:latest \
--address :9000 \
--console-enable \
--server-domains example.com \
--access-key rustfsadmin \
--secret-key rustfsadmin \
/data
```