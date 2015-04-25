" Core settings
set nocompatible			" be iMproved, required
filetype off				" required

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %


" Plugins
"call vundle#rc()
call vundle#begin()
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'ntpeters/vim-better-whitespace'
Bundle 'flazz/vim-colorschemes'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-notes'
Bundle 'klen/python-mode'
Bundle 'scrooloose/nerdtree'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-surround'
"Bundle 'benmills/vimux'
"Bundle 'tpope/vim-fugitive'

"Bundle 'Efficient-python-folding'
"Bundle 'python_editing'
"Bundle 'bling/vim-airline'
"

call vundle#end()			" required
filetype plugin indent on		" required!



"let g:airline_powerline_fonts = 1	" pupulate airline symbos properly
"let g:airline_theme='murmur'
"let s:background='dark'

" Settings
set number				" show row numbers
set dictionary+=/usr/share/dict/words	" path to dictionary
set encoding=utf-8 fileencodings=	" use utf8 by default
set showmode				" show current mode down the bottom

set incsearch				" find the next match as we type the search
set hlsearch				" highlight search terms
set nowrap				" dont wrap lines

set laststatus=2


syntax on				" Syntax highlight on

colorscheme jellybeans			" Set colorsheme


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

noremap <C-n> :nohl<CR>			" Clear search results
vnoremap <C-n> :nohl<CR>		" Clear search results
inoremap <C-n> :nohl<CR>		" Clear search results

noremap <C-z> :update<CR>		" Updates the document

vnoremap <Leader>s :sort<CR>		" Sort block of lines

vnoremap < <gv				" Better indentation
vnoremap > >gv				" Better indentation

cmap w!! execute 'silent w !sudo tee > /dev/null %' \| edit!
