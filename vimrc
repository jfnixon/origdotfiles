" .vimrc
" some of this is taken care of by sensible.vim, but we'll levae it for now.

execute pathogen#infect()

set nocompatible                " no legacy vi compatibility
syntax enable
set background=dark             " use solarized colorsheme
colorscheme solarized

let mapleader = ','             " for command-t for now

set encoding=utf-8
set showcmd                     " display incomplete commands
set sessionoptions-=options     " recommended for pathogen
filetype plugin indent on       " automatic indentation

set nowrap
set tabstop=4 shiftwidth=4      " tab is 4 spaces
set softtabstop=4               " tabs used for all indentation
set backspace=indent,eol,start  " backspace through everything in insert mode

set hlsearch					" highlight matches
set incsearch					" incremental searches
set ignorecase					" searches are case insensitive
set smartcase					" ... unless they contain at least one capital letter
set number						" show line numbers
set grepprg=ag					" use The Silver Searcher in place of grep

:nnoremap <leader>m :silent !open -a Marked\ 2.app '%:p'<cr>
map <C-n> :NERDTreeToggle<CR>

" .md extension defaults to Modula2, but we want Markdown
au BufRead,BufNewFile *.md set filetype=markdown

runtime macros/matchit.vim
