3.4 设置时区
进入容器后，我们可以通过以下命令设置时区：

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
echo "Asia/Shanghai" > /etc/timezone
1.
2.
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime：将 /usr/share/zoneinfo/Asia/Shanghai 软链接到 /etc/localtime，实现时区的修改
echo "Asia/Shanghai" > /etc/timezone：将时区设置为 Asia/Shanghai
