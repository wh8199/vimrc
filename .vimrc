set nu!       "show linenums

filetype on   "open filetype

syntax on     "highlight

set backspace=2
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
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()            " required
"filetype plugin indent on    " required


let g:ycm_confirm_extra_conf=0
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

let Tlist_Use_Right_Window = 0      " 在左侧显示窗口
let Tlist_Compart_Format = 1        " 压缩方式
let Tlist_Exist_OnlyWindow = 1      " 如果只有一个buffer，kill窗口也kill掉buffer
let Tlist_File_Fold_Auto_Close = 0  " 不要关闭其他文件的tags
let Tlist_Enable_Fold_Column = 1    " 不要显示折叠树 (鼠标可以点开)
let Tlist_WinWidth = 25                 " taglist窗口宽度
let Tlist_Show_One_File=1

set tags=tags;
set autochdir

map <silent> <F8> :TlistToggle<CR>

:map <F4> :call AddTitle2() <cr>
:map <F2> :NERDTreeToggle <CR>
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
    elseif &filetype == 'go'
        call append(line("."),"/*")
        call append(line(".") + 1,"* NAME:")
        call append(line(".") + 2,"*    function_name")
        call append(line(".") + 3,"*    ")
        call append(line(".") + 4,"*DESCRIPTION:")
        call append(line(".") + 5,"*    Description of the function")
        call append(line(".") + 6,"*")
        call append(line(".") + 7,"*PARAMETERS:")
        call append(line(".") + 8,"*    Args1 - description...")
        call append(line(".") + 9,"*    Args2 - description...")
        call append(line(".") + 10,"*")
        call append(line(".") + 11,"*RETURN:")
        call append(line(".") + 12,"*   0 - OK")
        call append(line(".") + 13,"*   Others - Error")
        call append(line(".") + 14,"*/")
    endif
endfunction
