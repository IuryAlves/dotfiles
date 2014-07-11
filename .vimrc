filetype off
call pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on
autocmd vimenter * NERDTree
syntax enable
colorscheme monokai
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:pymode = 1
