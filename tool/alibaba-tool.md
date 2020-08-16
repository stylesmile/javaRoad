阿里程序员推荐的 15 款常用开发者工具
点击关注 👉 芋道源码 今天
点击上方“芋道源码”，选择“设为星标”

管她前浪，还是后浪？

能浪的浪，才是好浪！

每天 8:55 更新文章，每天掉亿点点头发...

源码精品专栏

 
原创 | Java 2020 超神之路，很肝~

中文详细注释的开源项目

RPC 框架 Dubbo 源码解析

网络应用框架 Netty 源码解析

消息中间件 RocketMQ 源码解析

数据库中间件 Sharding-JDBC 和 MyCAT 源码解析

作业调度中间件 Elastic-Job 源码解析

分布式事务中间件 TCC-Transaction 源码解析

Eureka 和 Hystrix 源码解析

Java 并发源码

来源：阿里巴巴中间件

一、Java 线上诊断工具 Arthas
二、IDE 插件 Cloud Toolkit
三、混沌实验注入工具 ChaosBlade
四、Java 代码规约扫描插件
五、应用实时监控工具 ARMS
六、静态开源站点搭建工具 Docsite
七、Android 平台上的秒级编译方案 Freeline
八、性能测试工具 PTS
九、云效开发者工具KT
十、架构可视化工具 AHAS
十一、数据处理工具 EasyExcel
十二、iOS 类工具 HandyJSON
十三、云上资源和应用部署工具 EDAS Serverless
十四、数据库连接池 Druid
十五、Java 工具集 Dragonwell
从人工到自动化，从重复到创新，技术演进的历程中，伴随着开发者工具类产品的发展。

阿里巴巴将自身在各类业务场景下的技术积淀，通过开源、云上实现或工具等形式对外开放，本文将精选了一些阿里巴巴的开发者工具，希望能帮助开发者们提高开发效率、更优雅的写代码。

由于开发者涉及的技术领域众多，笔者仅从自己熟悉的领域，以后端开发者的视角盘点平时可能用得到的工具。每个工具按照以下几点进行介绍：

1、工具名称和简介 2、使用场景 3、使用教程 4、获取方式

一、Java 线上诊断工具 Arthas
Arthas 阿里巴巴2018年9月开源的一款Java线上诊断工具。

工具的使用场景：

1、这个类从哪个 jar 包加载的？为什么会报各种类相关的 Exception？

2、我改的代码为什么没有执行到？难道是我没 commit？分支搞错了？

3、遇到问题无法在线上 debug，难道只能通过加日志再重新发布吗？

4、线上遇到某个用户的数据处理有问题，但线上同样无法 debug，线下无法重现！

5、是否有一个全局视角来查看系统的运行状况？

6、有什么办法可以监控到JVM的实时运行状态？

Arthas支持JDK 6+，支持Linux/Mac/Windows，采用命令行交互模式，同时提供丰富的 Tab 自动补全功能，进一步方便进行问题的定位和诊断。

使用教程： 基础教程：

https://alibaba.github.io/arthas/arthas-tutorials?language=cn&id=arthas-basics

进阶教程：

https://alibaba.github.io/arthas/arthas-tutorials?language=cn&id=arthas-advanced

获取方式： （免费）开源地址：

https://github.com/alibaba/arthas

“推荐一个艿艿写的 6000+ Star 的 SpringBoot + SpringCloud + Dubbo 教程的仓库：https://github.com/YunaiV/SpringBoot-Labs
二、IDE 插件 Cloud Toolkit
Cloud Toolkit 是一款 IDE 插件，可以帮助开发者更高效地开发、测试、诊断并部署应用。通过 Cloud Toolkit，开发者能够方便地将本地应用一键部署到任意机器（本地或云端），并内置 Arthas 诊断、高效执行终端命令和 SQL 等，提供 IntelliJ IDEA 版，Eclipse 版，PyCharm 版和 Maven 版。

工具的使用场景：

1、每次修改完代码后，是否正在经历反复地打包？

