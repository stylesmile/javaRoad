
```
sudo docker run -it \
    --name=goploy \
    --env=DB_HOST=172.31.22.126 \
    --env=DB_PORT=3305 \
    --env=DB_USER=root \
    --env=DB_USER_PASSWORD=fbc123456 \
    --env=DB_NAME=goploy \
    -v /home/ubuntu/.ssh:/root/.ssh \
    -v /etc/hosts:/etc/hosts \
    -v /home/ubuntu/docker/goploy/repository:/opt/goploy/repository \
    -p 3000:80 \
    zhenorzz/goploy
```

sudo docker update --restart=always goploy 