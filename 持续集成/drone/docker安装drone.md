### docker安装drone.md
```
sudo docker run \
--volume=/var/lib/drone:/data \
--env=DRONE_GITHUB_CLIENT_ID=your-id \
--env=DRONE_GITHUB_CLIENT_SECRET=super-duper-secret \
--env=DRONE_RPC_SECRET=super-duper-secret \
--env=DRONE_SERVER_HOST=drone.company.com \
--env=DRONE_SERVER_PROTO=https \
--publish=5080:80 \
--publish=5443:443 \
--restart=always \
--detach=true \
--name=drone \
drone/drone:2
```

sudo docker update --restart=always drone 