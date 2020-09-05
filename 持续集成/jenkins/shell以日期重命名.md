#!/bin/bash
#shell以日期重命名.md
find ./log -name "*.jar" | while read file
do
DATE=$(date +%Y%m%d_%H%M%S_%N)
mv $file ./temp_log/${DATE}.log
done

#第一行语句：找出当前log目录下的所有以*.log为后缀的文件。
#第三行语句：把当前时间变量导入DATE变量（产生一个随机数）。
#第四行语句：移动并重命名查找到的文件。