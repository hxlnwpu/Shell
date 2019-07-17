#有两台Linux服务器A和B，假如A可以直接ssh到B，不用输入密码。A和B都有一个目录叫做/data/web/ 这下面有很多文件，当然我们不知道具体有几层子目录，假若之前A和B上该目录下的文件都是一模一样的。但现在不确定是否一致了。固需要我们写一个脚本实现这样的功能，检测A机器和B机器/data/web/目录下文件的异同，我们以A机器上的文件作为标准。比如，假若B机器少了一个a.txt文件，那我们应该能够检测出来，或者B机器上的b.txt文件有过改动，我们也应该能够检测出来（B机器上多了文件我们不用考虑）。

#!/bin/bash
#假设A机器到B机器已经做了无密码登录设置
dir=/data/web
##假设B机器的IP为192.168.0.100
B_ip=192.168.0.100
find $dir -type f |xargs md5sum >/tmp/md5.txt
ssh $B_ip "find $dir -type f |xargs md5sum >/tmp/md5_b.txt"
scp $B_ip:/tmp/md5_b.txt /tmp

for f in `awk '{print $2}' /tmp/md5.txt`
do
	if grep -q "$f" /tmp/md5_b.txt
	then
		md5_a=`grep $f /tmp/md5.txt|awk '{print $1}'`
		md5_b=`grep $f /tmp/md5_b.txt|awk '{print $1}'`
		if [ $md5_a != $md5_b ]
		then
			echo "$f changed."
		fi
	else
		echo "$f deleted. "
	fi
done
