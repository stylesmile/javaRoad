tee /etc/docker/daemon.json <<-'EOF'
{
"registry-mirrors": 
[
    "https://9rl160ta.mirror.aliyuncs.com",
    "https://docker.1ms.run",
    "https://mirror.ccs.tencentyun.com",
    "https://docker.xuanyuan.me"
]
}
EOF

systemctl restart docker
重启生效