# 查找字母数小于6的单词
#Bash also interprets a number of multi-character options


#wc(wordconut)命令的功能为统计指定文件中的字节数字数，行数，并将统计结果显示输出
#/bin/bash

for s in Bash also interprets a number of multi-character option
do
	n=`echo $s |wc -c`
	if [$n -lt 6]
	then echo $s
	fi
done
