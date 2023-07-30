" vimrc file
set nocompatible              " Use Vim settings, rather than Vi settings
filetype off                  " Required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-commentary'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'dense-analysis/ale'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" set number lines
set nu

" set indent width
set tabstop=4
set shiftwidth=4
set expandtab

" set mouse
set mouse=a

" smart indent
set smartindent

" auto indent
set autoindent

" enable line numbers
set number

" syntax highlighting
syntax enable

" enable all auto indenting
set ai

" automatically read files when changed from the outside
set autoread

" make backspaces more powerful
set backspace=2

" ignore case when searching
set ignorecase

" when searching try to be smart about cases 
set smartcase

" highlight search results
set hlsearch

" makes search act like search in modern browsers
set incsearch

" don't redraw while executing macros (good performance config)
set lazyredraw

" for regular expressions turn magic on
set magic

" show matching brackets when text indicator is over them
set showmatch

" how many tenths of a second to blink when matching brackets
set mat=2

" no annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Other settings
set history=50
set ruler
set showcmd

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

if has("autocmd")
  filetype plugin indent on
endif
