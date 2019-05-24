#mkdir -p ~/.vim/bundle
# clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#:PluginInstall
set nocompatible              " 去除VI一致性,必须要添加
filetype off                  " 必须要添加

" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 另一种选择, 指定一个vundle安装插件的路径
"call vundle#begin('~/some/path/here')

" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'

Plugin 'kien/ctrlp.vim'

Plugin 'a.vim'

Plugin 'OmniCppComplete'

Plugin 'taglist.vim'

Plugin 'winmanager--Fox'

Plugin 'ddollar/nerdcommenter'

"Plugin 'fholgado/minibufexpl.vim'

Plugin 'grep.vim'

Plugin 'ervandew/supertab'

Plugin 'iago-lito/vim-visualmarks'

Plugin 'vim-scripts/minibufexpl.vim'

" 以下范例用来支持不同格式的插件安装.
" 请将安装插件的命令放在vundle#begin和vundle#end之间.
" Github上的插件
" 格式为 Plugin '用户名/插件仓库名'
"Plugin 'tpope/vim-fugitive'
" 来自 http://vim-scripts.org/vim/scripts.html 的插件
" Plugin '插件名称' 实际上是 Plugin 'vim-scripts/插件仓库名' 只是此处的用户名可以省略
"Plugin 'L9'
" 由Git支持但不再github上的插件仓库 Plugin 'git clone 后面的地址'
"Plugin 'git://git.wincent.com/command-t.git'
" 本地的Git仓库(例如自己的插件) Plugin 'file:///+本地插件仓库绝对路径'
"Plugin 'file:///home/gmarik/path/to/plugin'
" 插件在仓库的子目录中.
" 正确指定路径用以设置runtimepath. 以下范例插件在sparkup/vim目录下
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" 安装L9，如果已经安装过这个插件，可利用以下格式避免命名冲突
"Plugin 'ascenator/L9', {'name': 'newL9'}

" 你的所有插件需要在下面这行之前
call vundle#end()            " 必须

filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代:
"filetype plugin on
"
" 常用的命令
" :PluginList       - 列出所有已配置的插件
" :PluginInstall     - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
"
" 查阅 :h vundle 获取更多细节和wiki以及FAQ
" 将你自己对非插件片段放在这行之后

"set encoding=gb2312
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
if has("win32")
set fileencoding=chinese
else
set fileencoding=utf-8
endif
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决consle输出乱码
language messages zh_CN.utf-8

""vim配置
colorscheme desert      "选择主题
"syn on                 		" 打开语法高亮
set tabstop=4             	" 设置tab键的宽度
set shiftwidth=4           	" 换行时行间交错使用4个空格
set autoindent            	" 自动对齐
set backspace=2           	" 设置退格键可用
set smartindent            	" 智能对齐方式
set ai!                  	 	" 设置自动缩进
set nu!                   		" 显示行号
set showmatch            	" 设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
set ruler                 	" 在编辑过程中，在右下角显示光标位置的状态行
set incsearch              	" 查询时非常方便，如要查找book单词，当输入到/b时，会自动找到
                        		" 第一个b开头的单词，当输入到/bo时，会自动找到第一个bo开头的
                        		" 单词，依次类推，进行查找时，使用此设置会快速找到答案，当你
                        		" 找要匹配的单词时，别忘记回车
set vb t_vb=             	" vim进行编辑时，如果命令错误，会发出一个响声，该设置去掉响声

set guifont=UbuntuMono\ 12  "选择字体
syntax enable
syntax on

set nobackup

"set path=.,/usr/local/include,/usr/include,,,**
set path=.
"--------------------------------------------------------------------------------
" 模仿MS Windows中的快捷键
"--------------------------------------------------------------------------------
vmap <C-c> "+y
vmap <C-x> "+x
nmap <C-v> "+gP
nmap <C-a> ggvG$

"--------------------------------------------------------------------------------
" 窗口操作的快捷键
"--------------------------------------------------------------------------------
nmap wv     <C-w>v     " 垂直分割当前窗口
nmap wc     <C-w>c     " 关闭当前窗口
nmap ws     <C-w>s     " 水平分割当前窗口

"--------------------------------------------------------------------------------
" 模仿MS Windows中的保存命令: Ctrl+S
"--------------------------------------------------------------------------------
imap <C-s> <Esc>:wa<cr>i<Right>
nmap <C-s> :wa<cr>

map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q . <CR> 

"切换标签页
:nn <M-1> 1gt
:nn <M-2> 2gt
:nn <M-3> 3gt
:nn <M-4> 4gt
:nn <M-5> 5gt
:nn <M-6> 6gt
:nn <M-7> 7gt
:nn <M-8> 8gt
:nn <M-9> 9gt
:nn <M-0> :tablast<CR>

"进行版权声明的设置
"添加或更新头
map <F4> :call TitleDet()<cr>'s
function AddTitle()
    call append(0,"/*=============================================================================")
    call append(1,"#")
    call append(2,"# Author: shawnstone - 1127933178@qq.com")
    call append(3,"#")
    call append(4,"# first created : ".strftime("%Y-%m-%d %H:%M"))
    call append(5,"#")
    call append(6,"# Last modified: ".strftime("%Y-%m-%d %H:%M"))
    call append(7,"#")
    call append(8,"# Filename: ".expand("%:t"))
    call append(9,"#")
    call append(10,"# Description: ")
    call append(11,"#")
    call append(12,"=============================================================================*/")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf
"更新最近修改时间和文件名
function UpdateTitle()
    normal m'
    execute '/# *Last modified:/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
    normal ''
    normal mk
    execute '/# *Filename:/s@:.*$@\=":\t\t".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction
"判断前10行代码里面，是否有Last modified这个单词，
"如果没有的话，代表没有添加过作者信息，需要新添加；
"如果有的话，那么只需要更新即可
function TitleDet()
    let n=1
    "默认为添加
    while n < 10
        let line = getline(n)
        if line =~ '^\#\s*\S*Last\smodified:\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n + 1
    endwhile
    call AddTitle()
endfunction


"taglist 
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
nmap <F1> :Tlist<cr>

"winManager
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

"cscope "# cscope -Rbq .
:set cscopequickfix=s-,c-,d-,i-,t-,e-
:cs add cscope.out 
":cs add /home/afa/work/hi3531/Hi3531_SDK_V1.0.C.0/hi3531_rdk/cscope.out /home/afa/work/hi3531/Hi3531_SDK_V1.0.C.0/hi3531_rdk
":cs add /home/afa/work/dm8148/Source/ipnc_rdk/cscope.out /home/afa/work/dm8148/Source/ipnc_rdk


nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-Space>i :scs find i <C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>

""quickfix窗口
nmap <F6> :cn<cr>
nmap <F7> :cp<cr>

 
"c/h文件间相互切换
nnoremap <silent> <F12> :A<CR>

"grep
nnoremap <silent> <F3> :Grep<CR>

"VIM 自带自动补全
"filetype plugin indent on
"set completeopt=longest,menu

" OmniCppComplete ""安装是将安装包解码到.vim目录下,在Vim命令行下运行"helptags .”
set nocp
filetype plugin on 

":set tags=tags

""自动补全插件 SuperTab
let g:SuperTabDefaultCompletionType="context"  

"NERD_commenter
let mapleader = ","

:map { {}<ESC>i<CR><ESC>V<O  

:map ff <ESC>o<ESC>

"MiniBufExplorer
let g:miniBufExplMapCTabSwitchBufs = 1

let g:ctrlp_working_path_mode = 'a'
        
