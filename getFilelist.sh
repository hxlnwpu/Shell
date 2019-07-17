#!/bin/bash
#获取文件列表
d=`date -d "-5 min" +%Y%m%d%H%M`
basedir=/data/web/attachment
find $basedir/ -type f -mmin -5 > /tmp/newf.txt
n=`wc -l /tmp/newf.txt`
if [$n -gt 0 ];then
	/bin/mv /tmp/newf.txt /tmp/$d
fi

