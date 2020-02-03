set background=dark
filetype indent on      " load filetype-specific indent files

let mapleader=" "                                                   " leader is space
let &guicursor = substitute(&guicursor, 'n-v-c:', '&blinkon0-', '') " no blinking cursor

" move vertically by visual line (including wrapping)
nnoremap j gj
nnoremap k gk
" turn off search highlight with <space>,
nnoremap <leader>, :nohlsearch<CR>

set autoindent                 " copy indent from current line
set autoread                   " automatically reload changed files
set backspace=eol,start,indent " make backspace helpful
set backup                     " turn on regular backups
set backupdir=~/.vim/backup    " backup directory
set directory=~/.vim/tmp       " temp directory
set cursorline                 " highlight current line
set encoding=utf8              " be reasonable
set expandtab                  " tabs are spaces
set ignorecase                 " case fold when searching
set incsearch                  " search as characters are entered
set hlsearch                   " highlight matches
set laststatus=2               " always show the status line, NO EXCEPTIONS
set lazyredraw                 " redraw only when we need to.
set mouse=a                    " enable mouse mode
set noerrorbells               " quiet
set nowrap                     " wrap lines by default
set number                     " show line numbers
set relativenumber             " show line number distance from cursor for easy [N]j/[N]k
set smartcase                  " but don't case fold uppercase
set smarttab                   " no dumb tabs
set splitbelow                 " put new splits down
set splitright                 " put new vsplits right
set showcmd                    " show command in bottom bar
set showmatch                  " highlight matching bracket
set softtabstop=2              " number of spaces in tab when editing
set tabstop=2                  " number of visual spaces per tab
set undodir=~/.vim/backup      " undo directory is backup directory
set wildmenu                   " visual autocomplete for command menu
set wildmode=list:longest,full " configure wildmenu
syntax enable                  " enable syntax processing

" set the highlight color for extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
" highlight when entering buffer
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
" do not highlight in insert mode
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
" highlight when leaving insert mode
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
" clear matches when leaving buffer
autocmd BufWinLeave * call clearmatches()

if has("gui_macvim")
  set macligatures
  set guifont=Menlo\ Regular:h14
endif

" Unite
"
let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
let g:unite_source_history_yank_enable = 1
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nogroup --nocolor'
let g:unite_source_grep_recursive_opt = ''

" CSV
"
:filetype plugin on

" Mappings
"
let mapleader = " "
let g:mapleader = " "

" Unite
nnoremap <silent> <Leader>bb :Unite -no-hide-icon -start-insert buffer neomru/file<cr>
nnoremap <silent> <Leader>bl :Unite -no-hide-icon buffer neomru/file<cr>
nnoremap <silent> <Leader>pT :Unite -no-hide-icon -start-insert tag<cr>
nnoremap <silent> <Leader>pf :Unite -no-hide-icon -start-insert file_rec/async buffer<cr>
nnoremap <silent> <Leader>ff :Unite -no-hide-icon -start-insert file buffer<cr>
nnoremap <silent> <leader>fe :Unite -no-hide-icon -start-insert file -path=<C-R>=expand("%:p:h") . '/'<CR>
nnoremap <silent> <Leader><space>w :Unite -no-hide-icon -start-insert window<cr>
nnoremap <silent> <Leader>hh :Unite -no-hide-icon -start-insert help<cr>
nnoremap <silent> <Leader>y :Unite -no-hide-icon -start-insert register history/yank<cr>
" nnoremap <silent> <Leader><space>B :Unite -no-hide-icon -start-insert bookmark<cr>
nnoremap <silent> <Leader>ss :Unite -no-hide-icon -start-insert line<cr>
nnoremap <silent> <Leader>/ :Unite -no-hide-icon grep:.<cr>
nnoremap <silent> <Leader>hl :UniteResume<cr>
" Open file prompt with current path
nmap <leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
