#!/bin/bash
location=/root/rm
find $location -mtime +30 -print | xargs rm -rf //-mtime是距离上一次修改时间 -print是只显示文件 xargs是获取find查找的结果在通过rm命令删除