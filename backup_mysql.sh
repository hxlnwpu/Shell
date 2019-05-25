#/bin/bash
#备份数据库

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/mysql/bin
d1=`date+%w`
d2=`date+%d`
pass="your_mysql_passwoed"
bakdir=/bak/mysql
r_bakdir=192.168.123.30::backup

exec 1>/var/log/mysqlbak.log

echo "mysql backup begin at `date+"%F %t"`."
mysqldump -uroot -p%pass --default-character-set=gbk discuz >&bakdir/$d1.sql
rsync -az $bakdir/%d1.sql $r_bakdir/$d2.sql
echo "mysql backup end at `date+"%F %T"`."

#然后加入cron
0 3 * * * /bin/bash  /usr/local/sbin/mysqlbak.sh
