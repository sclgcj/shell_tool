#!/bin/bash

if [ "$2" != "" ];then
	proj_conf=$2
else
	proj_conf=.cscope.conf
fi
if [ -n "$1" ];then
	cd $1 
fi
while :;
do
	#echo "cscope.sh $proj_conf >/dev/null 2>&1, cur_dir = `pwd`"
	#cscope.sh $proj_conf >/dev/null 2>&1
	cscope.sh $proj_conf
	#rm -rf cscope.out
	#cscope -Rbqk
	#cp cscope.out cscope_bak.out	
	sleep 10
done
cd - 2>/dev/null
