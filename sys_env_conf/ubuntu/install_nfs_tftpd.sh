#!/bin/sh


echo "start configure sys"

read -t 30 -s -p "input root password:" RootPassword
echo -e '\n'
echo RootPassword: $RootPassword

alias sudo="echo $RootPassword | sudo -S"

cur_user_name=$(whoami)
echo cur_user_name: ${cur_user_name}

#echo "嵌入式开发: tftpd/nfs-server"
sudo apt-get install tftpd-hpa  tftp-hpa  xinetd -y

#echo "设置tftp..."
sleep 3

mkdir ~/tftpboot
chmod 777 ~/tftpboot
sudo rm /tftpboot -f
sudo ln -s  ~/tftpboot  /tftpboot 
echo -e "RUN_DAEMON=\"yes\"" > ~/tftpd-hpa 
echo -e "OPTIONS=\"-l -s -c /home/${cur_user_name}/tftpboot\"" >> ~/tftpd-hpa 
echo -e "TFTP_USERNAME=\"$(whoami)\"" >> ~/tftpd-hpa  
echo -e "TFTP_DIRECTORY=\"/home/${cur_user_name}/tftpboot\"" >> ~/tftpd-hpa  
echo -e "TFTP_ADDRESS=\"0.0.0.0:69\"" >> ~/tftpd-hpa  
echo -e "TFTP_OPTIONS=\"--secure\"" >> ~/tftpd-hpa  

sudo cp  ~/tftpd-hpa  /etc/default
rm -r ~/tftpd-hpa
sudo chmod 777 /etc/default/tftpd-hpa 

sudo service tftpd-hpa restart


sudo apt-get install nfs-kernel-server -y

#echo "设置nfs..."
mkdir ~/nfsroot
chmod 777 ~/nfsroot
sudo chmod 777 /etc/exports 
sudo echo -e "/home/${cur_user_name}/nfsroot *(rw,nohide,insecure,no_subtree_check,async,no_root_squash)" >> /etc/exports
sudo rm /nfsroot -f 
sudo ln -s  ~/nfsroot  /nfsroot 
sudo exportfs -av

#重启rpcbind服务与nfs服务，nfs是一个RPC程序，使用它前，需要映射好端口，通过rpcbind设定
sudo /etc/init.d/rpcbind restart
sudo service nfs-kernel-server restart 
#systemctl restart nfs-server.service

