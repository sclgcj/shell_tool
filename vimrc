"=========================================================================
"CR></ DesCRiption: 适合自己使用的vimrc文件，for Linux/Windows, GUI/Console
"
" Last Change: 2010年08月02日 15时13分 
"
" Version:     1.80
"
"=========================================================================

set nocompatible            " 关闭 vi 兼容模式
filetype off                  " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
""Plugin 'gmarik/vundle.vim'
Plugin 'https://github.com/scrooloose/syntastic.git'
""Plugin 'https://github.com/racer-rust/vim-racer.git'
"Plugin 'https://github.com/rust-lang/rust.vim'
""Plugin 'Valloric/YouCompleteMe'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
""Plugin 'L9'
" Git plugin not hosted on GitHub
""Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
""Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
""Plugin 'user/L9', {'name': 'newL9'}

Plugin 'https://github.com/Valloric/MatchTagAlways.git'
""Plugin 'https://github.com/beautify-web/js-beautify.git'
"Plugin 'https://github.com/robhudson/snipmate_for_django.git'
Plugin 'https://github.com/Rip-Rip/clang_complete.git'
Plugin 'https://github.com/mattn/emmet-vim.git'
"Plugin 'https://github.com/ternjs/tern_for_vim.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
syntax on                   " 自动语法高亮
"colorscheme molokai         " 设定配色方案

""autocmd FileType css set omnifunc=csscomplete#CompleteCSS
""autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

set autoindent
set ai
set si
set number                  " 显示行号
set cursorline              " 突出显示当前行
set ruler                   " 打开状态栏标尺
set shiftwidth=4           " 设定 << 和 >> 命令移动时的宽度为 2
set softtabstop=4           " 使得按退格键时可以一次删掉 2 个空格
set tabstop=4               " 设定 tab 长度为 2
set nobackup                " 覆盖文件时不备份
set autochdir               " 自动切换当前目录为当前文件所在的目录
filetype plugin indent on   " 开启插件
set backupcopy=yes          " 设置备份时的行为为覆盖
"set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set nowrapscan              " 禁止在搜索到文件两端时重新搜索
set incsearch               " 输入搜索内容时就显示搜索结果
set hlsearch                " 搜索时高亮显示被找到的文本
set noerrorbells            " 关闭错误信息响铃
set novisualbell            " 关闭使用可视响铃代替呼叫
set t_vb=                   " 置空错误铃声的终端代码
set showmatch               " 插入括号时，短暂地跳转到匹配的对应括号
" set matchtime=2             " 短暂跳转到匹配括号的时间
set magic                   " 设置魔术
set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
set smartindent             " 开启新行时使用智能自动缩进
set backspace=indent,eol,start
                            " 不设定在插入状态无法用退格键和 Delete 键删除回车符
set cmdheight=1             " 设定命令行的行数为 1
set laststatus=2            " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 
                           " 设置在状态行显示的信息
"set foldenable              " 开始折叠
"set foldmethod=syntax       " 设置语法折叠
"set foldmethod=indent       " 设置语法折叠
"set foldcolumn=0            " 设置折叠区域的宽度
"highlight Functions
"highlight Pmenu guibg=darkgrey guifg=black highlight PmenuSel guibg=lightgrey guifg=black
""set tags=/home/cj/workplace/automatic_test/server_test_back/lib/tags,/home/cj/workplace/automatic_test/server_test_back/test_lib/test_lib/back/test/lib/test_client/tags,tags
"/home/disk2/work/NVR_NEW/trunk/comm_apps/nc_nvr_protocol/protocol_session/tags,/home/disk2/work/NVR/trunk/comm_apps/switch/tags,/home/disk2/home/lib/curl-7.41.0/tags,/home/disk2/home/lib/lighttpd-1.4.34/tags,/home/disk2/work/NVR_NEW/trunk/comm_apps/libnc_nvr_new/libnc_nvr_new/tags

