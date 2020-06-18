" not compatible with vi
set nocompatible


" download/install plugins if not done already
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if ! filereadable(system('echo -n "$HOME/.vim/autoload/plug.vim"'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p $HOME/.vim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > $HOME/.vim/autoload/plug.vim
  autocmd VimEnter * PlugInstall
endif

" plugins in use
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('$HOME/.vim/plugged')

Plug 'VundleVim/Vundle.vim'
Plug 'bling/vim-airline'
" Plug 'kien/ctrlp.vim'
" Plug 'nelstrom/vim-qargs'
Plug 'nelstrom/vim-visual-star-search'
Plug 'terryma/vim-multiple-cursors'
" Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
" Plug 'jalvesaq/R-Vim-runtime'
Plug 'vimwiki/vimwiki'

call plug#end()


" config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
filetype plugin on

" search subfolders, file tab completion
set path+=**

" display all matching files on tab complete
set wildmenu

set background=dark
set backspace=2
set encoding=utf-8
set hidden
set laststatus=2
set t_Co=256

set autoindent
set expandtab
set shiftwidth=2
set smartindent
set softtabstop=2

set hls
set incsearch
set ignorecase
set scrolloff=5
set smartcase
set cursorline
hi cursorline cterm=NONE ctermbg=brown ctermfg=white

set nrformats=
set ruler
set title
set titleold=

" increase key speed via a rate change
" xset r rate 300 50

" splits open to below or right instead of above or left
set splitbelow splitright

" disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" line numbers
set number relativenumber
" toggle nu/rn when entering insert mode
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END


" change cursor shape (osx/iterm) insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" do not highlight current line in insert mode
:autocmd InsertEnter,InsertLeave * set cul!

" return to last edit position when opening file and center
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"zz" |
  \ endif


" remaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" space Leader map
map <Space> <Leader>

" use Leader instead of colon to write/quit
map <Leader>w :w<CR>
map <Leader>q :q<CR>

" open file in new tab
map :ot :tabfind


" open current file (eg, html) with default program (eg,
" browser) using the osx open utility
map <Leader>P :!open %<CR>

" map gb/gB to use like gt/gT (tab) for next/prev buffer
map gb :bnext<CR>
map gB :bprev<CR>

" map g{hjkl} to use like gt/gT (tab) for moving between splits
map gj <C-w>j
map gl <C-w>l
map gh <C-w>h
map gk <C-w>k

" Q will not enter ex mode
nnoremap Q <nop>

" open help in full tab
map :h :tab h

" increase scoll lock scrolling to 5 lines
nnoremap <C-y> 5<C-y>
nnoremap <C-e> 5<C-e>

" spelling: <Leader>ss to toggle, sn[ext] sp[revious]
map <Leader>ss :setlocal spell!<CR>
map <Leader>sn ]s
map <Leader>sp [s
map <Leader>sa zg
map <Leader>s? z=

" paste: <Leader>p for paste mode, leave mode on exit
map <Leader>p :set paste<CR>i
au InsertLeave * set nopaste

" numbers: <Leader>n/rn toggles absolute/relative line numbers
map <Leader>n :set number!<CR>
map <Leader>rn :set relativenumber!<CR>

" highlight: <Leader>h/l to toggle cursorline/search highlighting
map <Leader>l :nohlsearch<CR>
map <Leader>h :set cursorline!<CR>

" use C-j/k to move lines in (normal/insert) or blocks (visual)
" note C-k (insert) is normally used for diagraph character look-up
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv


" misc auto commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" remove all trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" recompile suckless programs
autocmd BufWritePost config.h,config.def.h !sudo make install

" set highlighting by filetype
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.R,*.r,*.Rmd,*.rmd,*.Rhistory,.Rprofile set filetype=r
autocmd BufRead,BufNewFile *.tex set filetype=tex
