## window
新建系统变量 变量名：ANDROID_HOME 变量值：填写 Android SDK 的安装路径，

Android-Sdk
win
例如： D:\software-program\ANDROID_HOME
例如： D:\software-program\Android-SDK
例如： C:\Users\32398\AppData\Local\Android\Sdk

例如： ~/Library/Android/sdk

更新 PATH 变量 在系统变量中的 Path 添加以下路径：

%ANDROID_HOME%\platform-tools
%ANDROID_HOME%\tools
%ANDROID_HOME%\build-tools


## linux

export ANDROID_HOME=~/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools
%ANDROID_HOME%\platform-tools
%ANDROID_HOME%\tools
%ANDROID_HOME%\build-tools\

打开终端，编辑 Shell 配置文件：

nano ~/.bash_profile # 或者 ~/.zshrc
复制
添加以下内容：

export ANDROID_HOME=~/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools
复制
保存并刷新配置：

source ~/.bash_profile # 或 ~/.zshrc
复制
3. 验证配置

打开命令行窗口，输入以下命令：

adb version

## mac
export ANDROID_HOME=/Volumes/soft/software/ANDROID_HOME
export GRADLE_USER_HOME=/Volumes/soft/software/GRADLE_USER_HOME
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools


%ANDROID_HOME%\platform-tools
%ANDROID_HOME%\tools
%ANDROID_HOME%\build-tools\