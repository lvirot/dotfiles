set nocompatible

if filereadable(expand('~/.vim/bundle/Vundle.vim/README.md'))
  filetype off
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'tmhedberg/SimpylFold'
    Plugin 'w0rp/ale'
    Plugin 'vim-airline/vim-airline'
    Plugin 'tpope/vim-fugitive'
    Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'majutsushi/tagbar'
    Plugin 'flazz/vim-colorschemes'
    Plugin 'jiangmiao/auto-pairs'
"    Plugin 'scrooloose/nerdtree'
    Plugin 'nathanalderson/yang.vim'
    Plugin 'maralla/completor.vim'
"    Plugin 'davidhalter/jedi-vim'
"    Plugin 'vim-syntastic/syntastic'
"    Plugin 'xolox/vim-colorscheme-switcher'
"    Plugin 'xolox/vim-misc'
"    Plugin 'Valloric/YouCompleteMe'
  call vundle#end()
endif
filetype plugin indent on

syntax on
colorscheme summerfruit256

set title
set scrolloff=10
set number                          "Print the line number in front of each line.
set nowrap                          "When on, lines longer than the width of the window will wrap and displaying continues on the next line.
set listchars=tab:>-,trail:·,eol:$  "String to display 'list'
set wildmenu                        "permit completion and show possible match in command mode
set showcmd                         "In visual mode, show number of selected characters/line
set laststatus=2                    "shows: 0:never, 1:only if at least two windows, 2:always
set hlsearch                        "When there is a previous search pattern, highlight all its matches.
set incsearch                       "While typing a search command, show where the pattern, as it was typed so far, matches.
set ignorecase                      "Ignore case in search patterns.
set smartcase                       "Override the 'ignorecase' option if the search pattern contains upper case characters.
set mouse=a                         "Enable the use of the mouse. a=enabled for all modes
set pastetoggle=<F10>               "enable paste mode, everything inserted literally
set clipboard^=unnamed
set backspace=indent,eol,start      "Allow backspacing over everything in insert mode
set autoindent                      "Copy indent from current line when starting a new line
set smartindent                     "Do smart autoindenting when starting a new line.
set expandtab                       "In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
set shiftwidth=2                    "Number of spaces to use for each step of (auto)indent.
set tabstop=2                       "Number of spaces that a <Tab> in the file counts for.
set softtabstop=2                   "Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>.
set foldmethod=indent
set foldlevel=99
set showmatch                       "When a bracket is inserted, briefly jump to the matching one.
set autoread                        "auto read when file is changed from the outside
set backup                          "Make a backup before overwriting a file.
set backupdir=~/.vim/bkp            "Directory for the backup file
set directory=~/.vim/tmp            "Directory to place swap files in
set ttyfast                         "Improves smoothness of redrawing when there are multiple windows
set lazyredraw

" Default settings
"set background=dark                 "Colorset for dark background
"set nocursorline                    "Highlight the screen line of the cursor with CursorLine
"set nocursorcolumn                  "Highlight the screen column of the cursor with CursorColumn
"set cmdheight=1                     "Number of screen lines to use for the command-line
"set nolist                          "Shows tabs, end of line and trailing spaces.
"set noruler                         "Show the line and column number of the cursor position
"set wildmode=full                   "complete with next full match ben <tab> is pressed in wildmenu
"set fileformats=unix,dos,mac
"set encoding=utf-8

let mapleader = "\<space>"
let maplocalleader="\<space>"
nnoremap <silent> <leader>n :set number!<CR>
nnoremap <silent> <leader>s :set list!<CR>
nnoremap <leader>v :e $MYVIMRC<CR>
nnoremap <leader><space> za
nnoremap <F5> <Esc>:w<CR>:clear;!python3  %<CR>
nnoremap <leader>q :bp<CR>
nnoremap <leader>w :bn<CR>
nnoremap <leader>1 :1b<CR>
nnoremap <leader>2 :2b<CR>
nnoremap <leader>3 :3b<CR>
nnoremap <leader>4 :4b<CR>
nnoremap <leader>5 :5b<CR>
nnoremap <leader>6 :6b<CR>
nnoremap <leader>7 :7b<CR>
nnoremap <leader>8 :8b<CR>
nnoremap <leader>9 :9b<CR>
nnoremap <leader>0 :10b<CR>


