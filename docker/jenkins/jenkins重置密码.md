1、查看所有容器
1
docker ps
2、进入gitlab容器中
1
docker exec -it gitlab bash
回到顶部
 二、修改密码
官网也有相关的说法：https://docs.gitlab.com/ce/security/reset_root_password.html

1、要重置您的root密码，请首先使用root特权登录到服务器。使用以下命令启动Ruby on Rails控制台
gitlab-rails console -e production
2、等待控制台加载完毕，有多种找到用户的方法，您可以搜索电子邮件或用户名
user = User.where(id: 1).first
或者
user = User.find_by(email: 'admin@example.com')
 3、现在，您可以更改密码
user.password = 'secret_pass'
user.password = 'root1234567890'
user.password_confirmation = 'secret_pass'
user.password_confirmation = 'root1234567890'
4、重要的是，您必须同时更改密码和password_confirmation才能使其正常工作，别忘了保存更改
1
user.save!