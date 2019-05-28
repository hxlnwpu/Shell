#/bin/bash
#把一个文本文档的前五行中包含字母的行删掉同时把6到10行中的全部字母删除掉


##先获取该文本的行数

nu=`wc -l 1.txt |awk {print $1}`
##对前五行进行处理 
for i in `seq 1 5`
do
	l=`sed -n "$i"p 1.txt
	##使用grep 判定是否匹配字-v取反,-q不输出内容
	if echo $L |grep -vq '[a-zA-Z]'
	then
		echo $l
	fi
done
for i in `seq 6 10`
do
	l=`sed -n "$i"p 1.txt`
	echo $l|sed 's/[a-zA-Z]//g'
done

##剩余的直接输出
for i in `seq 11 $nu`
do
	sed -n "$i"p 1.txt
done


