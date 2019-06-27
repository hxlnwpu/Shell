#/bin/bash
#监控磁盘使用率

log=/var/log/disk/`date +%F`.log
date +'%F %T' > $log
df -h >> $log
echo >> $log
df -i >> $log

for i in `df -h|grep -v 'Use%'|sed 's/%//'|awk '{print $5}'`; do
	if [ $i -gt 85 ]; then
		use=`df -h|grep -v 'Use%'|sed 's/%//'|awk '$5=='$i' {print $1,$5}'`
		echo "$use" >> use
	fi
done
if [ -e use ]; then
	##这里可以使用咱们之前介绍的mail.py发邮件
	mail -s "Filesystem Use% check" root@localhost < use
	rm -rf use
fi

for j in `df -i|grep -v 'IUse%'|sed 's/%//'|awk '{print $5}'`; do
	if [ $j -gt 85 ]; then
		iuse=`df -i|grep -v 'IUse%'|sed 's/%//'|awk '$5=='$j' {print $1,$5}'`
		echo "$iuse" >> iuse
	fi
done
if [ -e iuse ]; then
	mail -s "Filesystem IUse% check" root@localhost < iuse
	rm -rf iuse
fi

