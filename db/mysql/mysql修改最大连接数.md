## 显示最大连接数
```mysql
show variables like '%max_connections%';

```

## 修改最大连接数量-临时修改
```
SET GLOBAL max_connections =  2000
```


## 永久修改（需重启服务）
   为了永久性地修改最大连接数，你需要编辑MySQL的配置文件并重启服务。

找到并编辑MySQL配置文件：

Linux系统：通常是 /etc/mysql/my.cnf、/etc/my.cnf 或 /etc/mysql/mysql.conf.d/mysqld.cnf。

Windows系统：通常是 C:\ProgramData\MySQL\MySQL Server X.X\my.ini（X.X代表你的MySQL版本号）。

在配置文件中找到 [mysqld] 部分（如果没有，可以手动创建），然后添加或修改 max_connections 参数：
```ini
[mysqld]
max_connections = 新的连接数值  # 例如 500
# 如果使用的是MySQL 8.0+且想限制X协议连接，还可以设置：
# mysqlx_max_connections = 新的连接数值
保存配置文件后，重启MySQL服务使更改生效：

Linux (使用Systemd)：

bash
sudo systemctl restart mysql   # 或 mysqld，具体服务名可能因安装方式而异
Windows：通过“服务”管理工具找到MySQL服务并重启，或在命令提示符（管理员身份）下运行：

cmd
net stop mysql
net start mysql

```
