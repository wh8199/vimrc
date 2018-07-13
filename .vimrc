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

:map <F4> :call AddTitle2() <cr>
function AddTitle2()
    if &filetype == 'sh'
        call append(line("."),"#-------------------------------------------------------------------------------")
        call append(line(".") + 1,"# NAME:")
        call append(line(".") + 2,"#      function_name")
        call append(line(".") + 3,"#")
        call append(line(".") + 4,"# DESCRIPTION:")
        call append(line(".") + 5,"#      description of the function")
        call append(line(".") + 6,"#")
        call append(line(".") + 7,"# PARAMETERS:")
        call append(line(".") + 8,"#      $1 - description...")
        call append(line(".") + 9,"#      $2 - description...")
        call append(line(".") + 10,"#")
        call append(line(".") + 11,"# RETURN:")
        call append(line(".") + 12,"#      0 - OK")
        call append(line(".") + 13,"#      Others - Error")
        call append(line(".") + 14,"#-------------------------------------------------------------------------------")
    elseif &filetype == 'c'
        call append(line("."),"/*******************************************************************************")
        call append(line(".") + 1,"* NAME:")
        call append(line(".") + 2,"*      function_name")
        call append(line(".") + 3,"*")
        call append(line(".") + 4,"* DESCRIPTION:")
        call append(line(".") + 5,"*      Description of the function")
        call append(line(".") + 6,"*")
        call append(line(".") + 7,"* PARAMETERS:")
        call append(line(".") + 8,"*      Arg1 - description...")
        call append(line(".") + 9,"*      Arg2 - description...")
        call append(line(".") + 10,"*")
        call append(line(".") + 11,"* RETURN:")
        call append(line(".") + 12,"*      0 - OK")
        call append(line(".") + 13,"*      Others - Error")
        call append(line(".") + 14,"*******************************************************************************/") 
    elseif &filetype == 'cpp'
        call append(line("."),"//------------------------------------------------------------------------------")
        call append(line(".") + 1,"// NAME:")
        call append(line(".") + 2,"//      function_name")
        call append(line(".") + 3,"//")
        call append(line(".") + 4,"// DESCRIPTION:")
        call append(line(".") + 5,"//      Description of the function")
        call append(line(".") + 6,"//")
        call append(line(".") + 7,"// PARAMETERS:")
        call append(line(".") + 8,"//      Arg1 - description...")
        call append(line(".") + 9,"//      Arg2 - description...")
        call append(line(".") + 10,"//")
        call append(line(".") + 11,"// RETURN:")
        call append(line(".") + 12,"//      0 - OK")
        call append(line(".") + 13,"//      Others - Error")
        call append(line(".") + 14,"//------------------------------------------------------------------------------")
    endif    
endfunction
