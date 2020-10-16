
echo "start configure sys"

read -t 30 -s -p "input root password:" RootPassword
echo -e '\n'
echo RootPassword: $RootPassword

alias sudo="echo $RootPassword | sudo -S"

cur_user_name=$(whoami)
echo cur_user_name: ${cur_user_name}

sudo apt-get install build-essential -y 

sudo apt-get git-all  -y


##安装传输工具ssh
##sudo scp ./dvrrdk.tar.gz root@192.168.1.48:/home //将dvrrdk.tar.gz拷贝到192.168.1.48这台远端机的home目录下
##sudo scp  root@192.168.1.48:/home/dvrrdk.tar.gz  ./   //将远端机的home目录下dvrrdk.tar.gz拷贝到当前目录下
##sudo scp -r work_dir afa@192.168.1.2:/home/afa/work
sudo apt-get install openssh-server -y

sudo apt-get install subversion -y

#sudo apt-get install bison flex mtd-utils -y

sudo apt-get install bash-completion

sudo apt install net-tools