"/opt/linux-2.6.25.14/tags,/mnt/hgfs/linux/cppcheck-1.55/tags,/mnt/hgfs/linux/mysql-5.1.51/tags,/opt/libupnp/libupnp-1.3.1/tags,/opt/auto_test/tags,/opt/libupnp-1.3.1/tags,/opt/temp/auto_test/tags,/opt/temp/ceshi/tags,/mnt/hgfs/linux/speed_test1.7/tags,/mnt/hgfs/linux/server1/tags,/opt/new/ceshi/tags,/opt/new/ceshi/new_ceshi/tags,/mnt/hgfs/linux/work/webcam/libxml2-2.7.8/tags,/opt/work/own_test/webcam/tags,/opt/trunk/comm_apps/tags,/opt/trunk/platform/hisi/hi3520d/kernel/linux/linux/net/netfilter/tags,/opt/CUnit-2.0-1/tags,/opt/sg1/trunk/NcActiveX/NcIPCClient/NCSDK/tags,/opt/trunk/comm_apps/switch/switch/tags,/opt/ppp-2.4.5/tags,/opt/sg1/trunk/user/nc_onvif/tags,/opt/trunk/platform/hisi/hi3520d/apps/tags,/opt/libupnp_test/libupnp/tags,/opt/libupnp_test/sample/tags
"setlocal foldlevel=1        " 设置折叠层数为
" set foldclose=all           " 设置为自动关闭折叠                            
" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
                            " 用空格键来开关折叠
set encoding=utf-8
""set fileencodings=ucs-bom,utf-8,cp936
""set fileencodings=ucs-bom,utf-8
""set fileencodings=utf-8
set fileencoding=utf-8
set termencoding=utf-8
"cscope quick fix
""set cscopequickfix=s-,c-,d-,i-,t-,e-
"automatically complete
set completeopt=longest,menu

map  g]
" return OS type, eg: windows, or linux, mac, et.st..
function! MySys()
    if has("win16") || has("win32") || has("win64") || has("win95")
        return "windows"
    elseif has("unix")
        return "linux"
    endif
endfunction

" 用户目录变量$VIMFILES
if MySys() == "windows"
    let $VIMFILES = $VIM.'/vimfiles'
elseif MySys() == "linux"
    let $VIMFILES = $HOME.'/.vim'
endif

" 设定doc文档目录
let helptags=$VIMFILES.'/doc'

" 设置字体 以及中文支持
if has("win32")
    set guifont=Inconsolata:h12:cANSI
endif

" 配置多语言环境
if has("multi_byte")
    " UTF-8 编码
    set encoding=utf-8
    ""set encoding=gb2312
    set termencoding=utf-8
   " set termencoding=gb2312
    set formatoptions+=mM
    "set fencs=utf-8,gbk
    "set fencs=gbk
		"set encoding=utf-8
		"set fileencodings=ucs-bom,utf-8,cp936
		""set fileencoding=gb2312
		set fileencoding=utf-8

    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif

    if has("win32")
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/menu.vim
        language messages zh_CN.utf-8
    endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif


" Buffers操作快捷方式!
nnoremap <C-RETURN> :bnext<CR>
nnoremap <C-S-RETURN> :bprevious<CR>

" Tab操作快捷方式!
nnoremap <C-TAB> :tabnext<CR>
nnoremap <C-S-TAB> :tabprev<CR>

"关于tab的快捷键
" map tn :tabnext<cr>
" map tp :tabprevious<cr>
" map td :tabnew .<cr>
" map te :tabedit
" map tc :tabclose<cr>

"窗口分割时,进行切换的按键热键需要连接两次,比如从下方窗口移动
"光标到上方窗口,需要<c-w><c-w>k,非常麻烦,现在重映射为<c-k>,切换的
"时候会变得非常方便.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"一些不错的映射转换语法（如果在一个文件中混合了不同语言时有用）
nnoremap <leader>1 :set filetype=xhtml<CR>
nnoremap <leader>2 :set filetype=css<CR>
nnoremap <leader>3 :set filetype=javascript<CR>
nnoremap <leader>4 :set filetype=php<CR>

set fileformats=unix,dos,mac
" nmap <leader>fd :se fileformat=dos<CR>
" nmap <leader>fu :se fileformat=unix<CR>

" use Ctrl+[l|n|p|cc] to list|next|previous|jump to count the result
" map <C-x>l <ESC>:cl<CR>
" map <C-x>n <ESC>:cn<CR>
" map <C-x>p <ESC>:cp<CR>
" map <C-x>c <ESC>:cc<CR>


" 让 Tohtml 产生有 CSS 语法的 html
" syntax/2html.vim，可以用:runtime! syntax/2html.vim
let html_use_css=1

" Python 文件的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=2 shiftwidth=2 expandtab
autocmd FileType python map <F12> :!python %<CR>
au BufNewFile, BufRead *.py *.pyw setf python

" php ???????????? "
au FileType html,python,vim,javascript setl shiftwidth=2
au FileType html,python,vim,javascript setl tabstop=2
au FileType java,html,javascript,php setl shiftwidth=2
au FileType java,html,javascript,php setl tabstop=2

set smarttab
set lbr
set tw=0
set ai
set si
set cindent
set wrap


" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y

" 打开javascript折叠
let b:javascript_fold=1
" 打开javascript对dom、html和css的支持
let javascript_enable_domhtmlcss=1
" 设置字典 ~/.vim/dict/文件的路径
""autocmd filetype javascript set dictionary=$VIMFILES/dict/javascript.dict
""autocmd filetype css set dictionary=$VIMFILES/dict/css.dict
""autocmd filetype php set dictionary=$VIMFILES/dict/php.dict
""autocmd filetype php set omnifunc=phpcomplete
""用于匹配当前目录下的tags
""set tags=tags

"-----------------------------------------------------------------
" plugin - bufexplorer.vim Buffers切换
" \be 全屏方式查看全部打开的文件列表
" \bv 左右方式查看   \bs 上下方式查看
"-----------------------------------------------------------------


"-----------------------------------------------------------------
" plugin - taglist.vim  查看函数列表，需要ctags程序
" F4 打开隐藏taglist窗口
"-----------------------------------------------------------------
if MySys() == "windows"                " 设定windows系统中ctags程序的位置
    let Tlist_Ctags_Cmd = '"'.$VIMRUNTIME.'/ctags.exe"'
elseif MySys() == "linux"              " 设定windows系统中ctags程序的位置
    let Tlist_Ctags_Cmd = '/usr/bin/ctags'
endif
nnoremap <silent><F4> :TlistToggle<CR>
let Tlist_Show_One_File = 1            " 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          " 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         " 在右侧窗口中显示taglist窗口
let Tlist_File_Fold_Auto_Close=1       " 自动折叠当前非编辑文件的方法列表
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Enable_Fold_Column = 1
let Tlist_Process_File_Always = 1
let Tlist_Display_Prototype = 0
let Tlist_Compact_Format = 1
let Tlist_WinWidth = 40


"-----------------------------------------------------------------
" plugin - mark.vim 给各种tags标记不同的颜色，便于观看调式的插件。
" \m  mark or unmark the word under (or before) the cursor
" \r  manually input a regular expression. 用于搜索.
" \n  clear this mark (i.e. the mark under the cursor), or clear all highlighted marks .
" \*  当前MarkWord的下一个     \#  当前MarkWord的上一个
" \/  所有MarkWords的下一个    \?  所有MarkWords的上一个
"-----------------------------------------------------------------


"-----------------------------------------------------------------
" plugin - NERD_tree.vim 以树状方式浏览系统中的文件和目录
" :ERDtree 打开NERD_tree         :NERDtreeClose    关闭NERD_tree
" o 打开关闭文件或者目录         t 在标签页中打开
" T 在后台标签页中打开           ! 执行此文件
" p 到上层目录                   P 到根目录
" K 到第一个节点                 J 到最后一个节点
" u 打开上层目录                 m 显示文件系统菜单（添加、删除、移动操作）
" r 递归刷新当前目录             R 递归刷新当前根目录
"-----------------------------------------------------------------
" F3 NERDTree 切换
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC>:NERDTreeToggle<CR>
autocmd VimEnter * NERDTree
"过滤nerdtree 中的文件类型"
let NERDTreeIgnore=['\.vim$', '\~$', '\.o', '\.cdep', '\.sw*']
""autocmd VimEnter * Tlist


"-----------------------------------------------------------------
" plugin - NERD_commenter.vim   注释代码用的，
" [count],cc 光标以下count行逐行添加注释(7,cc)
" [count],cu 光标以下count行逐行取消注释(7,cu)
" [count],cm 光标以下count行尝试添加块注释(7,cm)
" ,cA 在行尾插入 /* */,并且进入插入模式。 这个命令方便写注释。
" 注：count参数可选，无则默认为选中行或当前行
"-----------------------------------------------------------------
let NERDSpaceDelims=1       " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1   " 多行注释时样子更好看



"-----------------------------------------------------------------
" plugin - DoxygenToolkit.vim  由注释生成文档，并且能够快速生成函数标准注释
"-----------------------------------------------------------------
let g:DoxygenToolkit_authorName="Asins - asinsimple AT gmail DOT com"
let g:DoxygenToolkit_briefTag_funcName="yes"
map <leader>da :DoxAuthor<CR>
map <leader>df :Dox<CR>
map <leader>db :DoxBlock<CR>
map <leader>dc a /*  */<LEFT><LEFT><LEFT>


"-----------------------------------------------------------------
" plugin – ZenCoding.vim 很酷的插件，HTML代码生成
" 插件最新版：http://github.com/mattn/zencoding-vim
" 常用命令可看：http://nootn.com/blog/Tool/23/
"-----------------------------------------------------------------


