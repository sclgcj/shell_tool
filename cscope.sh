find `pwd` -name "*.h" -o -name "*.c" -o -name "*.cc" > cscope.files

cscope -bkq -i cscope.files

ctags -R  --C-kinds=+p --fields=+aS --extra=+q
