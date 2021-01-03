" Install vim-packager if not found
if empty(glob('~/.vim/pack/packager/opt/vim-packaer'))
  silent !mkdir -p ~/.vim/pack/packager/opt
  silent !git clone --depth=1 --quiet https://github.com/kristijanhusak/vim-packager ~/.vim/pack/packager/opt/vim-packager
  autocmd VimEnter * silent !PackagerInstall | echo "vim-packager: INSTALLED"
endif

" Setup vim-packager
if &compatible
  set nocompatible
endif

function! s:packager_init(packager) abort
  call a:packager.add('kristijanhusak/vim-packager', { 'type': 'opt' })
  call a:packager.add('junegunn/fzf', { 'do': './install --all && ln -s $(pwd) ~/.fzf'})
  call a:packager.add('junegunn/fzf.vim')
  call a:packager.add('Shougo/deoplete.nvim')
  call a:packager.add('autozimu/LanguageClient-neovim', { 'do': 'bash install.sh' })
  call a:packager.add('morhetz/gruvbox')
  call a:packager.add('hrsh7th/vim-vsnip-integ', {'requires': ['hrsh7th/vim-vsnip'] })
  call a:packager.add('flazz/vim-colorschemes')
  call a:packager.add('wincent/command-t')
  call a:packager.add('kien/ctrlp.vim')
  call a:packager.add('scrooloose/nerdtree')
  call a:packager.add('itchyny/lightline.vim')
  call a:packager.add('tpope/vim-dispatch')
  call a:packager.add('dhruvasagar/vim-table-mode')
  call a:packager.add('vim-pandoc/vim-pandoc')
  call a:packager.add('vim-pandoc/vim-pandoc-syntax')
  call a:packager.add('gabrielelana/vim-markdown')
  call a:packager.add('airblade/vim-gitgutter')
  call a:packager.add('editorconfig/editorconfig-vim')
  call a:packager.add('nathanaelkane/vim-indent-guides')
  call a:packager.add('tomtom/tcomment_vim')
  call a:packager.add('tpope/vim-fugitive')
  "call a:packager.add('lewis6991/gitsigns.nvim', {'requires': 'nvim-lua/plenary.nvim'})
  "call a:packager.add('vim-airline/vim-airline')
  "call a:packager.add('vim-airline/vim-airline-themes')
  "call a:packager.local('~/my_vim_plugins/my_awesome_plugin')

  " Provide full URL; useful if you want to clone from somewhere else than Github.
  "call a:packager.add('https://my.other.public.git/tpope/vim-fugitive.git')

  "Provide SSH-based URL; useful if you have write access to a repository and wish to push to it
  "call a:packager.add('git@github.com:mygithubid/myrepo.git')

  "Loaded only for specific filetypes on demand. Requires autocommands below.
  call a:packager.add('kristijanhusak/vim-js-file-import', { 'do': 'npm install', 'type': 'opt' })
  call a:packager.add('fatih/vim-go', { 'do': ':GoInstallBinaries', 'type': 'opt' })
  call a:packager.add('sonph/onehalf', {'rtp': 'vim/'})
  call a:packager.add('elzr/vim-json', { 'type': 'opt' })
  call a:packager.add('ekalinin/Dockerfile.vim', { 'type': 'opt' })
  call a:packager.add('powerline/powerline', { 'type': 'opt' })
  "call a:packager.add('neoclide/coc.nvim', { 'do': function('InstallCoc') })
  "call a:packager.add('haorenW1025/completion-nvim', {'requires': [
  "\ ['nvim-treesitter/completion-treesitter', {'requires': 'nvim-treesitter/nvim-treesitter'}],
  "\ {'name': 'steelsojka/completion-buffers', 'opts': {'type': 'opt'}},
  "\ 'kristijanhusak/completion-tags',
  "\ ]})
endfunction

packadd vim-packager
call packager#setup(function('s:packager_init'))

" Install Vundle if not found
"if empty(glob('~/.vim/bundle/Vundle.vim'))
"  silent !mkdir -p ~/.vim/bundle
"  silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"endif

"if !empty(glob("~/.vim/bundle/Vundle.vim"))
  " Vundle required
"  set nocompatible
"  filetype off

  " Set the runtime path to include Vundle and initialize
"  set rtp+=~/.vim/bundle/Vundle.vim
  " Keep Plugin commands between vundle#begin/end.
"  call vundle#begin()
  " Alternatively, pass a path where Vundle should install plugins
  "call vundle#begin('~/.vim/vundle')

  " Let Vundle manage Vundle, required
"  Plugin 'VundleVim/Vundle.vim'

"  Plugin 'flazz/vim-colorschemes'

  " File management
"  Plugin 'git://git.wincent.com/command-t.git'
"  Plugin 'kien/ctrlp.vim'
"  Plugin 'scrooloose/nerdtree'

  " Status line
"  Plugin 'itchyny/lightline.vim'
  "Plugin 'vim-airline/vim-airline'
  "Plugin 'vim-airline/vim-airline-themes'

  " Build and test
"  Plugin 'vim-dispatch'

  " Docs
"  Plugin 'dhruvasagar/vim-table-mode'
"  Plugin 'elzr/vim-json'
"  Plugin 'vim-pandoc/vim-pandoc'
"  Plugin 'vim-pandoc/vim-pandoc-syntax'
"  Bundle 'gabrielelana/vim-markdown'

  " Development
"  Plugin 'airblade/vim-gitgutter'
"  Plugin 'editorconfig/editorconfig-vim'
"  Plugin 'nathanaelkane/vim-indent-guides'
"  Plugin 'tomtom/tcomment_vim'
"  Plugin 'tpope/vim-fugitive'
"  Plugin 'ekalinin/Dockerfile.vim'

  " All Vundle plugins must be added before the following line
"  call vundle#end()

  " Enable filetype-specific plugins and indenting
"  filetype indent plugin on

  " Enable indent guides
  "let g:indent_guides_enable_on_vim_startup = 1
  "let g:indent_guides_color_change_percent = 3
  "let g:indent_guides_guide_size = 1

  " Use '|' for table ends
"  let g:table_mode_corner="|"

  " Brief help
  " :PluginList       - lists configured plugins
  " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
  " :PluginSearch foo - searches for foo; append `!` to refresh local cache
  " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

  " see :h vundle for more details or wiki for FAQ
  " Put non-Plugin stuff after this line
"endif

" Use theme
"colorscheme visualstudio

" Change mapleader
let mapleader=","

" Don’t add empty newlines at the end of files
autocmd FileType binary setlocal noeol

" Centralize backups, swapfiles and undo history
if !isdirectory("~/.vim/backup")
  silent !mkdir -p ~/.vim/backup
endif
if exists("&backupdir")
  set backupdir=~/.vim/backup
endif
" No backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*
if !isdirectory("~/.vim/swap")
  silent !mkdir -p ~/.vim/swap
endif
if exists("&directory")
  set directory=~/.vim/swap
endif
if !isdirectory("~/.vim/undo")
  silent !mkdir -p ~/.vim/undo
endif
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
