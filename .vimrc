" Vundle required
set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" Keep Plugin commands between vundle#begin/end.
call vundle#begin()
" Alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/.vim/vundle')

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'L9'
Plugin 'flazz/vim-colorschemes'

" File management
Plugin 'abolish.vim'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

" Status line
Plugin 'itchyny/lightline.vim'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Build and test
Plugin 'vim-dispatch'

" Docs
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'elzr/vim-json'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Bundle 'gabrielelana/vim-markdown'

" Development
Plugin 'airblade/vim-gitgutter'
Plugin 'editorconfig-vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ekalinin/Dockerfile.vim'

" All Vundle plugins must be added before the following line
call vundle#end()

" Enable filetype-specific plugins and indenting
filetype indent plugin on

" Enable indent guides
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_color_change_percent = 3
"let g:indent_guides_guide_size = 1

" Use '|' for table ends
let g:table_mode_corner="|"

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put non-Plugin stuff after this line

" Use theme
"colorscheme visualstudio

" Change mapleader
let mapleader=","

" Don’t add empty newlines at the end of files
autocmd FileType binary setlocal noeol

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
" No backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

syntax on             " Enable syntax highlighting
set shortmess=atI     " Don’t show the intro message when starting Vim
set cursorline        " Highlight current line
set laststatus=2      " Always show status line
set nostartofline     " Don’t reset cursor to start of line when moving around.
set ruler             " Show the cursor position
set showmode          " Show the current mode
set title             " Show the filename in the window titlebar
set number            " Display line numbers

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

set scrolloff=3      " Start scrolling 3 lines before the horizontal window border

set ttyfast                   " Optimize for fast terminal connections
set encoding=utf-8 nobomb     " Use UTF-8 without BOM
set noerrorbells              " Disable error bells
"set mouse=a                   " Enable mouse in all modes
set mouse=r                   " Enable mouse in read mode

set expandtab      " Use spaces instead of tabs
set tabstop=2      " 2 spaces for tabs
set shiftwidth=2   " 2 spaces for indentation
set nofoldenable   " Disable automatic folding

set clipboard=unnamed             " Use the OS clipboard by default (on versions compiled with `+clipboard`)
set ignorecase                    " Make searching case insensitive
set smartcase                     " ... unless the query has capital letters.
set gdefault                      " Add the g flag to search/replace by default
set magic                         " Use 'magic' patterns (extended regular expressions).
set hlsearch                      " Highlight searches
set incsearch                     " Highlight dynamically as pattern is typed
set esckeys                       " Allow cursor keys in insert mode
set backspace=indent,eol,start    " Allow backspace in insert mode
set showcmd                       " Show the (partial) command as it’s being typed
set wildmenu                      " Enhance command-line completion
set showmatch                     " Show matching brackets
set paste                         " Disable indented paste
set pastetoggle=<F2>              " Use F2 shortcut for indent on paste toggle

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Search and Replace
nmap <Leader>s :%s//<Left>

" Strip trailing whitespace (,ss)
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Automatic commands
if has("autocmd")
  " Enable file type detection
  filetype on
  " Treat .md files as Markdown
  autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" Use octodown as default build command for Markdown files
autocmd FileType markdown let b:dispatch = 'octodown --live-reload %'

" Disable auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Specify which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines.
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
" Show problematic characters.
set list
