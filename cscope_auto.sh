#!/bin/bash

cd $1 
while :;
do
	for p in $proj;
	do
		cd $p;
		rm -rf cscope.out
		cscope -Rbqk
		cp cscope.out cscope_bak.out	
		cd -
	done
	sleep 5
done
