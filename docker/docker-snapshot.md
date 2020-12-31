#创建 备份快照
```
docker export mariadb10 > mariadb-snapshot-2020-1231-0958.tar
```

#还原快照
```
cat mariadb-snapshot-2020-1231-0958.tar |docker import - mariadb:10
docker export mariadb10 > mariadb-snapshot-2020-1231-0958.tar
```
