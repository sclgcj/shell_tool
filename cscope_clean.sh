#!/bin/bash

if [ "$1" == "" ];then
	proj_conf=.cscope.conf
else
	proj_conf=$1;
fi

if [ ! -e $proj_conf ];then
	return
fi
cur_path=`pwd`
lines=`cat $proj_conf`
vim_file=`ls .*_vimrc 2>/dev/null`
if [ "$vim_file" == "" ];then
	vim_file="~/.vimrc"
else
	vim_file=`pwd`/$vim_file
fi

for i in $lines;
do
	echo i = $i
	if [ -d $cur_path/$i ];then
		find $cur_path/$i -name "*.h" -o -name "*.c" -o -name "*.cc" -o -name "*.cpp" >> tmp_files
		cd $cur_path/$i;
		cd -
		tmp_line=`cat $vim_file | grep -n "set tags+=$cur_path/$i/tags" | awk -F ':' '{print $1}' 2>/dev/null`
		echo "tmp_line = $tmp_line"
		if [ -n "$tmp_line" ];then
			echo "sed -i \"${tmp_line}d\" $vim_file"
			sed -i "${tmp_line}d" $vim_file
		fi
	elif [ -f $cur_path/$i ];then
		tmp_line=`cat $vim_file	| grep -n "$cur_path/$i" | awk -F ':' '{print $1}' 2>/dev/null`
		echo "tmp_line = $tmp_line"
		if [ -n "$tmp_line" ];then
			echo "sed -i \"${tmp_line}d\" $vim_file"
			sed -i "${tmp_line}d" $vim_file
		fi
	fi
done

if [ -f $cur_path/.tmp_files ];then
	rm -rf $cur_path/tmp_files
fi
