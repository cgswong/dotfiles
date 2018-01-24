"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state(expand('~/.cache/dein'))
  call dein#begin(expand('~/.cache/dein'))

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " Custom plugins
  " Lazy load on insert mode
  " call dein#add('Shougo/deoplete.nvim', {'on_i': 1})
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  " Lazy load on command executed
  call dein#add('scrooloose/nerdtree', {'on_cmd': 'NERDTreeToggle'})
  call dein#add('neomake/neomake')
  call dein#add('roxma/python-support.nvim')
  call dein#add('roxma/nvim-completion-manager')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('tpope/vim-fugitive')
  call dein#add('eugen0329/vim-esearch')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('vim-pandoc/vim-pandoc')
  call dein#add('vim-pandoc/vim-pandoc-syntax')
  call dein#add('iCyMind/NeoSolarized')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" Python virtualenv
let g:python_host_prog = '/Users/cgwong/.pyenv/versions/neovim2/bin/python'
" Python 3 virtualenv
let g:python3_host_prog = '/Users/cgwong/.pyenv/versions/neovim3/bin/python'
" Ruby rbenv setup
let g:ruby_host_prog = '~/.rbenv/versions/2.5.0/bin/neovim-ruby-host'

" Map the leader key to comma
let mapleader=","

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

set nofoldenable   " Disable automatic folding.
set number         " Show line numbers on LHS.
set tabstop=2      " Render TABs using this many spaces.
set shiftwidth=4   " Indentation amoutn for < and > commands.
set expandtab      " Insert spaces when TAB is pressed.
set gdefault       " Use 'g' flag by default with :s/foo/bar/.
set termguicolors
