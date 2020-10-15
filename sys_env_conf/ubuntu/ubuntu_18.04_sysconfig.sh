#!/bin/sh

##修改默认的shell为bash，选择no
#sudo dpkg-reconfigure dash 


echo "start configure sys"

read -t 30 -s -p "input root password:" RootPassword
echo -e '\n'
echo RootPassword: $RootPassword

alias sudo="echo $RootPassword | sudo -S"

#sudo cp /etc/apt/sources.list   /etc/apt/sources.list.bk 

#sudo cp aliyuan_bionic_source_list.txt  /etc/apt/sources.list  

#sudo apt-get update   

# sudo apt-get upgrade -y 


#sudo apt-get install build-essential -y 

#sudo apt-get git-all  -y

#sudo apt-get vim-gtk  -y


##安装传输工具ssh
##sudo scp ./dvrrdk.tar.gz root@192.168.1.48:/home //将dvrrdk.tar.gz拷贝到192.168.1.48这台远端机的home目录下
##sudo scp  root@192.168.1.48:/home/dvrrdk.tar.gz  ./   //将远端机的home目录下dvrrdk.tar.gz拷贝到当前目录下
##sudo scp -r work_dir afa@192.168.1.2:/home/afa/work
#sudo apt-get install openssh-server -y

#sudo apt-get install subversion -y




##echo "嵌入式开发: tftpd/nfs-server"
#sudo apt-get install tftpd-hpa  tftp-hpa  xinetd -y

##echo "设置tftp..."
#sleep 3

#mkdir ~/tftpboot
#chmod 777 ~/tftpboot
#sudo ln -s  /home/$(whoami)/tftpboot  /tftpboot 
#echo -e "RUN_DAEMON=\"yes\"" | sudo tee  /etc/default/tftpd-hpa
#echo -e "OPTIONS=\"-l -s -c /home/$(whoami)/tftpboot\"" | sudo tee -a /etc/default/tftpd-hpa
#echo -e "TFTP_USERNAME=\"root\"" | sudo tee -a /etc/default/tftpd-hpa
#echo -e "TFTP_DIRECTORY=\"/home/$(whoami)/tftpboot\"" | sudo tee -a /etc/default/tftpd-hpa
#echo -e "TFTP_ADDRESS=\"0.0.0.0:69\"" | sudo tee -a /etc/default/tftpd-hpa
#echo -e "TFTP_OPTIONS=\"--secure\"" | sudo tee -a /etc/default/tftpd-hpa
#sudo service tftpd-hpa restart


#sudo apt-get install nfs-kernel-server -y

##echo "设置nfs..."
#mkdir ~/nfsroot
#chmod 777 ~/nfsroot

###echo -e "/home/$(whoami)/nfsroot *(rw,no_root_squash,no_all_squash,sync)" | sudo tee -a /etc/exports
#echo -e "/home/$(whoami)/nfsroot *(rw,nohide,insecure,no_subtree_check,async,no_root_squash)" | sudo tee -a /etc/exports
#sudo ln -s  /home/$(whoami)/nfsroot  /nfsroot 
#sudo exportfs -av
#sudo service nfs-kernel-server restart 

##sudo apt-get install bison flex mtd-utils -y


#sudo  apt-get install language-pack-zh-hant language-pack-zh-hans


echo "设置nfs..."
##echo -e "LANG=\"zh_CN.UTF-8\"" | sudo tee -a /etc/environment
##echo -e "LANGUAGE=\"zh_CN\:zh\:en_US\:en\"" | sudo tee -a /etc/environment

##sudo dpkg-reconfigure locales



sudo apt-get install bash-completion


  
#删除安装后的软件包
sudo apt-get clean #- 删除所有已下载的包文件
sudo apt-get autoclean #- 删除老版本的已下载的包文件
#sudo apt-get check #- 核对以确认系统的依赖关系的完整性
