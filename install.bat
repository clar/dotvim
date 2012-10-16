git clone https://github.com/clar/dotvim.git "C:\Program Files\Vim\vimfiles"

fsutil hardlink create "C:\Program Files\Vim\_vimrc" "C:\Program Files\Vim\vimfiles\_vimrc"

cd "C:\Program Files\vim\vimfiles"

rem subm update
git submodule update --init 

rem to install one subm ( git submodule add 插件的Git仓库地址 bundle/插件名字)
rem 'git submodule add http//github.com/scrooloose/nerdtree.git bundle/nerdtree'

rem to update one subm
rem cd into subm directory
rem 'git checkout master; git pull'

rem to update all subms
rem "git submodule foreach 'git pull origin master' "

rem to uninstall one subm
rem 'rm -rf bundle/插件名'
rem 'git rm -r bundle/插件名'

rem ctags 
rem 我们一般会在project 目录下生成 tags
rem 生成命令一般是：ctags -R  --languages=c++ --c++-kinds=+p --fields=+iaS --extra=+q .
rem 
copy .\3rdPartyTool\ctags.exe ..\vim73

rem cscope still not work
rem copy .\3rdPartyTool\cscope.exe ..\vim73

rem python dbg 
rem https://github.com/vim-scripts/VimPdb
