问题描述
在 Jenkins 2.275 中，出现如下日志消息：

# tail -f /var/log/jenkins/jenkins.log
...
2021-03-01 11:13:06.565+0000 [id=15]    WARNING hudson.security.csrf.CrumbFilter#doFilter: No valid crumb was included in request for /ajaxBuildQueue by k4nz. Returning 403.
2021-03-01 11:13:10.571+0000 [id=11]    WARNING hudson.security.csrf.CrumbFilter#doFilter: Found invalid crumb a433bb1e4447c0afe7ca04cda88bfd3c0ebddf300f0b52399cf2c47559152b1c. If you are calling this URL with a script, please use the API Token instead. More information: https://jenkins.io/redirect/crumb-cannot-be-used-for-script
...
问题原因
在新版本中，CSRF Token 只能用于创建它们的会话。就是说 Session A 创建某个 CSRF Token，则该 CSRF Token 只能被 Session A 使用。这是为了限制攻击者获取到它们后的影响，即使攻击者拿到 CSRF Token，如果攻击者没有会话信息，依旧无法使用该 CSRF Token 请求。

以前的某些脚本，通过 /crumbIssuer/api 获取 CSRF Token，然后访问接口。现在，由于脚本是没有会话信息的，因此在执行受 CSRF 保护的动作时，会失败。

除非这些脚本能够携带会话信息，或者使用 API token 进行请求。

解决方案
Manage Jenkins / Configure Global Security，禁用 Prevent Cross Site Request Forgery exploits 选项。但是，由于我们 Jenkins 版本较新，没有找到该选项。

或者，如果文档 Upgrading to Jenkins LTS 2.176.x 建议，设置 hudson.security.csrf.DefaultCrumbIssuer.EXCLUDE_SESSION_ID 属性为 true，这是个系统属性，也是在关闭 CSRF Token 与会话的关联。在启动 Jenkins 服务时，通过 java -Dhudson.security.csrf.DefaultCrumbIssuer.EXCLUDE_SESSION_ID=true ... 选项设置。

或者，安装 Strict Crumb Issuer 扩展，该插件提供更细粒度的控制，可以关闭 Session ID 检查，以“基于过期时间”的机制进行控制。

在我们的场景中，多半是内部实现的原因（因为 /ajaxBuildQueue 地址，而且我们没有类似的脚本）。

减小日志数量
1）Manage Jenkins > System Log > Log Levels
2）设置 Adjust Levels 部分，Name 填写 hudson.security.csrf.CrumbFilter，Level 选择 SEVERE，然后 Submit 提交。