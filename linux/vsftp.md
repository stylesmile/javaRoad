linux 安装vsftpd

sudo apt update
sudo apt vsftpd

启动
sudo systemctl start vsftpd.service
停止
sudo systemctl start vsftpd.service
设置为开机启动的服务
sudo systemctl enable vsftpd.service


使用系统用户作为ftp用户不安全，
故使用虚拟用户

sudo yum install -y pam* db4*

