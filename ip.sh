#! /bin/bash
#统计日志中每个IP的访问量

logfile="./Data/1.log"
awk '{print $1}' $logfile | sort -n | uniq -c