"-----------------------------------------------------------------
" plugin – checksyntax.vim    JavaScript常见语法错误检查
" 默认快捷方式为 F5
"-----------------------------------------------------------------
let g:checksyntax_auto = 0 " 不自动检查


"-----------------------------------------------------------------
" plugin - NeoComplCache.vim    自动补全插件
"-----------------------------------------------------------------
""let g:AutoComplPop_NotEnableAtStartup = 1
""let g:NeoComplCache_EnableAtStartup = 1
""let g:NeoComplCache_SmartCase = 1
""let g:NeoComplCache_TagsAutoUpdate = 1
""let g:NeoComplCache_EnableInfo = 1
""let g:NeoComplCache_EnableCamelCaseCompletion = 1
""let g:NeoComplCache_MinSyntaxLength = 3
""let g:NeoComplCache_EnableSkipCompletion = 1
""let g:NeoComplCache_SkipInputTime = '0.5'
""let g:NeoComplCache_SnippetsDir = $VIMFILES.'/snippets'
""" <TAB> completion.
""inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
""" snippets expand key
""imap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)
""smap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)


"-----------------------------------------------------------------
" plugin - matchit.vim   对%命令进行扩展使得能在嵌套标签和语句之间跳转
" % 正向匹配      g% 反向匹配
" [% 定位块首     ]% 定位块尾
"-----------------------------------------------------------------


"-----------------------------------------------------------------
" plugin - vcscommand.vim   对%命令进行扩展使得能在嵌套标签和语句之间跳转
" SVN/git管理工具
"-----------------------------------------------------------------


"-----------------------------------------------------------------
" plugin – a.vim
"-----------------------------------------------------------------
let g:SuperTabDefaultCompletionType="context"

"-----------------------------------------------------------------
"scope setting
"-----------------------------------------------------------------

set cscopequickfix=s-,c-,d-,i-,t-,e-
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=1
	set cst
	set nocsverb
	set cspc=3
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	"else search cscope .out elsewhere
  else
		let cscope_file=findfile("cscope.out", ",;")
		let cscope_pre=matchstr(cscope_file, ".*/")
		if !empty(cscope_file) && filereadable(cscope_file)
			exe "cs add" cscope_file cscope_pre
		endif
	endif
	set csverb
endif

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>D :cs find d <C-R>=expand("<cword>")<CR><CR>

""""""""""""""""""""""""""""""
" BufExplorer
" """"""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
"autocmd BufWinEnter \[Buf\ List\] setl nonumber 

"WManager配置
"let g:winManagerWindowLayout='FileExplorer|TagList'
let g:winManagerWidth = 30
let g:winManagerWindowLayout = "FileExplorer|TagList,BufExplorer"
"let g:winManagerwindowLayout = 'NERDTree|TagList,BufExplorer'
let g:AutoOpenWinManager = 1
let g:defaultExplorer = 0

"fileExplorer大小问题
let g:miniBufExplorerMoreThanOne = 0
let g:bufExplorerMaxHeight=30


"neocomplcache ????"
if &term=="xterm"
set t_Co=8
  set t_Sb=^[[4%dm
	  set t_Sf=^[[3%dm
endif

let g:neocomplcache_enable_at_startup = 1

"""""""""""""""""""""""""""Vundle

"""""""""""""""""""""""""Vundle
""colorscheme sea

"Option of MatchTagAlways
let g:mta_use_matchparen_gourp = 1

" Option of html
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:html_indent_inctags = "html.html,body"


