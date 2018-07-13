set nu!       "show linenums

filetype on   "open filetype 

syntax on     "highlight

set tabstop=4    " table 4
set softtabstop=4  
set sw=4
set smarttab
set expandtab     " tab is space 
set autoindent   

"when create *.c *.cpp *.sh,SetTile() function will be called autumaticly.
autocmd BufNewFile *.c,*.sh,*.cpp exec ":call SetTitle()"


func SetTitle()
    if &filetype == 'sh'  " create *.sh file
        call setline(1,"#! /bin/bash")
        call setline(2,"################################################################################")
        call setline(3,"# FILENAME:")
        call setline(4,"#     test.sh")
        call setline(5,"#")
        call setline(6,"# DESCRIPTION:")
        call setline(7,"#     This script is used to ...")
        call setline(8,"#")
        call setline(9,"# REVISION(MM/DD/YYYY):")
        call setline(10,"#     03/21/2009  wh8199(wang.hui@advantech.com.cn)")
        call setline(11,"#     - Initial version")
        call setline(12,"################################################################################")
        call setline(13,"set -o nounset                  # Treat unset variables as an error")
    elseif &filetype == 'c' " create *.c file
        call setline(1,"/*******************************************************************************")
        call setline(2,"* FILENAME:")
        call setline(3,"*     test.c")
        call setline(4,"*")
        call setline(5,"* DESCRIPTION:")
        call setline(6,"*     This file is used to ...")
        call setline(7,"*")
        call setline(8,"* REVISION(MM/DD/YYYY)")
        call setline(9,"*     03/21/2009  wh8199(wang.hui@advantech.com.cn)")
        call setline(10,"*     - Initial version")
        call setline(11,"*******************************************************************************/")
    elseif &filetype == 'cpp' " create *.cpp fiel
        call setline(1,"//==============================================================================")
        call setline(2,"// FILENAME:")
        call setline(3,"//     test.cpp")
        call setline(4,"//")
        call setline(5,"// DESCRIPTION:")
        call setline(6,"//     This file is used to ...")
        call setline(7,"//")
        call setline(8,"// REVISION(MM/DD/YYYY):")
        call setline(9,"//     03/21/2009  wh8199(wang.hui@advantech.com.cn)")
        call setline(10,"//     - Initial version")
        call setline(11,"//==============================================================================")
    endif
endfunc


set nocompatible              " be iMproved, required
"filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'editorconfig/editorconfig-vim'
call vundle#end()            " required
"filetype plugin indent on    " required

