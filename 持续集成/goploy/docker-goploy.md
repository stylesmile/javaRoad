
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


mkdir -p /tmp/aliyun/yunxiao-runner && wget http://agent-install-cn-beijing.oss-cn-beijing.aliyuncs.com/install_linux.sh -O /tmp/aliyun/yunxiao-runner/install.sh&& sudo sh /tmp/aliyun/yunxiao-runner/install.sh -v 'v0.1.4' -e 'http://agent-install-cn-beijing.oss-cn-beijing.aliyuncs.com' -t 'be-rjbraqbqdwoa4dquuwbtrvyd' -a '7BCracGa3CBL3yz9t50z' -w 'https://devops-build-new.aliyuncs.com' -s '5' -c '50' -r 'vIw0g7SO3nnCU3rl'