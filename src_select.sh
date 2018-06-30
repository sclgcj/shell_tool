#!/bin/bash

TMP_PATH=tmp_module_path.txt
TMP_MOD=tmp_module.txt

if [[ "$1" =~ "-h" ]]
then
	echo "usage src_select type [search_dir]"
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
	ori=`cat $TMP_PATH`

	if [ "$ori" == "" ]
	then
		echo $1 > $TMP_PATH
		return
	fi
	if [[ ! $ori =~ $1 ]]
	then
		ori="$ori $1"
		echo $ori > $TMP_PATH
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

cur_dir=`pwd`
conf=`find $cur_dir/$search_dir -name $1_hal_conf.h`
if [ -z $conf ]
then
	echo "don't exist file $1"
	exit
fi

#echo "conf = $conf"

#conf=Inc/$1_hal_conf.h

echo "" > $TMP_MOD
echo "" > $TMP_PATH

hal_file=`find $cur_dir/$search_dir/ -name $1_hal.c`
if [ -n $hal_file ]
then
	write_data $hal_file
fi

start=`cat -n $conf | grep 'Module Selection' | awk '{print $1}'`
end=`cat -n $conf | grep 'Oscillator Values adaptation' | awk '{print $1}'`
sed -n '47,94p' $conf | grep define | grep -v "\*"> $TMP_MOD

src=""
cat $TMP_MOD | while read line
do
	#echo $line	
	name=`echo -ne $line | awk 'BEGIN{FS="_"}{print $2}'`
	low=$(echo $name | tr '[A-Z]' '[a-z]')
	#echo $low
	src_file=$1_hal_$low.c
	ex_file=$1_hal_$low_ex.c
	path=$(find `pwd`/$search_dir -name $src_file)
	ex_path=$(find `pwd`/$search_dir -name $ex_file)
	if [ "$path" != "" ] 
	then
		write_data $path $3
	fi
	if [ "$ex_path" != "" ]
	then
		write_data $ex_path $3
	fi
done

#src=""
#if [ "$search_dir" != "" ]
#then
#	for d in $search_dir
#	do
#		find `pwd`/$search_dir/$d -name *.c | while read line
#		do
#			write_data $line $3
#		done
#	done
#fi

src=`cat $TMP_PATH`
rm -rf $TMP_MOD
echo $src
