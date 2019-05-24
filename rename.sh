#/bin/bash
#查找log文件
find ./Data -type f -name "*.log" > ./Data/log.list
#批量修改文件名
for f in  `cat ./Data/log.list`
do
	mv $f $f.bak
done
#创建一个目录为了避免目录存在,所以要加一个复杂的后缀名
d=`date +%y%m%d%H%M%S`
mkdir ./Data/123_$d
#把.bak文件拷贝到./Data/123_$d
for f in `cat ./Data/log.list`
do
	cp $f.bak ./Data/123_$d
done
#打包压缩
cd ./Data/
tar czf 123.tar.gz 123_$d/
#还原
for f  in `cat ./Data/log.list`
do
	mv $f.bak
done
