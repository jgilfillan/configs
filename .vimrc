set nocompatible              " be iMproved, required

"-----START Vundle Config------
filetype off                  " required

" check if windows or linux and set the runtime path to include Vundle and initialize
if has('win32')
  set rtp+=~/vimfiles/bundle/Vundle.vim/
  au GUIEnter * simalt ~x   "start maximised
elseif has('unix')
  set rtp+=~/.vim/bundle/Vundle.vim
endif

" start vundle
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Bundle "https://github.com/altercation/vim-colors-solarized.git"
Bundle "https://github.com/scrooloose/nerdtree.git"
Plugin 'terryma/vim-multiple-cursors'
" UltiSnips Plugin
" Track the engine.
Plugin 'SirVer/ultisnips'

" plugin which allows you to drag visual blocks around
Plugin 'jondkinney/dragvisuals.vim.git'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" airline status line
Plugin 'bling/vim-airline' 

" colour schemes
Plugin 'flazz/vim-colorschemes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
"-----END Vundle Config-----

" Put your non-Plugin stuff after this line

"-----START Visual Config------
" Visual config
if has('win32')
  set guifont=Consolas:h10
elseif has('unix')
  " set guifont=Anonymous\ Pro\ 11
  set guifont=DejaVu\ Sans\ Mono\ 10.5
endif
set linespace=2
syntax enable
set background=dark
colorscheme mustang
"-----END Visual Config------

" Ultisnip config
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

set guioptions-=T  "remove toolbar
set guioptions-=m  "remove toolbar
set guioptions-=r  "remove toolbar
set guioptions-=L  "remove toolbar
set nu    "line numbers
set rnu    "relative line numbers
set backspace=2    " set backspace to work like normal editors
set nowrap

" tab settings
set expandtab    " insert spaces whenever tab key is pressed
set tabstop=2    " 2 spaces between tabs
set shiftwidth=2 " number of spaces characters inserted for indentation

" always show airline status line plugin
set laststatus=2

"------------------------------------------------------------------------ 
" custom mappings
" first map leader key
let mapleader = " "

" reload vimrc
nnoremap <leader>r :source $MYVIMRC<CR>

" open _vimrc
nnoremap <leader>_ :e ~\_vimrc<CR>

" save buffer
nnoremap <leader>w :w<CR>

" copy to system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" past from system clipboard
nnoremap <leader>p "+p

" copy entire file to clipboard
nnoremap <leader>Y ggVG"+y

" surround with single quotes
nnoremap <leader>' ciw'<C-r>"'<ESC>

" comment/uncomment sql
nnoremap <C-kPlus> 0i--<ESC>j0
nnoremap <C-kMinus> 0xx<ESC>j0
"------------------------------------------------------------------------ 
" assign keys for dragvisuals plugin
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()
 
" Remove any introduced trailing whitespace after moving...
let g:DVB_TrimWS = 1
