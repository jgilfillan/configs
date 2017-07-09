set nocompatible              " be iMproved, required

"-----START Vundle Config------
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

" Bundle "https://github.com/scrooloose/nerdtree.git"
Plugin 'terryma/vim-multiple-cursors'
" UltiSnips Plugin
" Track the engine.
" Plugin 'SirVer/ultisnips'

" plugin which allows you to drag visual blocks around
Plugin 'jondkinney/dragvisuals.vim.git'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" airline status line
Plugin 'bling/vim-airline' 

" colour schemes
Plugin 'jgilfillan/vim-colorschemes'

Plugin 'colepeters/spacemacs-theme.vim'

" fuzzy matcher
" Plugin 'ctrlpvim/ctrlp.vim'
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
colorscheme spacemacs-theme
" colorscheme mustang
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

" format sql
nnoremap <leader>f :%s/\s\+/ /gie <bar> %s/\s\+$//gie <bar> %s/ ,$\n\s*\(\w\+\)/\r  ,\1/e <bar> %s/dwbi./dwmart./gie <bar> %s/^where /where 1=1\rand /ie <bar> %s/\s*and 1=1\n//gie <bar> %s/^ *\(and \<bar>on \)/  \1/ie <bar> %s/^\s*,/  ,/ie <bar> %s/^select\s\+/select\r   /ie <bar> %s/^select\n\s*/select\r   /gie <cr>
" nnoremap <leader>f :%s/\s\+/ /gie <bar> %s/\s\+$//gie <bar> %s/ ,$\n\s*\(\w\+\)/\r  ,\1/e <bar> %s/dwbi./dwmart./gie <bar> %s/d_program/program_dim/gie <bar> %s/d_organisation/organisation_dim/gie <bar> %s/current_ind/latest_flag/gie <bar> %s/^where /where 1=1\rand /ie <bar> %s/\s*and 1=1\n//gie <bar> %s/^ *\(and \<bar>on \)/  \1/ie <bar> %s/^\s*,/  ,/ie <bar> %s/^select\s\+/select\r   /ie <bar> %s/^select\n\s*/select\r   /gie <cr>

" take a line of tab separated column names and make a vertical list for a
" select statement
nnoremap <leader>s V:s/\t/\r  ,/gie<ESC>ggVGguI   ggVG"+yw

" function to be called to change trailing commas to leading commas
function! TrailingToLeadingCommas()
  " Save cursor position
  let l:winview = winsaveview()
  " Reposition trailing commas
  s/\s*,\s*\n\s*/\r  ,/e
  " Move cursor to original position
  call winrestview(l:winview)
endfunction
function! TrailingToLeadingCommas()
  let cmd = a:firstline . "," . a:lastline . "s/\\s*,\\s*\\n\\s*/\\r  ,/e"
  execute cmd
endfunction
" FTC / Fix Trailing Commas
command! -range=% FTC <line1>,<line2>call TrailingToLeadingCommas() | norm! ``
"command! -range=% FTC <line1>,<line2>call TrailingToLeadingCommas()
"------------------------------------------------------------------------ 
" assign keys for dragvisuals plugin
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()
 
" Remove any introduced trailing whitespace after moving...
let g:DVB_TrimWS = 1

"----------------------------------------------------------------------------------------------------

" tab handling
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
