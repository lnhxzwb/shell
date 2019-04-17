###################################################################
# File Name: web_check.sh
# Author: xunyin
# E-mail: lnhxzwb@126.com
# Created Time: 2019年04月08日 星期一 17时32分26秒
#==================================================================
#!/bin/bash
path=/var/www/html
num=$(cat /tmp/site.log|wc -l)  # site.log监控前获取数据
filenum=$(ls -l $path|wc -l)
md5num=$(md5sum -c /tmp/md5.log|grep -i "failed"|wc -l)  # md5.log监控前获取数据
date=$(date +%F_%T)
if [ $num -ne $filenum ];then
echo "$path 文件数已被改变，请检查"
# 邮件报警
# mail -s "$date 文件数已改变"  lnhxzwb@126.com  
fi

if [ $md5num -ne 0 ];then
echo "$(md5sum -c /tmp/md5.log|grep -i "failed")"
# 邮件报警
# md5sum -c /tmp/md5.log|grep -i "failed" >/tmp/failed.log
# mail -s "$date 文件已修改"  lnhxzwb@126.com </tmp/failed.log
fi

