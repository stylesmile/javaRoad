docker清理未使用空间

若要删除未使用的volume，可以使用内置程序
#列出未使用的volume
```
docker volume ls -qf dangling=true
```

#删除未使用的volume
```
docker volume rm $(docker volume ls -qf dangling=true)
```

删除所有未使用数据
```
docker system prune 
```
比如想删除未使用的image，container，volume，network查看官方文档https://docs.docker.com/config/pruning/#prune-networks