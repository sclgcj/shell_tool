# shell_tool


记录一些自己使用的shell脚本

dir.sh   用于根据关键字查找当前目录所有子目录，如果有匹配的路径子打印出来，通过输出yes或者no来选择是否进入该目录

cscope.sh    用于查找当前目录下的.c .cpp 文件，生成cscope需要的文件

vim_port.tar.gz  惯用的vim配置，会持续改进

cscope_auto.sh 用于自动更新cscope.sh 数据库

vip.sh  包装了cscope_auto.sh 和 vim 两个工具，用于在打开工程目录的时候可以自动添加当前目录的cscope更新, 退出时
		也可以去掉自动更新进程

src_select.sh  用于结合stm32开发时根据相关的conf文件，自动选择需要编译的.c文件，以去掉不需要编译的.c文件

