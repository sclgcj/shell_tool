#/bin/bash


if [ "$1" == "" ]
then
	exit
fi

date 
dirs=`find ~ | grep $1`
date
for d in $dirs:
do
	if [ -d $d ];
	then
		d2=${d##*/}
		if [[ "$d2" =~ "$1" ]]
		then
			echo -ne "$d (yes/no)"
			read choice
			if [ "$choice" == "yes" ] || [ "$choice" == "y" ]
			then
				cd $d
				break;
			fi
		fi
	fi
done
