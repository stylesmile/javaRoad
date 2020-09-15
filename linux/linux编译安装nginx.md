1下载

http://nginx.org/en/download.html
2.解压

tar zxvf nginx-1.19.2.tar.gz

3.进入文件夹

cd nginx-1.19.2

4.配置

./configure --prefix=/usr/local/nginx

正常的编译安装/卸载
源码的安装一般由3个步骤组成：
 
配置(configure)
编译(make)
安装(make install)
 
configure文件是一个可执行的脚本文件，它有很多选项，在待安装的源码目录下使用命令./configure –help可以输出详细的选项列表。
其中--prefix选项是配置安装目录，如果不配置该选项，安装后可执行文件默认放在/usr /local/bin，库文件默认放在/usr/local/lib，配置文件默认放在/usr/local/etc，其它的资源文件放在/usr /local/share，比较凌乱。
如果配置了--prefix，如：
$ ./configure --prefix=/usr/local/test
 
安装后的所有资源文件都会被放在/usr/local/test目录中，不会分散到其他目录。
使用--prefix选项的另一个好处是方便卸载软件或移植软件
当某个安装的软件不再需要时，只须简单的删除该安装目录，就可以把软件卸载干净；
移植软件只需拷贝整个目录到另外一个机器即可（相同的操作系统下）
当然要卸载程序，也可以在原来的make目录下用一次make uninstall，但前提是Makefile文件有uninstall命令。
 
make install PREFIX=path
这里PREFIX必须大写，其实绝大部分情况下 make install 都不能再指定 PREFIX 了，因为大部分程序都会 configure 时得到的 prefix 写入 config.h，然后在编译时编译到可执行文件内部，以便在执行时读取资源文件等。
 
这样在编译完毕后，就不能再修改 prefix 了。只有运行时不需要资源文件的小工具，才可能在安装的时候随意选择 PREFIX，或者具有 loader 的大程序，在执行时通过 loader 传入路径……
 
关于卸载
如果没有配置--prefix选项，源码包也没有提供make uninstall，则可以通过以下方式可以完整卸载：
 
一个临时目录重新安装一遍，如：
$ ./configure --prefix=/tmp/to_remove && make install
然后遍历/tmp/to_remove的文件，删除对应安装位置的文件即可（因为/tmp/to_remove里的目录结构就是没有配置--prefix选项时的目录结构）。
5.编译安装

make && make install

6.验证是否安装成功

/usr/local/nginx/sbin/nginx -V

nginx version: nginx/1.19.2
built by gcc 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.12) 
configure arguments: --prefix=/usr/local/nginx
7.配置nginx 服务

vi /usr/lib/systemd/system/nginx.service
添加如下：
 
[Unit]
 
Description=nginx - high performance web server
 
Documentation=http://nginx.org/en/docs/
 
After=network.target remote-fs.target nss-lookup.target
 
[Service]
 
Type=forking
 
PIDFile=/usr/local/nginx/logs/nginx.pid
 
ExecStartPre=/usr/local/nginx/sbin/nginx -t -c /usr/local/nginx/conf/nginx.confExecStart=/usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf
 
ExecReload=/bin/kill -s HUP $MAINPID
 
ExecStop=/bin/kill -s QUIT $MAINPID
 
PrivateTmp=true [Install]WantedBy=multi-user.target
执行：

/usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf

启动nginx：

systemctl start nginx

设置开机启动：

systemctl enable nginx

 

cd /usr/local/nginx
pwd
ls
 
 
启动Nginx
 
/usr/local/nginx/sbin/nginx
查看Nginx进程是否启动
 
ps aux | grep nginx
 
 
查看Nginx占用的端口号
 
netstat -tlnp
 
 
使用本地主机访问虚拟机上的Nginx服务器
 
停止nginx
停止Nginx的三种方式
 
# 1. 立即停止Nginx服务
/usr/local/nginx/sbin/nginx -s stop
 
# 2.完成当前任务后停止
/usr/local/nginx/sbin/nginx -s quit
 
# 3.杀死Nginx进程
killall nginx
把nginx命令添加到环境变量
使用软连接将nginx链接到/usr/local/sbin
 
ln -s /usr/local/nginx/sbin/nginx /usr/local/sbin
ll /usr/local/sbin/ | grep "nginx"
 
 
显示当前环境变量PATH
 
echo $PATH
编辑.bash_profile文件
 
vim ~/.bash_profile
在.bash_profile文件末尾加入以下内容
 
export PATH=$PATH:/usr/local/nginx/sbin
 
 
引用.bash_profile文件
 
source ~/.bash_profile
使用nginx命令
 
