yum -y install nginx-mod-stream

```nginx
#在http外添加如下配置
stream {
    upstream rabbitmqtt {
        server 47.238.194.96:1883;
        #server 47.238.194.96:1883;
        #server 47.238.194.96:1883;
    }

    server {
        listen       1885 so_keepalive=on;
        proxy_connect_timeout 60s;
        proxy_timeout 60s;
        proxy_pass rabbitmqtt;
        tcp_nodelay on;
    }
}

```



# 低版本nginx 1，9之前需要这个
$ yum -y install nginx-mod-stream
$ vim /etc/nginx/nginx.conf      // 载入模块
load_module /usr/lib64/nginx/modules/ngx_stream_module.so;
worker_processes 4;
worker_rlimit_nofile 40000;