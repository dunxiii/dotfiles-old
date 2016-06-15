call plug#begin()

Plug 'NLKNguyen/papercolor-theme'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab' | Plug 'vimwiki/vimwiki'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'unblevable/quick-scope'

call plug#end()

let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']   "Use only on these keys

let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1

let g:vimwiki_hl_headers=1
let g:vimwiki_url_maxsave=0

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

let g:indentLine_char='⁞'

let g:NERDTreeMapActivateNode='<Tab>'

" Colors
syntax on
set background=dark
colorscheme PaperColor
hi TabLine              ctermfg=White ctermbg=none cterm=none
hi TabLineSel           ctermbg=White cterm=bold
hi TabLineFill          ctermfg=White ctermbg=none cterm=none

set directory=~/.vim//
set undofile
set undodir=~/.vim/undodir

"set encoding=utf-8
"set nowrap
"set modeline
set cursorline
set clipboard^=unnamedplus
set ignorecase
set smartcase
set incsearch
set hlsearch
"set textwidth=80
"set colorcolumn=80

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

vmap < <gv
vmap > >gv

"nnoremap / /\v
"vnoremap / /\v

function! SetProjectRoot()
  " default to the current file's directory
  lcd %:p:h
  let git_dir = system("git rev-parse --show-toplevel")
  " See if the command output starts with 'fatal' (if it does, not in a git repo)
  let is_not_git_dir = matchstr(git_dir, '^fatal:.*')
  " if git project, change local directory to git project root
  if empty(is_not_git_dir)
    lcd `=git_dir`
  endif
endfunction

function! FollowSymlink()
  let current_file = expand('%:p')
  " check if file type is a symlink
  if getftype(current_file) == 'link'
    " if it is a symlink resolve to the actual file path
    "   and open the actual file
    let actual_file = resolve(current_file)
    silent! execute 'file ' . actual_file
  end
endfunction

autocmd BufRead *
  \ call FollowSymlink() |
  \ call SetProjectRoot()

autocmd CursorMoved silent *
  \ if &filetype == 'netrw' |
  \   call FollowSymlink() |
  \   call SetProjectRoot() |
  \ endif

let mapleader=" "

nmap q: <nop>
nmap q/ <nop>
nmap q? <nop>
nmap Q <nop>

map <F2> :NERDTreeToggle<CR>
map <F3> :set hlsearch!<CR>
map <F4> :set colorcolumn=80<CR>
:set pastetoggle=<F10>

nmap <LEADER>gw :Gw<CR>
nmap <LEADER>gc :Gcommit<CR>
nmap <LEADER>gd :Gdiff<CR>
nmap <LEADER>gs :Gstatus<CR>
nmap <LEADER>du :diffupdate<CR>
nmap <LEADER>dp :diffput<CR>
nmap <LEADER>dg :diffput<CR>

nmap <LEADER>pi :PlugInstall<CR>
nmap <LEADER>pc :PlugClean<CR>
nmap <LEADER>pu :PlugUpdate<CR>

cmap w!! w !sudo tee > /dev/null %
