# 输入数字执行命令

#/bin/bash

echo "cmd meau ** 1---date 2--ls 3--who 4--pwd
read -p "please input a number 1-4:" n
case $n in
	1)
		date
		;;
	2)
		ls
		;;
	3)
		who
		;;
	4)
		pwd
		;;
	*)
		echo "please input a number: 1-4"
		;;
esac
