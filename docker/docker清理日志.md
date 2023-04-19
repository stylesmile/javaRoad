docker 清理日志
```
#!/bin/sh
echo "======== start clean docker containers logs ========"

logs=$(find /var/lib/docker/containers/ -name *-json.log)

for log in $logs
        do
                echo "clean logs : $log"
                cat /dev/null > $log
        done

echo "======== end clean docker containers logs ========"

# chmod +x clean_docker_log.sh

# ./clean_docker_log.sh

```