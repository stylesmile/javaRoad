PMM
## 官网
```
https://docs.percona.com/percona-monitoring-and-management
```

```
docker run --detach --restart always \
--publish 443:7443 \
--env PMM_DATA_RETENTION=14d \
--env PMM_METRICS_RESOLUTION=5s \
--volume pmm-data:/srv \
--name pmm-server \
percona/pmm-server:3
```

docker run --detach --restart always --publish 7443:8443  --env PMM_METRICS_RESOLUTION=5s --volume pmm-data:/srv --name pmm-server percona/pmm-server:3

默认账号密码
admin/admin

docker logs --tail=100 -f pmm-server