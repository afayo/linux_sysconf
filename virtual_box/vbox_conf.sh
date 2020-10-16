#!/bin/sh

#virtualbox 普通用户不能操作共享文件夹，如：sf_share，是由于对应的普通用afa，
#没有属于“VirtualBox Guest Additions installer”所创建的用户组vboxsf之中.
#可以执行下面命令：
sudo adduser afa vboxsf
