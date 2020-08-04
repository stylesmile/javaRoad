##进入容器
docker exec -it gitlab bash

##停止
sudo gitlab-ctl stop

##修改/etc/gitlab/gitlab.rb中的如下一行：
vi /etc/gitlab/gitlab.rb

##修改/etc/gitlab/gitlab.rb中的如下一行：
external_url ‘http://gitlab.xxxxx.cn’
gitlab_rails['gitlab_ssh_host'] = 'gitlab.futve.com'

##执行更新配置操作
sudo gitlab-ctl reconfigure
sudo gitlab-ctl start

##退出容器
exit