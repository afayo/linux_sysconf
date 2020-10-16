#!/bin/sh


echo "start configure samba"

read -t 30 -s -p "input root password:" RootPassword
echo -e '\n'
echo RootPassword: $RootPassword

alias sudo="echo $RootPassword | sudo -S"

cur_user_name=$(whoami)
echo cur_user_name: ${cur_user_name}

#sudo apt-get install -y samba cifs-utils
sudo apt-get install -y samba samba-common
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bak
sudo touch /etc/samba/smbpasswd

{
echo 123987 
echo 123987 
} | sudo smbpasswd -a afa 

echo "
#config
[share]
   	comment = Shared Folder with username and password
	path = /tftpboot
	public = yes
	writable = no
	valid users = afa
	create mask = 0700
	directory mask = 0700
	force user = nobody
	force group = nogroup
	available = yes
	browseable = yes
	workgroup = WORKGROUP
	display charset = UTF-8
	unix charset = UTF-8
	dos charset = cp936
" > ~/smb.conf 
sudo chmod 777  /etc/samba/smb.conf
sudo cat ~/smb.conf >>  /etc/samba/smb.conf 

#Debian changed service from 'samba' to 'smbd'. 
#sudo service samba restart 
sudo service smbd restart 
