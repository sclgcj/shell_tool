find `pwd` -name "*.h" -o -name "*.c" -o -name "*.cc" > cscope.files

cscope -bkq -i cscope.files 2>/dev/null

ctags -R  --C-kinds=+p --fields=+aS --extra=+q 2>/dev/null
