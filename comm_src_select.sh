#!/bin/bash

TMP_SRC_FILE=tmp_src_path.txt

if [[ "$1" =~ "help" ]]
then
       echo "usage src_select.sh search_conf suffix"
       exit
fi

function filter_path() {
	local filter_arr=""
	#if [ -z $2 ]
	#then
	#	filter_arr=""
	#else
	#	filter_arr=`cat $TMP_SRC_FILE`
	#fi
	filter_arr=`cat $TMP_SRC_FILE`

	for f in $filter_arr
	do
		#echo "1 = $1, f=$f"
		if [ "$1" == "$f" ]
		then
			return 1;
		fi
	done

	return 0;
}

function write_to_file() {
	ori=`cat $TMP_SRC_FILE`

	if [ "$ori" == "" ]
	then
		echo $1 > $TMP_SRC_FILE
		return
	fi
	#ori="$ori $1"
	#echo $ori > $TMP_SRC_FILE
	#if [[ ! $ori =~ $1 ]]
	#then
	#	#ori="$ori $1"
	#	#echo $ori > $TMP_SRC_FILE
		echo $1 >> $TMP_SRC_FILE
	#fi
	return
}

function write_data() {
	local path=-I${1%/*}
	filter_path $path
	if [ "$?" != "0" ]
	then
		return;
	fi
	if [ "$2" == "c" ] || [ "$2" == "s" ] || [ "$2" == "S" ]
	then
		write_to_file $1 $2
	elif [ "$2" == "h" ]
	then
	#	echo $path
		write_to_file $path $2
	fi
	#if [ -n $2 ]
	#then
	#	filter_path $1 $2
	#	if [ "$?" != "0" ];
	#	then
	#		return 
	#	fi
	#fi
	#write_to_file $1
}


if [ -z $1 ]
then
	echo "." > tmp_dir.txt
	search_dir="tmp_dir.txt"
else
	search_dir=$1
fi

if [ -z $2 ]
then
	suffix=c
else
	suffix=$2
fi

cur_dir=`pwd`
echo "" > $TMP_SRC_FILE

if [ "$suffix" == "h" ]
then
	write_data $cur_dir/. $suffix
else
	src=`ls $cur_dir/*.$suffix 2>/dev/null`
	#echo "src = $src"
	
	for f in $src
	do
		write_data $f $suffix
	done
fi

src=""
#echo "suffix = $suffix"

cat $search_dir | while read d
do
	#echo "dir = $d"
	name=`echo -n $d | awk '{print $1}'`
	flag=`echo -n $d | awk '{print $2}'`
	if [ "$name" == "" ]
	then
		continue;
	fi
	if [ "$flag" == "" ]
	then
		flag=99;
	fi
	if [ "$name" == "." ]
	then
		src=""
	else
		src=$name
	fi
	if [ ! -d $name ]
	then
		file_suffix=${name##*.}
		if [ "$file_suffix" == "$suffix" ]
		then
			write_data `pwd`/$name $suffix
		fi
		continue
	fi
	if [ "$suffix" == "h" ]
	then
		write_data `pwd`/$name/ $suffix
	fi
	find `pwd`/$name -maxdepth $flag -name \*.$suffix | while read line
	do
		write_data $line $suffix
	done
done


rm -rf tmp_dir.txt

src=`cat $TMP_SRC_FILE`
rm -rf $TMP_SRC_FILE
echo $src
