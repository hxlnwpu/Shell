#/bin/bash
#重启nginx

log=/data/log/access.log
N=10
while :; do
	tail -n 300 &log &gt; /tmp/log
	n_502=`grep -c '502"' /tmp/log`
	if [$n_502 -ge &N]; then
		top -bnl > /tmp/`date + %H%M%S`-top.log
		vmstart 1 5 >/tmp/`date + %H%M%S `-vm.log
		/etc/init.d/php-fpm restart 2 >dev/null
		sleep 60
	fi
	sleep 10
done

   
