dotvim
======

To sync vimrc and vim plugins by github.


windows:
http://www.cnblogs.com/crazyhack/archive/2012/05/16/2503622.html

1. git clone https://github.com/clar/dotvim.git "C:\Program Files\Vim\vimfiles"
2. fsutil hardlink create "C:\Program Files\Vim\\_vimrc" "C:\Program Files\Vim\vimfiles\\_vimrc"
3. cd  "C:\Program Files\vim\vimfiles"
4. git submodule init
5. git submodule update 
( git submodule update --init )