if has("autocmd")
  " When editing a file, always jump to the last cursor position
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  augroup refreshVimRc
    au!
    au BufWritePost $MYVIMRC source $MYVIMRC | AirlineRefresh
    au BufWritePost $MYVIMRC AirlineRefresh
  augroup end

  augroup myCursorLine
    au!
    au InsertEnter * set cursorline
    au InsertLeave * set nocursorline
  augroup end

  " Python, PEP-008
  highlight BadWhitespace ctermbg=red guibg=red
  au BufRead,BufNewFile *.py,*.pyw set textwidth=79
  au BufRead,BufNewFile *.py,*.pyw set tabstop=4
  au BufRead,BufNewFile *.py,*.pyw set softtabstop=4
  au BufRead,BufNewFile *.py,*.pyw set shiftwidth=4
  au         BufNewFile *.py,*.pyw set fileformat=unix
  au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
  au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /\s\+$/
  au BufRead,BufNewFile *.py,*.pyw let b:comment_leader='#'
  au BufRead,BufNewFile *.py,*.pyw let python_highlight_all=1
  au BufRead,BufNewFile *.py,*.pyw set colorcolumn=80
  au FileType python nnoremap <LocalLeader>= :ALEFix<CR>
endif

if &runtimepath =~'vim-airline'
  let g:airline#extensions#tabline#enabled = 1
  "let g:airline#extensions#ale#enabled = 1
  let g:airline_powerline_fonts = 1
else
  set statusline=%n\                  "buffer number
  set statusline+=%F\                 "full path
  set statusline+=%m                  "modified flag
  set statusline+=%r                  "Readonly flag
  set statusline+=[%{&ff}]            "file format
  set statusline+=%y\                 "file type
  set statusline+=%=%5l               "current line
  set statusline+=/%L\                "total lines
  set statusline+=(%p%%)\             "percentage
  set statusline+=%4v\                "virtual column number
  set statusline+=0x%02B\             "character under cursor
endif

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

if &runtimepath =~ 'syntastic'
  let g:syntastic_mode_map = { 'mode': 'passive' }
  let g:syntastic_python_checkers=['flake8', 'python3']
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 0
  let g:syntastic_check_on_wq = 1
  let g:syntastic_loc_list_height=3
  "let g:syntastic_python_flake8_args='--ignore=E501'
  nnoremap <Leader>c :SyntasticToggleMode<CR>
endif

if &runtimepath =~ 'ale'
  let b:ale_fixers = {'python': ['yapf']}
  let g:ale_python_flake8_options = '--ignore=E125,E305'
  let g:ale_sign_error = '•'
  let g:ale_sign_warning = '--'
  let g:ale_echo_msg_error_str = 'E'
  let g:ale_echo_msg_warning_str = 'W'
  "let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
endif

if &runtimepath =~ 'nerdtree'
  let NERDTreeMinimalUI = 1
  au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  nnoremap <Leader>f :NERDTreeToggle<CR>
else
  let g:netrw_banner = 0
  let g:netrw_liststyle = 3
  let g:netrw_browse_split = 4
  "let g:netrw_altv = 1
  let g:netrw_winsize = 15
  nnoremap <Leader>f :Lexplore<CR>
  autocmd FileType netrw nnoremap q :bd<CR>
endif

if &runtimepath =~ 'tagbar'
  nnoremap <Leader>t :TagbarToggle<CR>
endif

if &runtimepath =~ 'YouCompleteMe'
  nnoremap <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
  let g:ycm_autoclose_preview_window_after_completion = 1
endif


