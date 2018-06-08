#/bin/bash

#使用vim打开文件的同事，开启cscope自动更新

echo "hello"

cscope_auto.sh `pwd` &

vim $1

killall cscope_auto.sh

echo "bye"
