set nocompatible

let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if filereadable(vundle_readme) 
  filetype off
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'tmhedberg/SimpylFold'
    Plugin 'vim-syntastic/syntastic'
    Plugin 'jnurmine/Zenburn'
    Plugin 'vim-airline/vim-airline'
    Plugin 'tpope/vim-fugitive'
    Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'majutsushi/tagbar'
    Bundle 'scrooloose/nerdtree'
    Bundle 'Valloric/YouCompleteMe'
  call vundle#end()
endif
filetype plugin indent on

syntax on
if match(&runtimepath, 'Zenburn') != -1
  colorscheme zenburn
endif


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


" Default settings
"set background=dark                 "Colorset for dark background
"set nocursorline                    "Highlight the screen line of the cursor with CursorLine
"set nocursorcolumn                  "Highlight the screen column of the cursor with CursorColumn
"set cmdheight=1                     "Number of screen lines to use for the command-line
"set nolist                          "Shows tabs, end of line and trailing spaces.
"set noruler                         "Show the line and column number of the cursor position
"set wildmode=full                   "complete with next full match ben <tab> is pressed in wildmenu
"set ttyfast                         "Improves smoothness of redrawing when there are multiple windows
"set lazyredraw
"set fileformats=unix,dos,mac
"set encoding=utf-8

let mapleader = ","
",n : toogle line numbers
nmap <silent> <leader>n :set number!<CR>
",s : toogle show all chars
nmap <silent> <leader>s :set list!<CR>
",v : edit vimrc
nmap <Leader>v :e $MYVIMRC<CR>
" Enable folding with spacebar
nnoremap <space> za
nmap <F5> <Esc>:w<CR>:clear;!python3  %<CR>

if has("autocmd")
  " When editing a file, always jump to the last cursor position
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  "When vimrc is edited, reload it
  au! BufWritePost vimrc.new source ~/vimrc.new

  " Python, PEP-008
  highlight BadWhitespace ctermbg=red guibg=red
  au BufRead,BufNewFile *.py,*.pyw set textwidth=79
  au BufRead,BufNewFile *.py,*.pyw set tabstop=4
  au BufRead,BufNewFile *.py,*.pyw set softtabstop=4
  au BufRead,BufNewFile *.py,*.pyw set shiftwidth=4
  au         BufNewFile *.py,*.pyw set fileformat=unix
  au BufRead,BufNewFile *.py,*.pyw let b:comment_leader = '#'
  au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
  au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /\s\+$/
  au BufRead,BufNewFile *.py,*.pyw let python_highlight_all=1
endif

"augroup numbertoggle
"  au!
"  au BufEnter,FocusGained,InsertLeave * set norelativenumber
"  au BufLeave,FocusLost,InsertEnter   * set relativenumber
"augroup end
augroup myCursorLine
  au!
  au InsertEnter * set cursorline
  au InsertLeave * set nocursorline
augroup end

if match(&runtimepath, 'vim-airline') != -1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_powerline_fonts = 1
" let g:airline_extensions = ['tabline']
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


if match(&runtimepath, 'syntastic') != -1
  let g:syntastic_mode_map = { 'mode': 'passive' }
  let g:syntastic_python_checkers=['flake8', 'python3']
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 0
  let g:syntastic_check_on_wq = 1
  let g:syntastic_loc_list_height=3
  "let g:syntastic_python_flake8_args='--ignore=E501'
  nmap <Leader>c :SyntasticToggleMode<CR>
endif

if match(&runtimepath, 'nerdtree') != -1
  let NERDTreeMinimalUI = 1
"  au vimenter * NERDTree
"  au vimEnter * wincmd p
  au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  nnoremap <Leader>f :NERDTreeToggle<Enter>
endif

if match(&runtimepath, 'tagbar') != -1
  nnoremap <Leader>t :TagbarToggle<Enter>
endif

if match(&runtimepath, 'YouCompleteMe') != -1
  map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
  let g:ycm_autoclose_preview_window_after_completion=1
endif
