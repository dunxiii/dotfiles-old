"-----------------------------------------------------------------------------"
" Plugins
"-----------------------------------------------------------------------------"
call plug#begin('~/.vim/plugged')

"Plug 'ConradIrwin/vim-bracketed-paste'
"Plug 'tpope/vim-surround'
Plug 'NLKNguyen/papercolor-theme'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'unblevable/quick-scope'

call plug#end()
"-----------------------------------------------------------------------------"
" Plugin settings
"-----------------------------------------------------------------------------"
" vim-gitgutter
highlight clear SignColumn          "Fix for gitgutter
let g:gitgutter_realtime = 1        "Faster update
let g:gitgutter_eager = 1

" papercolor-theme
set t_Co=256
set background=dark
colorscheme PaperColor

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

" nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <expr><enter> &ft=="qf" ? "<cr>:lcl<cr>" : (getpos(".")[2]==1 ? "i<cr><esc>": "i<cr><esc>l")
map <C-n> :NERDTreeToggle<CR>

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

au VimEnter * call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
au VimEnter * call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
au VimEnter * call NERDTreeHighlightFile('md', 'darkyellow', 'none', '#3366FF', '#151515')
au VimEnter * call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
au VimEnter * call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
au VimEnter * call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
au VimEnter * call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
au VimEnter * call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
au VimEnter * call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
au VimEnter * call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
au VimEnter * call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
au VimEnter * call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
au VimEnter * call NERDTreeHighlightFile('rb', 'Red', 'none', '#ffa500', '#151515')
au VimEnter * call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')


" vim-markdown
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_disabled = 1
autocmd VimEnter *.md :Toc                          " Open Toc directly

" quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']   "Use only on these keys
"-----------------------------------------------------------------------------"
" Vim settings
"-----------------------------------------------------------------------------"
" open .md files as markdown
autocmd BufNewFile,BufFilePre,BufReadPost *.md set filetype=markdown

" remove ugly colors from vim
highlight DiffAdd       cterm=none ctermfg=White ctermbg=Black
highlight DiffDelete    cterm=none ctermfg=Red ctermbg=Black
highlight DiffChange    cterm=none ctermfg=none ctermbg=Black
highlight DiffText      cterm=none ctermfg=Red ctermbg=none

" remove ugly gray color from vim
highlight VertSplit     cterm=none ctermfg=none ctermbg=none
highlight FoldColumn    cterm=none ctermfg=none ctermbg=none
highlight Folded        cterm=none ctermfg=none ctermbg=none

" syntax highlight enabled
syntax enable

let mapleader=" "
"set dictionary+=/usr/share/dict/words  " path to dictionary
set encoding=utf-8 "fileencodings=       " use utf8 by default
set showmode				" show current mode down the bottom
"set number                  " show row numbers
set nowrap				    " dont wrap lines

"set colorcolumn=80          " show line at 80'th char

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

" no statuse bar
set laststatus=0
"-----------------------------------------------------------------------------"
" Functions
"-----------------------------------------------------------------------------"
function! NumberToggle()
    if(&relativenumber)
        " Set absolute numbering
        set nornu nu
    else
        " Set relative numbering
        set nonu rnu
    endif
endfunc
"-----------------------------------------------------------------------------"
" Personal Keybinds
"-----------------------------------------------------------------------------"
" disable Ex mode
nnoremap Q <nop>
" disable weird meny
nnoremap q: <nop>

" Remove cursor movement after exiting insert mode
"inoremap <silent> <Esc> <Esc>`^
"autocmd InsertLeave * :normal `^
"imap <silent> <Esc> <C-O>:stopinsert<CR>

" Move between splits with CTRL+[hjkl]
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Clear search results
nmap <LEADER>/ :nohl<CR>

" fugitive/git shortcuts
nmap <LEADER>gw :Gw<CR>
nmap <LEADER>gc :Gcommit<CR>
nmap <LEADER>gd :Gdiff<CR>
nmap <LEADER>gs :Gstatus<CR>
nmap <LEADER>du :diffupdate<CR>
map <LEADER>dp :diffput<CR>
map <LEADER>dg :diffput<CR>

" Sidepanel numbers
nmap <LEADER>§ :set nonumber norelativenumber<CR>
nmap § :call NumberToggle()<CR>

" Sort block of lines
vmap <leader>s :sort<CR>

" Better indentation
vmap < <gv
vmap > >gv

" Save file as root
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Runs current line as command in shell
nmap <LEADER>e :exec '!'.getline('.')<CR>
