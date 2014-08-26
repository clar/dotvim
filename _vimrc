set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


let mapleader = ","

" use pathogen to manage vim plugins 
" http://www.cnblogs.com/crazyhack/archive/2012/05/16/2503622.html
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" reconstruct MY vim IDE for PYTHON
" http://www.cnblogs.com/renrenqq/archive/2010/09/09/1813669.html
" 2012/08/08 ���� 

" 1
" ���ñ����Զ�ʶ��, ����������ʾ  
" set fileencodings=utf-8,cp936,big5,euc-jp,euc-kr,latin1,ucs-bom  
set fileencodings=utf-8,gbk  
set ambiwidth=double 

" 2
"ColorScheme
colorscheme desert

" 3
" �����˸��ɾ����tab����  
set smartindent  
set smarttab  
set expandtab  
set tabstop=4  
set softtabstop=4  
set shiftwidth=4  
set backspace=2
"set textwidth=79

" 4
" �������  
set mouse=a  
" �����к�  
set relativenumber

" 5
"�Զ���ȫ  
filetype plugin indent on
set completeopt=longest,menu
"�Զ���ȫ����ʱ��ʹ�ò˵�ʽƥ���б�  
set wildmenu
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType java set omnifunc=javacomplete#Complet

" 6
"Pydiction
"let g:pydiction_location = 'C:\Program Files\Vim\vimfiles\ftplugin\pydiction\complete-dict'
"let g:pydiction_location = 'C:\Program Files (x86)\Vim\vimfiles\bundle\pydiction\complete-dict'
let g:pydiction_location = $VIM.'\vimfiles\PluginConfig\pydiction\complete-dict'

" 7
" set font, do not put space around '='
set guifont=Consolas:h11

" 8
" TagList
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

" path where to search tag, for multiple-files-proj 
" http://stackoverflow.com/questions/563616/vim-and-ctags-tips-and-tricks
" (may not work on windows)
set tags=./tags;/

" WinManager
let g:winManagerWindowLayout='FileExplorer|TagList'
" this map may lead to slow performance of 'w' command, need to change it.
nmap <leader>wm :WMToggle<cr>

" cscope show in quickfix
set cscopequickfix=s-,c-,d-,i-,t-,e-

" 10
"MiniBufExplorer
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1

" 11
" grep
nnoremap <silent> <F3> :Grep<CR>
" Search the current file for what's currently in the search register and display matches
nmap <silent> <leader>gs :vimgrep /<C-r>// %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>
" Search the current file for the word under the cursor and display matches
nmap <silent> <leader>gw :vimgrep /<C-r><C-w>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>
" Search the current file for the WORD under the cursor and display matches
nmap <silent> <leader>gW :vimgrep /<C-r><C-a>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>
" next, prev, open, close 
nmap <leader>n :cnext<CR>
nmap <leader>p :cprevious<CR>
nmap <leader>ccl :cclose<CR>
nmap <leader>co :copen<CR>


"
set lines=36 
set columns=124
winpos 220 140
set guioptions-=T
set guioptions-=m


"
nmap <leader>v :edit $MYVIMRC<CR>
nmap <leader>s :w<CR>
nmap <leader>q :q<CR>
nmap <leader>wq :wq<CR>
" 
"
"

map <C-\> :split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"
set backupdir=$HOME/tmp
