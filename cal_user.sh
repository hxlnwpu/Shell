#-统计普通用户
#! /bin/bash
n=`awk -F ':' '$3>=1000' /etc/passwd |wc -l`
if [ $n -gt 0 ]
then
	echo "There are $n common users"
	uname=`awk -F ':' '$3>=100' /etc/passwd | awk -F ':' '{print $1}'`
	echo "the user were $uname"
else
	echo "No common users"
fi
