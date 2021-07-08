call plug#begin('~/.vim/plugged')

" TSServer, Prettier, ESLint, Snippets etc.
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Beautiful nerdtree setup
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Show git status in gutter
Plug 'airblade/vim-gitgutter'

" Best comment toggle
Plug 'preservim/nerdcommenter'

" Fast fuzzy filename search
Plug 'junegunn/fzf'

" Fast project search
Plug 'jremmen/vim-ripgrep'

" :Bclose close buffer and not window
Plug 'chrismccord/bclose.vim'

" Typescript Syntax and Snippets
Plug 'HerringtonDarkholme/yats.vim'

" Multi Cursor like sublime or VS Code
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Beautiful status and buffer lines
Plug 'vim-airline/vim-airline'

" Colorscheme
Plug 'gruvbox-community/gruvbox'
call plug#end()
