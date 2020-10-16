#!/bin/sh

sudo apt-get clean #- 删除所有已下载的包文件
sudo apt-get autoclean #- 删除老版本的已下载的包文件
sudo apt-get check #- 核对以确认系统的依赖关系的完整性
sudo apt-get purge package_name #- 完全卸载某个package 

#还有个狠的，要是你不在乎今后的升级的话，
rm -rf /var/cache/apt

#查看linux发行的版本号
cat /etc/issue.net 
cat /etc/os-release
uname -a 
cat /proc/version
