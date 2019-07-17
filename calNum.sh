#!/bin/bash
#统计数字并求和：计算文档a.txt中每一行出现的数字个数并且要求计算一下整个文档中一共出现几个数字。例如a.txt内容如下：12aa*lkjskdj alskdflkskdjflkjj

n=`wc -l a.txt |awk '{print $1}'`
sum=0
for i in `seq 1 $n`
do
    line=`sed -n "$i"p a.txt`
    n_n=`echo -n $line|sed 's/[^0-9]//g'|wc -c`
    echo line $i number:$n_n
    sum=$[$sum+$n_n]
done
echo sum is $sum