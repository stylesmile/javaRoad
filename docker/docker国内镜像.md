tee /etc/docker/daemon.json <<-'EOF'
{
"registry-mirrors": ["https://9rl160ta.mirror.aliyuncs.com"]
}
EOF

systemctl restart docker
重启生效