set fenc=utf-8
set backup
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp
set viminfo+=n~/.vim/tmp/viminfo
set noundofile
set autoread
set hidden
set ambiwidth=double

" editor config.
set virtualedit=onemore
set backspace=indent,eol,start
set smartindent
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set history=10000
set clipboard+=unnamed
inoremap <silent> jj <ESC>

" visual config.
syntax on
set title
set number
set ruler
set cursorline
set scrolloff=8
set showcmd
set showmatch
set matchtime=1
set laststatus=2
set wildmode=list:longest
set list
set listchars=tab:▸-,trail:･,nbsp:%,eol:↵,extends:❯,precedes:❮
set pumheight=10
set display=lastline

" search config.
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch

" vim-plug config
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'cohama/lexima.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

call plug#end()

" NERDTree config
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
