本文主要介绍fair,自动把把请求转发到请求时间最短的服务器

Nginx的Fair负载均衡方式是基于ngx_http_upstream_module模块中的fair模块实现的。要使用Fair负载均衡方式，需要在Nginx中启用ngx_http_upstream_module模块，然后编译安装fair模块。

以下是安装fair模块的简单步骤：

1.下载Fair模块源代码:在 https://github.com/gnosek/nginx-upstream-fair/releases 下载最新版本的Fair模块源代码。

2.下载Nginx源代码:在 http://nginx.org/en/download.html 下载最新版本的Nginx源代码。

3.进入Nginx源代码目录:解压下载的Nginx源码并进入解压后的目录。

4.编译安装Fair模块:执行以下命令来编译并安装Nginx及Fair模块：

```
./configure --add-module=<path_to_fair_module> && make && make install
```

其中，<path_to_fair_module>为Fair模块源代码的路径。

安装完成后，就可以在Nginx配置文件中使用fair指令，并启用Fair负载均衡方式了。例如：

```
http {
    upstream backend {
        fair;
        server backend1.example.com;
        server backend2.example.com;
        server backend3.example.com;
    }

    server {
        listen 80;
        server_name example.com;

        location / {
            proxy_pass http://backend;
        }
    }
}
```

在这个示例配置中，upstream中使用了fair指令开启Fair负载均衡方式。fair指令默认情况下会使用第一个后端服务器作为起点，之后每个请求都会选取响应时间最短的后端服务器。当后端服务器的响应时间相同时，fair指令会轮流分配请求。