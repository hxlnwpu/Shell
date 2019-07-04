#统计日志大小
#！/bin/bash

logdir="/data/log"
t=`date + %H`
d=`date + %F-$H`
[ -d /tmp/log_size ] || mkdir /tmp/log_size

for log in `find $logdir -type f`
do
    if [ $t =='0'] || [$t == '12']
    then
    true>$log
    else
    du -sh $log >> /tmp/log_size/$d
    fi
done