2、在 Maven 、Git 以及其他运维脚本和工具的之间频繁切换？

3、采用 SCP 工具上传？使用XShell或SecureCRT登录服务器？替换部署包？重启？

4、文件上传到服务器指定目录，在各种 FTP、SCP 工具之间频繁切换 ？

使用教程：

IntelliJ IDEA版：

https://help.aliyun.com/document_detail/98762.html

Eclipse 版：

https://help.aliyun.com/document_detail/29970.html

PyCharm 版：

https://help.aliyun.com/document_detail/112740.html

Maven 版：

https://help.aliyun.com/document_detail/108682.html

获取方式： （免费）工具地址：

https://www.aliyun.com/product/cloudtoolkit

“推荐一个艿艿写的 3000+ Star 的 SpringCloud Alibaba 电商开源项目的仓库：https://github.com/YunaiV/onemall
三、混沌实验注入工具 ChaosBlade
ChaosBlade 是一款遵循混沌工程实验原理，提供丰富故障场景实现，帮助分布式系统提升容错性和可恢复性的混沌工程工具，可实现底层故障的注入，提供了延迟、异常、返回特定值、修改参数值、重复调用和try-catch 块异常等异常场景。

工具的使用场景：

1、微服务的容错能力不易衡量？

2、容器编排配置是否合理无法验证？

3、PaaS 层健壮性的测试工作无从入手？

使用教程：

https://github.com/chaosblade-io/chaosblade/wiki/新手指南

获取方式： （免费）开源地址：

https://github.com/chaosblade-io/chaosblade/wiki/新手指南

四、Java 代码规约扫描插件
该插件用于检测 Java 代码中存在的不规范的位置，并给予提示。规约插件是采用 Kotlin 语言开发。

使用教程：

IDEA插件使用文档：

https://github.com/alibaba/p3c/wiki/IDEA插件使用文档

Eclipse插件使用文档：

https://github.com/alibaba/p3c/wiki/Eclipse插件使用文档

获取方式： （免费）开源地址：

https://github.com/alibaba/p3c

五、应用实时监控工具 ARMS
ARMS 是一款 APM 类的监控工具，提供前端、应用、自定义监控 3 类监控选项，可快速构建实时的应用性能和业务监控能力。

工具的使用场景：

1、晚上10点收到37条报警信息，你却无从下手？

2、当我们发现问题的时候，客户/业务方已经发起投诉？

3、每个月花几十万买服务器，却无法保障用户体验？

使用教程：

前端监控接入：

https://help.aliyun.com/documentdetail/106086.html

应用监控接入：

https://help.aliyun.com/documentdetail/63796.html

自定义监控：

https://help.aliyun.com/document_detail/47474.html

获取方式： （收费）工具地址：

https://www.aliyun.com/product/arms

六、静态开源站点搭建工具 Docsite
Docsite 一款集官网、文档、博客和社区为一体的静态开源站点的解决方案，具有简单易上手、上手不撒手的特质，同时支持 react 和静态渲染、PC端和移动端、支持中英文国际化、SEO、markdown文档、全局站点搜索、站点风格自定义、页面自定义等功能。

使用教程：

https://docsite.js.org/zh-cn/docs/installation.html

获取方式： （免费）项目地址：

https://github.com/txd-team/docsite

七、Android 平台上的秒级编译方案 Freeline
Freeline 可以充分利用缓存文件，在几秒钟内迅速地对代码的改动进行编译并部署到设备上，有效地减少了日常开发中的大量重新编译与安装的耗时。Freeline 最快捷的使用方法就是直接安装 Android Studio 插件。

使用教程：

https://github.com/alibaba/freeline/blob/master/README-zh.md

获取方式： （免费）项目地址：

https://github.com/alibaba/freeline

八、性能测试工具 PTS
PTS 可以模拟大量用户访问业务的场景，任务随时发起，免去搭建和维护成本，支持 JMeter 脚本转化为 PTS 压测，同样支持原生 JMeter 引擎进行压测。

