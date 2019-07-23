



//更新apt源 
apt-get update 

apt-get install sudo

//安装gcc编译器 
apt install gcc 

//更新linux header 
apt-get install linux-headers-$(uname -r) 

apt-get install build-essential 

sh ./VBoxLinuxAddition.run

 apt install net-tools


# Using Ubuntu
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs

# Using Debian, as root
curl -sL https://deb.nodesource.com/setup_6.x | bash -
apt-get install -y nodejs

#配置gvim支持中文，修改.bashrc文件
echo “export LANG="zh_CN.UTF-8" ” > ~/.bashrc && source ~/.bashrc

#安裝gvim需要用到的命令，ctags和cscope
sudo apt install  exuberant-ctags  cscope


