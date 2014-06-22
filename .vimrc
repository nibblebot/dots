set noesckeys   " don't wait for esc timeout * MUST BE BEFORE nocompatible
set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=/home/josh/.vim/bundle/Vundle.vim
call vundle#begin()
" Let Vundle manage itself
Bundle 'gmarik/Vundle.vim'

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
call vundle#begin()

" Buffers
Plugin 'fholgado/minibufexpl.vim'

" HTML
Plugin 'gregsexton/MatchTag'

" Comments
Plugin 'The-NERD-Commenter'

" Fuzzy File finder
Plugin 'kien/ctrlp.vim'

" Nicer Sidebar File Explorer
Bundle 'scrooloose/nerdtree'

" Search files
Bundle 'ack.vim'

" Tmux Integration
Bundle 'christoomey/vim-tmux-navigator'

" MAYBE USE THESE LATER
"Plugin 'repeat.vim'
"Plugin 'matchit.zip'
"Plugin 'Raimondi/delimitMate'
"Plugin 'EasyGrep'
"Plugin 'tpope/vim-fugitive'
"Plugin 'tpope/vim-surround'
"Plugin 'juvenn/mustache.vim'
"Plugin 'UltiSnips'
"Plugin 'ZoomWin'
"Plugin 'Command-T'
"Plugin 'briancollins/vim-jst'
"Plugin 'pangloss/vim-javascript'
"Plugin 'bigfish/vim-js-beautify'
"Plugin 'jnwhiteh/vim-golang'
"Plugin 'mattn/zencoding-vim'
"Plugin 'john2x/flatui.vim'
"Plugin 'chriskempson/base16-vim'
"Plugin 'bling/vim-airline'

" Syntax Highlighting
Bundle 'kchmck/vim-coffee-script'
Bundle 'nono/vim-handlebars'

" Color Schemes
Bundle 'altercation/vim-colors-solarized'

call vundle#end()
filetype plugin indent on     " required!

syntax on
let mapleader = ','
