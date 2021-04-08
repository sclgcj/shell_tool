#/bin/bash

#使用vim打开文件的同事，开启cscope自动更新

echo "hello"

if [ "$2" != "" ];then
	proj_conf=$2
else
	proj_conf=.cscope.conf
fi

vim_file=`ls .*_vimrc 2>/dev/null`
if [ ! -e $proj_conf ];then
	echo "no $proj_conf"
	ctags -R  --C-kinds=+p --fields=+aS --extra=+q 2>/dev/null
	cscope.sh
	#find `pwd` -name "*.h" -o -name "*.c" -o -name "*.cc" -o -name "*.cpp" > cscope.files
else
	if [ "$vim_file" == "" ];then
		vim_file="~/.vimrc"
	else
		vim_file=`pwd`/$vim_file
	fi
	echo "vim_file=$vim_file"
	cur_path=`pwd`
	lines=`cat $proj_conf`
	echo "lines = $lines"
	for i in $lines;
	do
		echo "i = $i"
		if [ -d $cur_path/$i ];then
			cd $cur_path/$i;
			#if [ ! -e tags ];then
			echo "prepare ctags for $cur_path/$i"
			ctags -R  --C-kinds=+p --fields=+aS --extra=+q 2>/dev/null
			#fi
			echo "cat $vim_file | grep \"$cur_path/$i/tags\" 2>/dev/null"
			exist_item=`cat $vim_file | grep "$cur_path/$i/tags" 2>/dev/null`
			echo "d=== $exist_item"
			if [ -z "$exist_item" ];then
				echo "++set tags+=$cur_path/$i/tags >> $vim_file"
				echo "set tags+=$cur_path/$i/tags" >> $vim_file
			fi
			cd - >/dev/null
		fi
	done
	cscope.sh $proj_conf
fi

cscope_auto.sh `pwd` $proj_conf >/dev/null 2>&1 &

if [ -n "$vim_file" ];then
	echo "vim -u $vim_file $1"
	vim -u $vim_file $1
else
	vim $1
fi

killall cscope_auto.sh

cscope_clean.sh $proj_conf #>/dev/null 2>&1 
echo "bye"
