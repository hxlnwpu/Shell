#写一个脚本,检测你的网络流量，并记录到一个日志里。需要按照如下格式，并且一分钟统计一次（只需要统计外网网卡，假设网卡名字为eth0)：
#2017-08-04 01:11 eth0 input: 1000bps eth0 output : 200000bps ################ 2017-08-04 01:12 eth0 input: 1000bps eth0 output : 200000bps

#/bin/bash
sar -n DEV 1 59 
