
set nocompatible              " be iMproved, required

"" START Vundle Config
filetype off                  " required

" check if windows or linux and set the runtime path to include Vundle and initialize
if has('win32')
	set rtp+=~/.vim/bundle/Vundle.vim/
	au GUIEnter * simalt ~x   "start maximised
elseif has('unix')
	set rtp+=~/.vim/bundle/Vundle.vim
endif

" start vundle
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'morhetz/gruvbox'
" plugin which allows you to drag visual blocks around
Plugin 'jondkinney/dragvisuals.vim.git'
Plugin 'itchyny/lightline.vim'
Plugin 'dhruvasagar/vim-table-mode'

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
" Put your non-Plugin stuff after this line

"" General vim config
set encoding=utf-8
" show tab as an aarow, and trailing whitespace as dot
set listchars=tab:→\ ,trail:•
set list

" windows font
" set guifont=Consolas:h10
" linux font
set guifont=DejaVu\ Sans\ Mono\ 12.5
set linespace=2
syntax enable

let mapleader = " "
" default position for new splits and vsplits
set splitbelow
set splitright


" tab handling
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

colorscheme gruvbox
set bg=dark
let g:gruvbox_contrast_dark = 'soft'
set guioptions-=T  "remove toolbar
set guioptions-=m  "remove toolbar
set guioptions-=r  "remove toolbar
set guioptions-=L  "remove toolbar
" line numbers
set number
set backspace=2    " set backspace to work like normal editors
set nowrap

" always show airline status line plugin
set laststatus=2
" Table mode config
let g:table_mode_corner='|'


"" Mappings
" (f)ile related mappings
nnoremap <leader>fs :w<cr>
nnoremap <leader>feR :source ~/.vimrc<cr>
nnoremap <leader>fed :e ~/.vimrc<cr>
nnoremap <leader><leader> :

nnoremap <leader>/ :let @/=""<cr>

" Buffer realted
nnoremap <leader>bd :q<cr>

" NERDTree Mappings
nnoremap <leader>fo :NERDTreeToggle<cr>
nnoremap <leader>fn :Bookmark<cr>
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1

" Window management
nnoremap <leader>wl <C-w>l
nnoremap <leader>wj <C-w>j
nnoremap <leader>wh <C-w>h
nnoremap <leader>wk <C-w>k
nnoremap <leader>wvs :vs new<cr>
nnoremap <leader>ws :split new<cr>

"open terminal
nnoremap <leader>term :vs\|:terminal<cr><C-w>L

" copy to system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" paste from system clipboard
nnoremap <leader>p "+p

" copy entire file to clipboard
nnoremap <leader>Y ggVG"+y

" take a line of tab separated column names and make a vertical list for a
" select statement
nnoremap <leader>s V:s/\t/\r  ,/gie<ESC>ggI   ggVG"+yw

vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

" Remove any introduced trailing whitespace after moving...
let g:DVB_TrimWS = 1

"" Working with folds

function! VimDotfileFolds()
    if getline(v:lnum) =~ '^""'
        return ">1"
    elseif getline(v:lnum + 1) =~ '^""'
        return "<1"
    else
        return "="
    endif
endfunction

set foldcolumn=3
set foldmethod=expr
set foldexpr=VimDotfileFolds()

nnoremap <TAB> za
