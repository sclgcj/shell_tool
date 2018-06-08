#!/bin/bash

if [[ "$1" =~ "-h" ]]
then
	echo "usage src_select type [search_dir]"
	exit
fi

if [ ! -e Inc/$1_hal_conf.h ]
then
	echo "don't exist file $1"
	exit
fi

function filter_path() {
	local filter_arr=""
	if [ -z $2 ]
	then
		filter_arr=""
	else
		filter_arr=`cat $2`
	fi

	for f in $filter_arr
	do
		if [[ $1 =~ $f ]]
		then
			return 1;
		fi
	done

	return 0;
}

function write_to_file() {
	ori=`cat tmp_module_path.txt`

	if [ "$ori" == "" ]
	then
		echo $1 > tmp_module_path.txt
		return
	fi
	if [[ ! $ori =~ $1 ]]
	then
		ori="$ori $1"
		echo $ori > tmp_module_path.txt
	fi
	return
}

function write_data() {
	if [ -n $2 ]
	then
		filter_path $1 $2
		if [ "$?" != "0" ];
		then
			return 
		fi
	fi
	write_to_file $1
}

if [ -z $2 ]
then
	search_dir=""
else
	search_dir=`cat $2`
fi

conf=Inc/$1_hal_conf.h

echo "" > tmp_module.txt
echo "" > tmp_module_path.txt

write_data "`pwd`/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal.c"

start=`cat -n $conf | grep 'Module Selection' | awk '{print $1}'`
end=`cat -n $conf | grep 'Oscillator Values adaptation' | awk '{print $1}'`
sed -n '47,94p' $conf | grep define | grep -v "\*"> tmp_module.txt

src=""
cat tmp_module.txt | while read line
do
	#echo $line	
	name=`echo -ne $line | awk 'BEGIN{FS="_"}{print $2}'`
	low=$(echo $name | tr '[A-Z]' '[a-z]')
	#echo $low
	src_file=$1_hal_$low.c
	ex_file=$1_hal_$low_ex.c
	path=$(find `pwd` -name $src_file)
	ex_path=$(find `pwd` -name $ex_file)
	if [ "$path" != "" ] 
	then
		write_data $path $3
	fi
	if [ "$ex_path" != "" ]
	then
		write_data $ex_path $3
	fi
done

src=""
if [ "$search_dir" != "" ]
then
	for d in $search_dir
	do
		find `pwd`/$d -name *.c | while read line
		do
			write_data $line $3
		done
	done
fi

src=`cat tmp_module_path.txt`
rm -rf tmp_module.txt
echo $src
