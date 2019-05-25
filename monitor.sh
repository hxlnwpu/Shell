#/bin/bash
#监控80端口
mail=123@123.com
if netstat -lnp |grep ':80' |grep -q 'LISTEN';then
	exit
else
	/usr/local/apache2/bin/apachectl restart > /dev/null
	python mail.py $mail "check_80" "The 80 port is down"
	n=`ps aux|grep httpd|grep -cv grep`
	if [ $n -er 0];then
		 /usr/local/apache2/bin/apachectl start 2> /tmp/apache_start.err
	fi
	if [-s /tmp/apache_start.err];then
		python mail.py $mail 'apache_start-error' `cat /tmp/apache_start.err`
	fi
fi
