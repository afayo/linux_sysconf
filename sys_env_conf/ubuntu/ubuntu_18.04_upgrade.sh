#!/bin/sh

##修改默认的shell为bash，选择no
#sudo dpkg-reconfigure dash 


echo "start configure sys"

read -t 30 -s -p "input root password:" RootPassword
echo -e '\n'
echo RootPassword: $RootPassword

alias sudo="echo $RootPassword | sudo -S"

#sudo cp /etc/apt/sources.list   /etc/apt/sources.list.bk 
#upgrade quickly with aliyuan .
#sudo cp aliyuan_bionic_source_list.txt  /etc/apt/sources.list  

sudo apt-get update   

sudo apt-get upgrade -y 

  
###删除安装后的软件包
#sudo apt-get clean   	##- 删除所有已下载的包文件
#sudo apt-get autoclean 	##- 删除老版本的已下载的包文件
#sudo apt-get check 		##- 核对以确认系统的依赖关系的完整性