# 启动nginx
nginx
# 停止nginx
nginx -s quit
把nginx命令添加到系统服务
创建并编辑文件/root/service-nginx.sh
 
#!/bin/sh
#
# filename: service-nginx.sh
#
# nginx - this script starts and stops the nginx daemon
#
# chkconfig:   - 85 15
# description:  NGINX is an HTTP(S) server, HTTP(S) reverse \
#               proxy and IMAP/POP3 proxy server
# processname: nginx
# config:      /etc/nginx/nginx.conf
# config:      /etc/sysconfig/nginx
# pidfile:     /var/run/nginx.pid
 
# Source function library.
. /etc/rc.d/init.d/functions
 
# Source networking configuration.
. /etc/sysconfig/network
 
# Check that networking is up.
[ "$NETWORKING" = "no" ] && exit 0
 
#nginx="/usr/sbin/nginx"
nginx="/usr/local/sbin/nginx"
prog=$(basename $nginx)
 
#NGINX_CONF_FILE="/etc/nginx/nginx.conf"
NGINX_CONF_FILE="/usr/local/nginx/conf/nginx.conf"
 
[ -f /etc/sysconfig/nginx ] && . /etc/sysconfig/nginx
 
lockfile=/var/lock/subsys/nginx
 
make_dirs() {
   # make required directories
   user=`$nginx -V 2>&1 | grep "configure arguments:.*--user=" | sed 's/[^*]*--user=\([^ ]*\).*/\1/g' -`
   if [ -n "$user" ]; then
      if [ -z "`grep $user /etc/passwd`" ]; then
         useradd -M -s /bin/nologin $user
      fi
      options=`$nginx -V 2>&1 | grep 'configure arguments:'`
      for opt in $options; do
          if [ `echo $opt | grep '.*-temp-path'` ]; then
              value=`echo $opt | cut -d "=" -f 2`
              if [ ! -d "$value" ]; then
                  # echo "creating" $value
                  mkdir -p $value && chown -R $user $value
              fi
          fi
       done
    fi
}
 
start() {
    [ -x $nginx ] || exit 5
    [ -f $NGINX_CONF_FILE ] || exit 6
    make_dirs
    echo -n $"Starting $prog: "
    daemon $nginx -c $NGINX_CONF_FILE
    retval=$?
    echo
    [ $retval -eq 0 ] && touch $lockfile
    return $retval
}
 
stop() {
    echo -n $"Stopping $prog: "
    killproc $prog -QUIT
    retval=$?
    echo
    [ $retval -eq 0 ] && rm -f $lockfile
    return $retval
}
 
restart() {
    configtest || return $?
    stop
    sleep 1
    start
}
 
reload() {
    configtest || return $?
    echo -n $"Reloading $prog: "
    killproc $nginx -HUP
    RETVAL=$?
    echo
}
 
force_reload() {
    restart
}
 
configtest() {
  $nginx -t -c $NGINX_CONF_FILE
}
 
rh_status() {
    status $prog
}
 
rh_status_q() {
    rh_status >/dev/null 2>&1
}
 
case "$1" in
    start)
        rh_status_q && exit 0
        $1
        ;;
    stop)
        rh_status_q || exit 0
        $1
        ;;
    restart|configtest)
        $1
        ;;
    reload)
        rh_status_q || exit 7
        $1
        ;;
    force-reload)
        force_reload
        ;;
    status)
        rh_status
        ;;
    condrestart|try-restart)
        rh_status_q || exit 0
            ;;
    *)
        echo $"Usage: $0 {start|stop|status|restart|condrestart|try-restart|reload|force-reload|configtest}"
        exit 2
esac
# END
用/root/service-nginx.sh替换/etc/init.d/nginx
 
mv /root/service-nginx.sh /etc/init.d/nginx
赋予可执行限权
 
chmod 755 /etc/init.d/nginx
执行
 
systemctl start nginx
源码方式安装nginx，自动化安装脚本
#!/bin/bash
 
# installation configuration
NGINX_VERSION=1.12.2
NGINX_SRC_PATH=/root
NGINX_BIN_PATH=/usr/local/nginx
 
# disable firewall
systemctl stop firewalld
setenforce 0
 
# installation dependence
yum install -y pcre-devel zlib-devel openssl-devel wget gcc
 
# download nginx source package
cd ${NGINX_SRC_PATH}
wget http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz
 
# unzip source package
tar -xzvf nginx-${NGINX_VERSION}.tar.gz
cd ./nginx-${NGINX_VERSION}
 
# install nginx
./configure --prefix=${NGINX_BIN_PATH} --with-http_ssl_module
make & make install
 
# start nginx service
cd ${NGINX_BIN_PATH}/sbin
./nginx
 
# END
 