"complete ()
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
"????{???Զ?ƥ??}
inoremap { {<CR>}<Esc>0							
""inoremap { {}<Esc>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
""inoremap } <c-r>=CloseBracket()
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endf

function CloseBracket()
	if match(getline(line('.') + 1), '\s*}') < 0
		return "\<CR>}"
	else
		return "\<Esc>j0f}a"
	endif
endf

function QuoteDelim(char)
	let line = getline('.')
	let col = col('.')
	if line[col - 2] == "\\"
		"Inserting a quoted quotation mark into the string
		return a:char
	elseif line[col - 1] == a:char
		"Escaping out of the string
		return "\<Right>"
	else
		"Starting a string
		return a:char.a:char."\<Esc>i"
	endif
endf

"complet html tag
""autocmd BufNewFile * setlocal filetype=html
""function! InsertHtmlTag()
""	let pat = '\c<\w\+\s*\(\s\+\w\+\s*=\s*[''#$;,()."a-z0-9]\+\)*\s*>'
""	normal! a>
""	let save_cursor = getpos('.')
""	let result = matchstr(getline(save_cursor[1]), pat)
"""if (search(pat, 'b', save_cursor
""	if (search(pat, 'b', save_cursor[1]))
""		normal! lyiwf>
""		normal! a</
""		normal! p
""		normal! a>
""	endif
""	:call cursor(save_cursor[1], save_cursor[2], save_cursor[3])
""endfunction
""
""inoremap > <ESC>:call InsertHtmlTag()<CR>a<CR><CR><Esc>ka


"django configure
au FileType python set ft=python.django
au FileType html set ft=htmldjango.html


"js"
au BufNewFile,BufRead *.js set filetype=javascript

python << EOF
import os
import sys
import vim
for p in sys.path:
	if os.path.isdir:
		if os.path.isdir(p):
			vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF

"syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_c_include_dirs = ["/home/cj/workplace/automatic_test/server_test/lib/lib_include", "/home/cj/git_project/server_test_lib/src/test_lib/test_lib/lib/lib_include/","/home/cj/workplace/automatic_test/netcore/src/c/lib/lib_include","/home/cj/git_project/server_test_lib/src/test_lib/test_lib/lib/curl/curl-7.50.0/include", "/home/cj/git_project/server_test_lib/src/test_lib/test_lib/lib/curl/curl-7.50.0/src"]
"
"""clang complete"
"let g:clang_complete_copen=1
"let g:clang_periodic_quickfix=0
"let g:clang_snippets=1
"let g:clang_close_preview=1
"let g:clang_use_library=1
"let g:clang_library_path = "/usr/lib/llvm-3.6/lib"
"""let g:clang_user_options="-I/home/cj/workplace/automatic_test/server_test/lib/lib_include"
"""let g:clang_user_options="-I/home/cj/workplace/automatic_test/netcore/src/c/lib/lib_include -I/home/cj/workplace/automatic_test/server_test/lib/lib_include"
"let g:clang_user_options="-I/home/cj/git_project/server_test_lib/src/test_lib/test_lib/lib/lib_include -I/home/cj/git_project/server_test_lib/src/test_lib/test_lib/lib/test_lib/test_lib -I/home/cj/workplace/automatic_test/netcore/src/c/lib/lib_include -I/home/cj/git_project/server_test_lib/src/test_lib/test_lib/lib/curl/curl-7.50.0/include -I/home/cj/git_project/server_test_lib/src/test_lib/test_lib/lib/curl/curl-7.50.0/src"


"" ----------------------------------------------------------------------------
"  " tern_for_vim
"  "
"  ----------------------------------------------------------------------------
""let tern_show_signature_in_pum = 1
""let tern_show_argument_hints = 'on_hold'
""autocmd FileType javascript nnoremap <leader>d :TernDef<CR>
""autocmd FileType javascript setlocal omnifunc=tern#Complete

inoremap <C-u> <esc>gUiwea 

au BufNewFile,BufRead *.c* set filetype=c
au BufNewFile,BufRead *.c* set shiftwidth=4
au BufNewFile,BufRead *.c* set softtabstop=4
au BufNewFile,BufRead *.c* set tabstop=4
au BufNewFile,BufRead *.h* set filetype=c

"omnifunc
""set tags+=D:/ctags/tags/cpp 
""set tags+=D:/ctags/tags/hge 
""set tags+=D:/ctags/tags/curl " OmniCppComplete 
""set tags+=/home/cj/ubus/erpc/iaiotcc/tools/tags
""set tags+=/home/cj/ubus/erpc/iaiotcc/tags
""set tags+=/home/cj/ubus/json-c-0.13/tags
""set tags+=/home/cj/ubus/libubox/tags
""set tags+=/home/cj/ubus/ubus-2015-05-25/tags
""set tags+=/home/cj/ubus/gateway/IA-WA200G-MCU/nucleo-stm32l073/tags
""set tags+=/home/cj/tar/SDK-orionis-for-Linux-i686/package/onvif/src/tags
set tags+=/home/cj/Documents/work/intelligent_argritecture/gateway/IA-WA200G-MCU-L083/tags
set tags+=/home/cj/Documents/work/intelligent_argritecture/driven_well/IA-WA200MW-MCU-L083/tags
set tags+=/home/cj/Documents/work/jiche/code/EOBD_finalv1.6/tags
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1 
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表 
let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全 
let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全 
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" 自动关闭补全窗口 
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif 
set completeopt=menuone,menu,longest
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"
