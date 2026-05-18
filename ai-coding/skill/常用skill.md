Humanizer-zh：AI写作去痕工具

技术原理与部署实践
核心技术原理
Humanizer-zh的技术核心基于“模式识别-逻辑重构-风格注入”的三段式工作流程，无需复杂算法模型，通过规则匹配与自然语言优化实现AI痕迹去除：

AI模式识别：基于预定义的24种AI写作模式清单，通过关键词匹配、句式结构分析、风格特征提取，精准定位文本中的AI生成痕迹，如识别“此外”“格局”等高频AI词汇，检测三段式排比、否定式排比等模板化句式。
表达逻辑重构：针对识别出的AI痕迹，采用“替换-删减-补充”策略优化：替换AI高频词汇为自然表达，删减过度修饰与填充短语，补充具体细节、数据或个人观点，打破模板化表达逻辑。
人类风格注入：遵循“有观点、变节奏、承复杂、用第一人称、留适度混乱、具化感受”六大原则，调整文本的句式长短、语气风格，注入真实人类的思考痕迹与个性特征，让文本更鲜活可信。
环境搭建与部署
该工具无需独立运行环境，核心部署方式是集成到支持MCP协议的AI工具（如Claude Code）中，提供三种安装方式，适配不同用户需求：

方式一：npx一键安装（推荐，最简单）
# 一键安装并添加到技能库，自动部署到对应目录
npx skills add https://github.com/op7418/Humanizer-zh.git

方式二：Git克隆安装
# 克隆项目到Claude Code的skills目录（适配macOS/Linux）
git clone https://github.com/op7418/Humanizer-zh.git ~/.claude/skills/humanizer-zh

# Windows系统克隆命令
git clone https://github.com/op7418/Humanizer-zh.git %USERPROFILE%\.claude\skills\humanizer-zh

方式三：手动安装
访问项目GitHub页面，下载ZIP压缩包并解压；
将解压后的“Humanizer-zh”文件夹复制到对应技能目录：
macOS/Linux：~/.claude/skills/
Windows：%USERPROFILE%.claude\skills\
确保文件夹结构为：~/.claude/skills/humanizer-zh/ ├── SKILL.md └── README.md
安装验证
重启Claude Code或重新加载技能库，在对话中输入以下命令，若工具激活则说明安装成功：

/humanizer-zh
1.
核心使用代码与示例
示例1：直接调用技能改写文本
# 命令式调用格式
/humanizer-zh 请帮我人性化以下文本：

本项目深入探讨了人工智能在智能家居领域的关键作用，此外，它展示了技术与生活场景的深度融合，为用户提供无缝、直观且充满活力的体验，这不仅仅是技术创新，更是生活方式的革命。
1.
2.
3.
4.
示例2：对话中指定改写需求
请用humanizer-zh帮我改写这段话，让它更像人类自然书写：

机器学习技术在医疗健康领域的应用至关重要，它不仅增强了诊断的准确性，更培养了行业的创新生态，突出了科技赋能医疗的复杂格局，为未来发展奠定了宝贵的基础。
1.
2.
3.
示例3：处理文件内容
登录后复制
# 批量处理文档中的AI生成内容
/humanizer-zh 请人性化 article.md 文件中的内容
-----------------------------------
Humanizer-zh：AI写作去痕工具，助力文本自然表达
https://blog.51cto.com/u_16099251/14566992