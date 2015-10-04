set nocompatible        " be iMproved, required
filetype off            " Required by Vundle

"
" Plugins
"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Plugin 'ConradIrwin/vim-bracketed-paste'
"Plugin 'benmills/vimux'
"Plugin 'ervandew/supertab'
"Plugin 'flazz/vim-colorschemes'
"Plugin 'klen/python-mode'
"Plugin 'python_editing'
"Plugin 'ryanoasis/vim-webdevicons'
"Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/syntastic'
"Plugin 'tpope/vim-surround'
"Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'
"Plugin 'bling/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'easymotion/vim-easymotion'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'tpope/vim-fugitive'
Plugin 'unblevable/quick-scope'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'

call vundle#end()           " required
filetype plugin indent on   " required

"
" Plugin settings
"

" vim-notes
let g:notes_directories = ['~/dunxiii@gmail.com/tech/nix/note']
let g:notes_suffix = '.txt'
let g:notes_word_boundaries = 0
let g:notes_tab_indents = 0         "Removes tab indentation on list items
let g:notes_smart_quotes = 0

" vim-airline
"let g:airline_powerline_fonts = 1   "Populate airline symbos properly
"let g:airline_right_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_left_alt_sep= ''
"let g:airline_left_sep = ''

" solarized theme
syntax enable
"set t_Co=16     "Fix for roxterm
set background=dark
colorscheme solarized

" vim-gitgutter
highlight clear SignColumn          "Fix for gitgutter
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1

" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_quiet_messages = {
"    \ "!level":  "errors",
"    \ "type":    "style"}

" quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

"
" Vim settings
"

let mapleader=" "
"set dictionary+=/usr/share/dict/words  " path to dictionary
set encoding=utf-8 "fileencodings=       " use utf8 by default
set showmode				" show current mode down the bottom
"set cursorline              " show current line of cursor
"set cursorcolumn            " show current cloumn of cursor
set relativenumber          " show relative numbers instead of absolute
set number                  " show row numbers
"set undofile               " creates file.un~ so you can allways undo changes
set nowrap				    " dont wrap lines


" Searching
" fix broken regex search
nnoremap / /\v
vnoremap / /\v
set ignorecase              " ignore letter casing
set smartcase               " if search has case letter search by it
set incsearch				" find the next match as we type the search
set hlsearch				" highlight search terms

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set laststatus=2

"
" Functions
"

function! NumberToggle()
  if(&relativenumber)
    set nornu
    set nu
  else
    set nonu
    set rnu
    set nu
  endif
endfunc

"
" Vim Hardmode
"
inoremap <up> <nop>
vnoremap <up> <nop>
noremap <up> <nop>
inoremap <down> <nop>
vnoremap <down> <nop>
noremap <down> <nop>
inoremap <right> <nop>
vnoremap <right> <nop>
noremap <right> <nop>
inoremap <left> <nop>
vnoremap <left> <nop>
noremap <left> <nop>
"noremap h <nop>
"noremap j <nop>
"noremap k <nop>
"noremap l <nop>

" disable Ex mode
nnoremap Q <nop>
nnoremap q: <nop>

"
" Personal Keybinds
"

" Remove cursor movement after exiting insert mode
"inoremap <silent> <Esc> <Esc>`^
autocmd InsertLeave * :normal `^
"imap <silent> <Esc> <C-O>:stopinsert<CR>

" Move between splits with CTRL+[hjkl]
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Clear search results
nmap <LEADER>/ :nohl<CR>

" fugutive shortcuts
nmap <LEADER>w :Gw<CR>
nmap <LEADER>c :Gcommit<CR>
nmap <LEADER>d :Gdiff<CR>

" Sidepanel numbers
nmap <LEADER>§ :set nonumber norelativenumber<CR>
nmap § :call NumberToggle()<CR>

" Sort block of lines
vmap <leader>s :sort<CR>

" Better indentation
vmap < <gv
vmap > >gv

" Better increment/decrementing
vmap <C-a> <C-a>gv
vmap <C-x> <C-x>gv

" Save file as root
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Runs current line as command in shell
nmap <LEADER>e :exec '!'.getline('.')<CR>
