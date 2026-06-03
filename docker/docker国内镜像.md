tee /etc/docker/daemon.json <<-'EOF'
{
    "registry-mirrors": 
    [
        "https://mirror.ccs.tencentyun.com",
        "https://9rl160ta.mirror.aliyuncs.com",
        "https://docker.1ms.run",
        "https://docker.xuanyuan.me",
        "https://hub-mirror.c.163.com",
        "https://ustc-edu-cn.mirror.aliyuncs.com",
        "https://ghcr.io",
        "https://mirror.baidubce.com"
    ]
}
EOF

systemctl restart docker
重启生效


2026-0603更新
https://docker.m.daocloud.io
https://docker.1ms.run