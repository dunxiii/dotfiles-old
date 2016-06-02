" Plugins {{{

call plug#begin('~/.vim/plugged')

"Plug 'ConradIrwin/vim-bracketed-paste'
"Plug 'tpope/vim-surround'
Plug 'NLKNguyen/papercolor-theme'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'unblevable/quick-scope'
Plug 'vimwiki/vimwiki'

call plug#end()

" }}}
" Plugin settings {{{

" fugitive {{{

" }}}
" lightline {{{

" Remove default line for insert/replace...
set noshowmode

" show status bar
set laststatus=2

" }}}
" nerdtree {{{

let g:NERDTreeShowBookmarks = 1

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nnoremap <expr><enter> &ft=="qf" ? "<cr>:lcl<cr>" : (getpos(".")[2]==1 ? "i<cr><esc>": "i<cr><esc>l")
map <F2> :NERDTreeToggle<CR>
let g:NERDTreeMapActivateNode='<Tab>'

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

" }}}
" papercolor-theme {{{

set t_Co=256
set background=dark
colorscheme PaperColor

" }}}
" quick-scope {{{

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']   "Use only on these keys

" }}}
" startify {{{

let g:startify_list_order = ['files', 'bookmarks']
let g:startify_files_number = 5
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
let g:startify_change_to_vcs_root = 1
let g:startify_bookmarks = [
    \ {'s': '~/.ssh/config'},
    \ {'v': '~/.vimrc'},
    \ {'z': '~/.zshrc'},
    \ {'i': '~/.i3/config'},
    \ {'wg': '~/Insync/vimwiki/general/index.md'},
    \ {'wl': '~/Insync/vimwiki/linux/index.md'},
    \ {'wn': '~/Insync/vimwiki/network/index.md'},
    \ {'ww': '~/Insync/vimwiki/work/index.md'},
    \ ]

highlight StartifyBracket ctermfg=240
highlight StartifyFooter  ctermfg=240
highlight StartifyHeader  ctermfg=114
highlight StartifyNumber  ctermfg=215
highlight StartifyPath    ctermfg=245
highlight StartifySlash   ctermfg=240
highlight StartifySpecial ctermfg=240
" }}}
" supertab {{{

let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"

" }}}
" syntastic {{{

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

" }}}
" vim-airline {{{

let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''

" }}}
" vim-gitgutter {{{

"Fix for gitgutter
highlight clear SignColumn
"Faster update
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1

" }}}
" vimwiki {{{

let g:vimwiki_hl_headers=1

let wiki = {}
let wiki.syntax = 'markdown'
let wiki.auto_toc = 1
let wiki.ext ='.md'

let wiki_1 = copy(wiki)
let wiki_1.path = '~/Insync/vimwiki/general'

let wiki_2 = copy(wiki)
let wiki_2.path = '~/Insync/vimwiki/linux/'

let wiki_3 = copy(wiki)
let wiki_3.path = '~/Insync/vimwiki/network/'

let wiki_4 = copy(wiki)
let wiki_4.path = '~/Insync/vimwiki/work/'

let g:vimwiki_list = [wiki_1, wiki_2, wiki_3, wiki_4]

" }}}
" indentLine {{{

let g:indentLine_char='⁞'

" }}}

" }}}
" Vim settings {{{

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

" disable urget flag
set noerrorbells visualbell t_vb=

let mapleader=" "
"set dictionary+=/usr/share/dict/words  " path to dictionary
set encoding=utf-8 "fileencodings=      " use utf8 by default
"set showmode				" show current mode down the bottom
"set number                 " show row numbers
set nowrap				    " dont wrap lines
set modeline                " enable modeline (ability to have vim settings in files)
set cursorline
set wildmenu                " visual menu for command completion
set lazyredraw              " redraw only when we need to.
set mouse=a                 " allow mouse interaction
set clipboard^=unnamedplus       " paste across vim's and other applications, p, ctrl+shift+v

"set colorcolumn=80         " show line at 80'th char

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

" path for vim tmp files
set directory=~/.vim//

" save undo history
set undofile
set undodir=~/.vim/undodir

"set viminfo=100,n~/.viminfo

" }}}
" Functions {{{

function! NumberToggle()
    if(&relativenumber)
        " Set absolute numbering
        set nornu nu
    else
        " Set relative numbering
        set nonu rnu
    endif
endfunc

" }}}
" Keybinds {{{

" disable Ex mode
nnoremap Q <nop>
" disable weird meny
nnoremap q: <nop>

" :Q for quit
:command! -bar -bang Q quit<bang>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" Move between splits with CTRL+[hjkl]
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Clear search results
nmap <LEADER>/ :nohl<CR>

" open ag.vim
nnoremap <leader>a :Ag

" fugitive/git shortcuts
nmap <LEADER>gw :Gw<CR>
nmap <LEADER>gc :Gcommit<CR>
nmap <LEADER>gd :Gdiff<CR>
nmap <LEADER>gs :Gstatus<CR>
nmap <LEADER>du :diffupdate<CR>
map  <LEADER>dp :diffput<CR>
map  <LEADER>dg :diffput<CR>

" markdown table of contents
nmap <LEADER>toc :Toc<CR>

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

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Runs current line as command in shell
nmap <LEADER>e :exec '!'.getline('.')<CR>

" }}}

" vim: set foldmethod=marker:
