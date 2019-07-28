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
"" ~/.config/nvim/init.vim

let mapleader =","

call plug#begin('~/.config/nvim/plugged')
"call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'PotatoesMaster/i3-vim-syntax'
"Plug 'xolox/vim-easytags'
"Plug 'xolox/vim-misc'
"Plug 'majutsushi/tagbar'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-syntastic/syntastic'
"Plug 'sts10/vim-pink-moon'
Plug 'liuchengxu/space-vim-dark'
" If installed using git
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'vim-airline/vim-airline'
call plug#end()

" Some defaults
	"set bg=light
	set mouse=a
	set nohlsearch
	set clipboard=unnamedplus

" Some basic
	set nocompatible
	set number
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
	set tabstop=2       " number of visual spaces per TAB
  set softtabstop=2   " number of spaces in tab when editing
  set shiftwidth=2    " number of spaces to use for autoindent
	set expandtab       " tabs are space
	set autoindent
	set copyindent      " copy indent from the previous lineset cursorline

" Enable autocompletion (for filenames with splits):
	set wildmode=longest,list,full

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Goyo plugin makes text more readable when writing prose:
	"map <leader>f :Goyo \| set bg=light \| set linebreak<CR>
	map <leader>f :Goyo \| set bg=light \| set linebreak<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
	vnoremap <C-c> "+y
	map <C-p> "+P

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %
" Reload vimrc
  autocmd BufWritePost .vimrc source ~/.config/nvim/init.vim

" Nerd Tree Toggle
	map <C-n> :NERDTreeToggle<CR>

" Tagbar Toggle
  map <C-m> :TagbarToggle<CR>

" deoplete
  let g:deoplete#enable_at_startup = 1
	" use tab to forward cycle
	inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
	" use tab to backward cycle
	inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
	" Close the documentation window when completion is done
	autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" syntastic
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0

" colorscheme
colorscheme space-vim-dark
"set termguicolors
hi LineNr ctermbg=NONE guibg=NONE

" fzf
  nmap <Leader>f :FZF<CR>
  ":nnoremap <C-p> :FZF<CR>

" vim airline
  let g:airline#extensions#tabline#enabled = 1

" buffer switching
  ":nnoremap <Tab> :bnext<CR>
  nmap <Leader>n :bnext<CR>
  ":nnoremap <S-Tab> :bprevious<CR>
  nmap <Leader>p :bprevious<CR>
  " delete current buffer
  nmap <Leader>q :bp\|bd #<CR>

