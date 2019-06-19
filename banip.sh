#需求： 根据web服务器上的访问日志，把一些请求量非常高的ip给拒绝掉！
#! /bin/bash
logfile=/home/logs/access.log
d1=`date -d"-l minute"+%H:%M`
d2=`date+%M`
ipt=/sbin/iptables
ips=/tmp/ips.txt

block(){
	grep "$d1:" $logfile|awk '{print $1}' |sort -n |uniq -c |sort -n >$ips
	for ip in `awk '$1>100 {print $2}' $ips`;do
		$ipt -I INPUT -p tcp --dport 80 -s $ip -j REJECT
		echo "`date + %F-$T` $ip" >> /tmp/badip.txt
	done
}

unblock(){
	for i in `$ip -nvl --line-numbers |grep '0.0.0.0/0'|awk '$2<15 {print $1}' |sort -nr`;do
		$ip -D INPUT $i
	done
	$ipt -Z
}

if [$d2=="00"] || [$d2="30"] then
	unblock
	block
else
	block
fi
