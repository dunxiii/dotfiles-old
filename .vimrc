filetype off            " Required by Vundle

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Plugins
"call vundle#rc()
call vundle#begin()
Bundle 'gmarik/vundle'

" My Bundles here:
Plugin 'ntpeters/vim-better-whitespace'
"Bundle 'flazz/vim-colorschemes'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'klen/python-mode'
Plugin 'scrooloose/nerdtree'
"Bundle 'ervandew/supertab'
"Plugin 'tpope/vim-surround'
"Bundle 'benmills/vimux'
Plugin 'tpope/vim-fugitive'
"Bundle 'ryanoasis/vim-webdevicons'
Plugin 'altercation/vim-colors-solarized'

"Bundle 'Efficient-python-folding'
"Bundle 'python_editing'
Plugin 'bling/vim-airline'



call vundle#end()			" required
filetype plugin indent on		" required!

" Plugin settings
:let g:notes_directories = ['~/Insync/notes']
:let g:notes_suffix = '.txt'

"let g:airline_powerline_fonts = 1" pupulate airline symbos properly
"let g:airline_theme='murmur'
"let s:background='dark'

" solarized theme
set background=dark
colorscheme solarized
"let g:solarized_termcolors=256


" Settings
"set nocompatible			" be iMproved, required
"set number				" show row numbers
"set dictionary+=/usr/share/dict/words	" path to dictionary
set encoding=utf-8 fileencodings=	" use utf8 by default
set showmode				" show current mode down the bottom
"set cursorline              " show current line of cursor
"set cursorcolumn            " show current cloumn of cursor
set relativenumber          " show relative numbers instead of absolute
"set undofile               " creates file.un~ so you can allways undo changes


" Searching
" fix broken regex search
nnoremap / /\v
vnoremap / /\v
set ignorecase              " ignore letter casing
set smartcase               " if search has case letter search by it
set incsearch				" find the next match as we type the search
set hlsearch				" highlight search terms


set nowrap				    " dont wrap lines

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set laststatus=2


syntax on				" Syntax highlight on

function! NumberToggle()
  if(&relativenumber)
    set norelativenumber
    set number
  else
    set nonumber
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

" My own keybinds
" Disable arrow keys
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

nnoremap Q <nop>                " disable Ex mode

" Move between splits with CTRL+[hjkl]
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"noremap <C-n> :nohl<CR>			" Clear search results
"vnoremap <C-n> :nohl<CR>		" Clear search results
"inoremap <C-n> :nohl<CR>		" Clear search results

noremap <C-z> :update<CR>		" Updates the document
noremap <C-x> :quit<CR> 		" Quits the document

"vnoremap <Leader>s :sort<CR>		" Sort block of lines

vnoremap < <gv				" Better indentation
vnoremap > >gv				" Better indentation

cmap w!! execute 'silent w !sudo tee > /dev/null %' \| edit!
nmap <C-F11> :exec '!'.getline('.')<CR>     " Runs current line as command
