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
	
	a="let g:syntastic_c_include_dirs = ["
	b=0
	for i in $lines;
	do
		echo "i = $i"
		if [ "$i" == "[ctrl]" ];then
			ctrl=1
			echo"ctrl = $ctrl"
		elif [ "$i" == "[dir]" ];then
			ctrl=0;
			continue;
		fi
		if [ $ctrl -eq 1 ];then
			if [ "$i" == "keep" ];then
				keep=1
				data=`cat .cscope.keep 2>/dev/null | tr '\n' '\0'`
				if [ "$data" == "true" ];then
					update=0
					break
				fi
			fi
		fi
		if [ -d $cur_path/$i ];then
			cd $cur_path/$i;
			for line in `find . -name \*.h | xargs dirname 2>/dev/null | uniq`;
			do
				if [ $b -eq 0 ];then
					a=$a"\"$cur_path/$i$line\""
					b=1
				else
					a=$a",\"$cur_path/$i$line\""
				fi
			done
			cur_inc=`ls *.h 2>/dev/null`
			if [ "$cur_inc" != "" ];then
				if [ $b -eq 0 ];then
					a=$a"\"$cur_path/$i\""
				else
					a=$a",\"$cur_path/$i\""
				fi
			fi
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
	if [ -e ./.extra_inc ];then
		b=0
		extra_lines=`cat ./.extra_inc`
		for extra_i in $extra_lines;
		do
			if [ $b -eq 0 ];then
				a=$a"\$extra_i\"
				b=1
			else
				a=$a",\"extra_i\""
			fi
		done
	fi
	a=$a"]"
	exho "a=$a"
	echo "update = $update"
	if [ $update -eq 1 ];then
		echo $a >> $vim_file
		cscope.sh $proj_conf
	fi
fi

if [ $keep -eq 1 ];then
	echo "true" > .cscope.keep
else
	echo "false" > .cscope.keep
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