使用教程：

https://help.aliyun.com/document_detail/70290.html

获取方式： （收费）工具地址：

https://www.aliyun.com/product/pts

九、云效开发者工具KT
KT 可以简化在 Kubernetes 下进行联调测试的复杂度，提高基于Kubernetes的研发效率。

使用教程：

https://yq.aliyun.com/articles/690519

获取方式： （免费）工具地址：

https://yq.aliyun.com/download/3393

十、架构可视化工具 AHAS
AHAS 为 K8s 等容器环境提供了架构可视化的功能，同时，具有故障注入式高可用能力评测和一键流控降级等功能，可以快速低成本的提升应用可用性。

工具的使用场景：

1、服务化改造过程中，想精确的了解资源实例的构成和交互情况，实现架构的可视化？

2、想引入真实的故障场景和演练模型？

3、低门槛获得流控、降级功能？

使用教程：

https://help.aliyun.com/document_detail/90323.html

获取方式： （免费）工具地址：

https://www.aliyun.com/product/ahas

十一、数据处理工具 EasyExcel
EasyExcel 是一个用来对 Java 进行解析、生成Excel 的框架，它重写了 poi 对07版 Excel 的解析，原本一个3M的 Excel 用POI sax需要100M左右内存，EasyExcel可降低到 KB 级别，并且再大的excel也不会出现内存溢出的情况。03版依赖 POI 的 sax 模式。在上层做了模型转换的封装，让使用者更加简单方便。

使用教程：

https://github.com/alibaba/easyexcel/blob/master/quickstart.md

获取方式： （开源）

https://github.com/alibaba/easyexcel

十二、iOS 类工具 HandyJSON
HandyJSON 是一个用于 Swift 语言中的JSON序列化/反序列化库。

与其他流行的Swift JSON库相比，HandyJSON 的特点是，它支持纯 Swift 类，使用也简单。它反序列化时(把 JSON 转换为Model)不要求 Model从 NSObject 继承(因为它不是基于 KVC 机制)，也不要求你为 Model 定义一个 Mapping 函数。只要你定义好 Model 类，声明它服从 HandyJSON 协议，HandyJSON 就能自行以各个属性的属性名为Key，从JSON串中解析值。

使用教程：

https://github.com/alibaba/HandyJSON/blob/master/README_cn.md

获取方式： （开源）

https://github.com/alibaba/HandyJSON

十三、云上资源和应用部署工具 EDAS Serverless
EDAS Serverless 一款基于 Kubernetes，面向应用和微服务的 Serverless 平台。用户无需管理和维护集群与服务器，即可通过镜像、WAR 包和JAR 包，快速创建原生支持 Kubernetes 的容器应用，同时支持 Spring Cloud 和 Dubbo 等主流微服务框架。

使用教程：

https://help.aliyun.com/document_detail/102048.html

获取方式： （公测期间免费）

https://help.aliyun.com/document_detail/97792.html

十四、数据库连接池 Druid
Druid 是 Java 语言下的数据库连接池，它能够提供强大的监控和扩展功能。

使用教程： https://github.com/alibaba/druid/wiki/%E5%B8%B8%E8%A7%81%E9%97%AE%E9%A2%98

获取方式： （开源）

http://central.maven.org/maven2/com/alibaba/druid/

十五、Java 工具集 Dragonwell
Alibaba Dragonwell 是阿里巴巴内部OpenJDK定制版AJDK的开源版本， AJDK为在线电商，金融，物流做了结合业务场景的优化，运行在超大规模的，100,000+ 服务器的阿里巴巴数据中心。Alibaba Dragonwell与Java SE标准兼容，目前仅支持 Linux/x86_64平台。

使用教程： https://github.com/alibaba/dragonwell8/wiki/%E9%98%BF%E9%87%8C%E5%B7%B4%E5%B7%B4Dragonwell8%E7%94%A8%E6%88%B7%E6%8C%87%E5%8D%97

获取方式： （开源）

https://github.com/alibaba/dragonwell8