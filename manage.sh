#/bin/bash
#监控远程的一台机器(假设ip为)的存活状态，当发现宕机时发一封邮件给你自己。 

ip=10.69.35.174
mail="hxl@mail.nwpu.edu.cn"
while true
do
    ping -c10 $ip >/dev/null
    if [ $? !="0" ]    #$? 表示上一个命令的exit status
    then
        python3 ./mail.py $mail "$ip down" "$ip is down,plese check."#假设mail.py已经编写好了
    fi
    echo "one step"
    sleep 30  #每隔30秒
done
