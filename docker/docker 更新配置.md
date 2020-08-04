
docker容器设置自动启动
启动时加 --restart=always
docker run -tid --name isaler_v0.0.11 -p 8081:8080 --restart=always -v /alidata/iDocker/run/projectImages/isaler/v0.0.11/log:/usr/local/tomcat/logs isaler_v0.0.11


Flag	Description
no		不自动重启容器. (默认value)
on-failure 	容器发生error而退出(容器退出状态不为0)重启容器
unless-stopped 	在容器已经stop掉或Docker stoped/restarted的时候才重启容器
always 	在容器已经stop掉或Docker stoped/restarted的时候才重启容器
如果已经过运行的项目
如果已经启动的项目，则使用update更新：
docker update --restart=always isaler_v0.0.11

--restart=on-failure:3 重试三次