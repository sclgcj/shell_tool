#!/bin/bash

cd $1 
while :;
do
	cscope.sh
	#rm -rf cscope.out
	#cscope -Rbqk
	#cp cscope.out cscope_bak.out	
	sleep 5
done
