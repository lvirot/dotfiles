set nocompatible                    "This must be first, because it changes other options as a side effect.
filetype off

set background=dark                 "Colorset for dark background
set cursorline                      "Highlight the screen line of the cursor with CursorLine
set nocursorcolumn                  "Highlight the screen column of the cursor with CursorColumn
set laststatus=2                    "shows: 0:never, 1:only if at least two windows, 2:always
set cmdheight=1                     "Number of screen lines to use for the command-line
set number                          "Print the line number in front of each line.
set nolist                          "Shows tabs, end of line and trailing spaces.
set listchars=tab:>-,trail:·,eol:$  "String to display 'list'
set noruler                         "Show the line and column number of the cursor position
set showcmd                         "In visual mode, show number of selected characters/line
set autoindent                      "Copy indent from current line when starting a new line
set smartindent                     "Do smart autoindenting when starting a new line. 
set shiftwidth=2                    "Number of spaces to use for each step of (auto)indent. 
set expandtab                       "In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
set tabstop=2                       "Number of spaces that a <Tab> in the file counts for.
set softtabstop=2                   "Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>.
set autoread                        "auto read when file is changed from the outside
set backspace=indent,eol,start      "Allow backspacing over everything in insert mode
set backup                          "Make a backup before overwriting a file.
set backupdir=~/.vim/bkp            "Directory for the backup file
set directory=~/.vim/tmp            "Directory to place swap files in
set fileformats=unix,dos,mac
set showmatch                       "When a bracket is inserted, briefly jump to the matching one. 
set hlsearch                        "When there is a previous search pattern, highlight all its matches.
set incsearch                       "While typing a search command, show where the pattern, as it was typed so far, matches. 
set ignorecase                      "Ignore case in search patterns.
set smartcase                       "Override the 'ignorecase' option if the search pattern contains upper case characters.
set mouse=a                         "Enable the use of the mouse. a=enabled for all modes
set nowrap                          "When on, lines longer than the width of the window will wrap and displaying continues on the next line.
set scrolloff=10                    "Do smart autoindenting when starting a new line. 
set wildmenu                        "permit completion and show possible match in command mode
set wildmode=full                   "complete with next full match ben <tab> is pressed in wildmenu
set pastetoggle=<F10>               "enable paste mode, everything inserted literally
set clipboard^=unnamed
set ttyfast                         "Improves smoothness of redrawing when there are multiple windows
set encoding=utf-8


set title
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

syntax on
filetype plugin indent on

if has("autocmd")
    " When editing a file, always jump to the last cursor position
     au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

    "When vimrc is edited, reload it
    autocmd! BufWritePost .vimrc source ~/.vimrc    
endif

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP




",n : toogle line numbers
",s : toogle show all chars
let mapleader = ","
nmap <silent> <leader>n :set number!<CR>
nmap <silent> <leader>s :set list!<CR>

if has("gui_running")
  set guioptions-=T
  set t_Co=256
  set background=light
else
  set background=dark
endif

nmap <F2> :.w !pbcopy<CR><CR>
vmap <F2> :w !pbcopy<CR><CR>


