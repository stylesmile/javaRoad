# 命令行安装 Claude Code 和 Codex 及升级

## 一、安装前准备

### 1.1 安装 Node.js

Claude Code 需要 Node.js 18 或更高版本。

**Windows 用户**：
- 从 [Node.js 官网](https://nodejs.org/) 下载并安装 LTS 版本
- 安装 Git for Windows：[https://gitforwindows.org/](https://gitforwindows.org/)

**macOS 用户**：
```bash
# 使用 Homebrew 安装
brew install node

# 或使用 nvm 管理多版本
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install 18
nvm use 18
```

**Linux 用户**：
```bash
# Ubuntu/Debian
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# CentOS/RHEL
curl -fsSL https://rpm.nodesource.com/setup_18.x | sudo bash -
sudo yum install -y nodejs
```

验证安装：
```bash
node --version
npm --version
```

## 二、安装 Claude Code

### 2.1 使用 npm 安装

```bash
npm install -g @anthropic-ai/claude-code
```

### 2.2 验证安装

```bash
claude --version
```

显示版本号则安装成功。

### 2.3 启动 Claude Code

```bash
claude
```

## 三、安装 OpenAI Codex

### 3.1 安装 openai 包

```bash
sudo npm install -g @openai/codex

# 使用国内镜像安装更快
sudo npm install -g @openai/codex --registry=https://registry.npmmirror.com

npm install -g openai
```

### 3.2 配置 API Key

```bash
# 设置环境变量（临时生效）
export OPENAI_API_KEY=your-api-key-here

# 永久生效（Linux/Mac）
echo 'export OPENAI_API_KEY=your-api-key-here' >> ~/.bashrc
source ~/.bashrc

# Windows PowerShell
$env:OPENAI_API_KEY="your-api-key-here"
```

## 四、升级 Claude Code

### 4.1 升级到最新版本

```bash
npm update -g @anthropic-ai/claude-code
```

### 4.2 升级到指定版本

```bash
npm install -g @anthropic-ai/claude-code@<version>
```

### 4.3 查看当前版本

```bash
claude --version
```

### 4.4 卸载并重新安装

```bash
npm uninstall -g @anthropic-ai/claude-code
npm install -g @anthropic-ai/claude-code
```

## 五、配置 DeepSeek 接入

如果你想使用 DeepSeek 作为后端，只需修改环境变量：

### Linux / Mac 用户

```bash
export ANTHROPIC_BASE_URL=https://api.deepseek.com/anthropic
export ANTHROPIC_AUTH_TOKEN=<你的 DeepSeek API Key>
export ANTHROPIC_MODEL=deepseek-v4-pro
export ANTHROPIC_DEFAULT_OPUS_MODEL=deepseek-v4-pro
export ANTHROPIC_DEFAULT_SONNET_MODEL=deepseek-v4-pro
export ANTHROPIC_DEFAULT_HAIKU_MODEL=deepseek-v4-flash
export CLAUDE_CODE_SUBAGENT_MODEL=deepseek-v4-flash
export CLAUDE_CODE_EFFORT_LEVEL=max
```

### Windows 用户（PowerShell）

```powershell
$env:ANTHROPIC_BASE_URL="https://api.deepseek.com/anthropic"
$env:ANTHROPIC_AUTH_TOKEN="<你的 DeepSeek API Key>"
$env:ANTHROPIC_MODEL="deepseek-v4-pro"
$env:ANTHROPIC_DEFAULT_OPUS_MODEL="deepseek-v4-pro"
$env:ANTHROPIC_DEFAULT_SONNET_MODEL="deepseek-v4-pro"
$env:ANTHROPIC_DEFAULT_HAIKU_MODEL="deepseek-v4-flash"
$env:CLAUDE_CODE_SUBAGENT_MODEL="deepseek-v4-flash"
$env:CLAUDE_CODE_EFFORT_LEVEL="max"
```

### 永久配置（Linux/Mac）

将以上配置添加到 `~/.bashrc` 或 `~/.zshrc` 文件末尾：

```bash
cat >> ~/.bashrc << 'EOF'
# Claude Code DeepSeek 配置
export ANTHROPIC_BASE_URL=https://api.deepseek.com/anthropic
export ANTHROPIC_AUTH_TOKEN=<你的 DeepSeek API Key>
export ANTHROPIC_MODEL=deepseek-v4-pro
export ANTHROPIC_DEFAULT_OPUS_MODEL=deepseek-v4-pro
export ANTHROPIC_DEFAULT_SONNET_MODEL=deepseek-v4-pro
export ANTHROPIC_DEFAULT_HAIKU_MODEL=deepseek-v4-flash
export CLAUDE_CODE_SUBAGENT_MODEL=deepseek-v4-flash
export CLAUDE_CODE_EFFORT_LEVEL=max
EOF

source ~/.bashrc
```

## 六、常用命令

```bash
# 启动 Claude Code
claude

# 查看帮助
claude --help

# 检查更新
npm outdated -g @anthropic-ai/claude-code

# 查看已安装的全局包
npm list -g --depth=0
```

## 七、常见问题

### 7.1 安装权限问题

**问题**：`EACCES: permission denied`

**解决方案**：
```bash
# 方式一：使用 sudo
sudo npm install -g @anthropic-ai/claude-code

# 方式二：修改 npm 全局安装路径
mkdir -p ~/.npm-global
npm config set prefix '~/.npm-global'
echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
```

### 7.2 Node.js 版本过低

**问题**：`Unsupported engine`

**解决方案**：升级 Node.js 到 18+ 版本

### 7.3 网络连接问题

**问题**：连接超时或失败

**解决方案**：
- 检查网络连接
- 配置代理：
```bash
npm config set proxy http://proxy-server:port
npm config set https-proxy http://proxy-server:port
```

### 7.4 API Key 无效

**问题**：认证失败

**解决方案**：
- 检查 API Key 是否正确
- 确保 API Key 有足够的权限
- 检查账户余额

## 八、参考链接

- Claude Code 官方文档：[https://docs.anthropic.com/claude/docs/claude-code](https://docs.anthropic.com/claude/docs/claude-code)
- DeepSeek API 文档：[https://api-docs.deepseek.com/zh-cn/quick_start/agent_integrations/claude_code](https://api-docs.deepseek.com/zh-cn/quick_start/agent_integrations/claude_code)
- Node.js 官网：[https://nodejs.org/](https://nodejs.org/)
- cc-switch 工具：[https://github.com/farion1231/cc-switch](https://github.com/farion1231/cc-switch)