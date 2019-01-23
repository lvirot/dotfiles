set nocompatible

if !empty(glob("~/.vim/autoload/plug.vim"))
  call plug#begin('~/.vim/plugged')
    Plug 'w0rp/ale'
    Plug 'mengelbrecht/lightline-bufferline'
    Plug 'critiqjo/vim-bufferline'
    Plug 'itchyny/lightline.vim'
    Plug 'tpope/vim-fugitive'
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'tmhedberg/SimpylFold'
    Plug 'flazz/vim-colorschemes'
    Plug 'maralla/completor.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'nathanalderson/yang.vim', { 'for': 'yang' }
    Plug 'majutsushi/tagbar', { 'on':  'TagbarToggle' }
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'will133/vim-dirdiff'
  call plug#end()
endif

filetype plugin indent on

syntax on
silent! colorscheme elflord
silent! colorscheme summerfruit256

if !isdirectory("$HOME.'/.vim/tmp'") | silent! call mkdir ($HOME.'/.vim/tmp', 'p') | endif
if !isdirectory("$HOME.'/.vim/bkp'") | silent! call mkdir ($HOME.'/.vim/bkp', 'p') | endif
if !isdirectory("$HOME.'/.vim/undo'") | silent! call mkdir ($HOME.'/.vim/undo', 'p') | endif

set autoindent                      "Copy indent from current line when starting a new line
set autoread                        "auto read when file is changed from the outside
set backspace=indent,eol,start      "Allow backspacing over everything in insert mode
set backupdir=~/.vim/bkp
set directory=~/.vim/tmp            "Directory to place swap files in
set encoding=utf-8
set hlsearch                        "When there is a previous search pattern, highlight all its matches.
set incsearch                       "While typing a search command, show where the pattern, as it was typed so far, matches.
set laststatus=2                    "shows: 0:never, 1:only if at least two windows, 2:always
set showcmd                         "In visual mode, show number of selected characters/line
set fileencoding=utf-8
set undodir=~/.vim/undo
set wildmenu                        "permit completion and show possible match in command mode

set title
set scrolloff=10
set number                          "Print the line number in front of each line.
set listchars=tab:>-,trail:·,eol:$  "String to display 'list'
set ignorecase                      "Ignore case in search patterns.
set smartcase                       "Override the 'ignorecase' when  search contains upper case.
set mouse=a                         "Enable the use of the mouse. a=enabled for all modes
set pastetoggle=<F10>               "enable paste mode, everything inserted literally
set clipboard^=unnamed
set smartindent                     "Do smart autoindenting when starting a new line.
set expandtab                       "In Insert mode: Replace <Tab> per space.
set shiftwidth=2                    "Number of spaces to use for each step of (auto)indent.
set tabstop=2                       "Number of spaces that a <Tab> in the file counts for.
set softtabstop=2                   "Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>.
set foldmethod=indent
set foldlevel=99
set showmatch                       "When a bracket is inserted, briefly jump to the matching one.
set formatoptions+=ro               "Add comment_leader when o/O on normal and Enter on insert
set hidden                          "Make possible to change buffer without saving current
set showtabline=2
set backup                          "Make a backup before overwriting a file.
set undofile
set wildmode=longest:list,full
if &runtimepath !~'lightline' | set statusline=\ %n\ %F\ %m\ %r\ [%{&ff}]\ %y\ %=%5l/%L\ (%p%\%)\ %4v\ 0x%02B\ | endif


let mapleader = "\<space>"
nnoremap <silent><leader>n :set number!<cr>
nnoremap <silent><leader>s :set list!<cr>
nnoremap <silent><leader>v :vsplit $MYVIMRC<cr>
nnoremap <silent><leader>t :TagbarToggle<cr>
nnoremap <silent><leader>f :NERDTreeToggle<cr>
nnoremap <silent><leader>F :Lexplore<cr>
nnoremap <silent><leader>= :ALEFix<cr>
nnoremap <silent><leader><space> za
nnoremap <silent>1 :1b<CR>
nnoremap <silent>2 :2b<CR>
nnoremap <silent>3 :3b<CR>
nnoremap <silent>4 :4b<CR>
nnoremap <silent>5 :5b<CR>
nnoremap <silent>6 :6b<CR>
nnoremap <silent>7 :7b<CR>
nnoremap <silent>8 :8b<CR>
nnoremap <silent>9 :9b<CR>
nnoremap <silent>q :bd<cr>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  au BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  au InsertEnter * set cursorline
  au InsertLeave * set nocursorline
  au FileType python set textwidth=79
  au FileType python set colorcolumn=80
endif

let g:python_highlight_all = 1
let b:ale_fixers = {'python': ['yapf']}
let g:ale_python_flake8_options = '--ignore=E125,E305'
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 15
let g:NERDTreeMinimalUI = 1
let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''
let g:lightline = { 'tab' : {'active': ['tabnum'], 'inactive': ['tabnum']}}
let g:lightline.active = {'left': [['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified']]}
let g:lightline.tabline = {'left': [['tabs'], ['bufferline']]}
if &runtimepath =~ 'bufferline' | let g:lightline.component = {'lineinfo': '%l/%L  : %-2v', 'bufferline': '%{bufferline#refresh_status()}'.bufferline#get_status_string('TabLineSel', 'LightLineLeft_tabline_tabsel_1')} | endif
let g:lightline.component_function = {'gitbranch': 'fugitive#head',}
let g:lightline.separator = {'left': '', 'right': '' }
let g:lightline.subseparator = {'left': '', 'right': ''}
