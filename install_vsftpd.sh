#!/bin/sh
password=123

#echo ${password} | sudo -S 

echo ${password} | sudo -S  addgroup ftp-users 

echo ${password} | sudo -S adduser --home /media/hison/home/afa/work/ftp --ingroup ftp-users hison

echo ${password} | sudo -S chown hison:ftp-users /media/hison/home/afa/work/ftp -R 

echo ${password} | sudo -S chmod 755 /media/hison/home/afa/work/ftp -R

echo ${password} | sudo -S service vsftpd restart 

