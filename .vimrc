" .vimrc
" some of this is taken care of by sensible.vim, but we'll levae it for now.

execute pathogen#infect()

set nocompatible                " no legacy vi compatibility
syntax enable
set background=light            " use solarized colorsheme
colorscheme solarized

let mapleader = ','             " for command-t for now

set encoding=utf-8
set showcmd                     " display incomplete commands
set sessionoptions-=options     " recommended for pathogen
filetype plugin indent on

set nowrap
set tabstop=2 shiftwidth=2      "tab is 2 spaces
set expandtab                   " use spaces
set backspace=indent,eol,start  " backspace through everything in insert mode

set hlsearch     " highlight matches
set incsearch    " incremental searches
set ignorecase   " searches are case insensitive
set smartcase    " ... unless they contain at least one capital letter

" .md extension defaults to Modula2, but we want Markdown
au BufRead,BufNewFile *.md set filetype=markdown

runtime macros/matchit.vim
