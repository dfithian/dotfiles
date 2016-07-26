" Basic stuff
"
set nocompatible
filetype off

set autoindent           " Copy indent from current line
set autoread             " Automatically reload changed files
set backspace=eol,start,indent " Make backspace helpful
set backup               " Turn on regular backups
set backupdir=~/.vim/backup
set cursorline           " Highlight the current line
set directory=~/.vim/tmp
set encoding=utf8        " Be reasonable
set expandtab            " Use spaces not tabs
set exrc                 " Read ./.vimrc
set fileformats=unix,dos,mac     " Choose line ending sanely
set grepprg=ag\ --nogroup\ --nocolor
set hidden               " Allow buffers to be hidden when not visible
set history=1000         " Remember ONE THOUSAND commands
set hlsearch             " Show search matches until :noh
set ignorecase           " Case fold when searching
set incsearch            " Highlight as the search is entered
set laststatus=2         " Always show the status line, NO EXCEPTIONS
set lazyredraw           " Don't draw while executing macros and similar
set matchtime=2          " Highlight matching bracket for 2/10ths of a second
set mouse=a              " Enable mouse mode
set noerrorbells         " Quiet
"set noshowmode           " Don't show the mode because powerline will
set nowrap               " Wrap lines by default
set nowritebackup        " No need to be too safe
set number               " Instead of showing 0 at the cursor line, show the actual line
set relativenumber       " Show line number distance from cursor for easy [N]j/[N]k
set ruler                " Show column position, but airline does no matter what
set scrolloff=7          " Keep 7 lines visible when moving through file
set secure               " Only allow safe things in ./.vimrc
set shiftwidth=2         " 2 space indent stops
set showmatch            " Highlight matching brackets
set showtabline=2        " Always show the tabline
set smartcase            " But don't case fold uppercase
set smarttab             " No dumb tabs
set splitbelow           " Put new splits down
set splitright           " Put new vsplits right
set tabstop=2            " 2 space indent stops
set textwidth=0          " Don't wrap until I tell you
set timeoutlen=2000      " Set multikey timeout to 2 seconds
set undodir=~/.vim/backup
set undofile
set vb t_vb=
set wildmenu             " Show the completion menu when tab completing
set wildmode=list:longest,full " Configure wildmenu

if has("gui_macvim")
  set macligatures
  set guifont=Fira\ Code\ Light:h10
endif
