#!/bin/sh


username=$(whoami)

echo  username:$username


read -t 30 -s -p "input $username password:" AdminPassword
echo -e '\n'
#echo AdminPassword: AdminPassword$

alias sudo="echo $AdminPassword | sudo -S"

sudo apt-get install  -y vim-gtk cscope ctags  


mkdir -p ~/.vim/

#git clone  https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim 

git clone  https://github.com/afayo/linux_sysconf.git  

cd linux_sysconf/vim/plugins 

cp linux_sysconf/vim/vimrc  ~/.vimrc  

tar -zxvf bundle.tar.gz  -C ~/.vim

#open gvim, ::PluginInstall or :VundleInstall 

