"                   .
"    ##############..... ##############
"    ##############......##############
"      ##########..........##########
"      ##########........##########
"      ##########.......##########
"      ##########.....##########..
"      ##########....##########.....
"    ..##########..##########.........
"  ....##########.#########.............
"    ..################JJJ............
"      ################.............
"      ##############.JJJ.JJJJJJJJJJ
"      ############...JJ...JJ..JJ  JJ
"      ##########....JJ...JJ..JJ  JJ
"      ########......JJJ..JJJ JJJ JJJ
"      ######    .........
"                  .....
"
"" ~/.vimrc

" The most basic .vimrc

" spaces not tabs
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" set line numbers by default
set number

" syntax highlighting
syntax on

" clipboard setting - for system - this sets
" the default behaviour of vim to copy anything to
" the system clipboard not the vim buffer
set clipboard=unnamedplus
