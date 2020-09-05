#进入控制台
gitlab-rails console production
#查找id为1的用户
u= User.where(id: 1).first 
#重置密码
u.password='123456789'
#保存生效
 u.save!
 
#查找用户
u = User.where(email: 'admin@example.com').first