#!/bin/bash

if [ ! -e Inc/$1_hal_conf.h ]
then
	echo "don't exist file $1"
	exit
fi

function write_data() {
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

search_dir="Middlewares Src"

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
		write_data $path	
	fi
	if [ "$ex_path" != "" ]
	then
		write_data $ex_path
	fi
done

src=""
for d in $search_dir
do
	find `pwd`/$d -name *.c | while read line
	do
		write_data $line
	done
done

src=`cat tmp_module_path.txt`
rm -rf tmp_module.txt
echo $src
