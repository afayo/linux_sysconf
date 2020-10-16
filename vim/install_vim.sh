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

cp linux_sysconf/vim/vimrc  ~/.vimrc  

cd linux_sysconf/vim/plugins 

tar -zxvf bundle.tar.gz  -C ~/.vim

cd -

sudo rm  linux_sysconf -rf 

#open gvim, and :PluginInstall or :VundleInstall 

