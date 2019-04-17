###################################################################
# File Name: wget_url.sh
# Author: xunyin
# E-mail: lnhxzwb@126.com
# Created Time: Mon 01 Apr 2019 12:49:01 AM CST
#==================================================================
#!/bin/bash

wget --spider -q -T 5 -t 2 $1 

if [ $? = 0 ];then
echo "$1 访问OK！！！"
#此处可写邮件发送管理员
else
echo "$1 访问失败，请检查！！"
#此处可写邮件发送管理员
fi

