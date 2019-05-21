#! /bin/bash
#统计内存使用
sum=0
for mem in `ps aux|awk '{print $6}' | grep -v 'RSS'`
do
    sum=$[$sum+$mem]   #注意shell编程中括号用法
done
echo "The total memory is $sum""k"
