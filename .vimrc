set noesckeys   " don't wait for esc timeout * MUST BE BEFORE nocompatible
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Let Vundle manage itself
Plugin 'gmarik/Vundle.vim'

" Buffers
Plugin 'fholgado/minibufexpl.vim'

" HTML
Plugin 'gregsexton/MatchTag'

" Comments
Plugin 'The-NERD-Commenter'

" Fuzzy File finder
Plugin 'kien/ctrlp.vim'

" Nicer Sidebar File Explorer
Plugin 'scrooloose/nerdtree'

" Search files
Plugin 'ack.vim'

" Tmux Integration
Plugin 'christoomey/vim-tmux-navigator'

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
Plugin 'kchmck/vim-coffee-script'
Plugin 'nono/vim-handlebars'

Plugin 'ShowTrailingWhitespace'
Plugin 'DeleteTrailingWhitespace'

" Color Schemes
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
filetype plugin indent on     " required!
syntax on

""" SETTINGS
"" Buffers
set hidden " Allow buffer switching for unsaved buffers

"" Color
set t_Co=256
colorscheme solarized
set background=dark
highlight ShowTrailingWhitespace term=reverse cterm=reverse ctermfg=3 guifg=Black guibg=Yellow

"" Command Line
if has('cmdline_info')
	set ruler										" show the ruler
	set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
	set showcmd									" show partial commands in status line and
	" selected characters/lines in visual mode
endif
set wildignore+=*/node_modules/*
set wildmenu					" show list instead of just completing
set wildmode=list:longest,full	" command <Tab> completion, list matches, then longest common part, then all.

"" Cursor
set cursorline					" highlight current line
hi cursorline guibg=#CECCEC		" highlight bg color of current line
hi CursorColumn guibg=#333333   " highlight cursor
set scrolljump=5					" lines to scroll when cursor leaves screen
set scrolloff=5					" minimum lines to keep above and below cursor

" no delay when escaping from insert modes
set ttimeoutlen=0

"" FORMATTING
set autoindent " Maintain indent
set smartindent " Indent further within code blocks
set ts=2 sts=2 sw=2
set expandtab " Tabs are spaces!
set backspace=indent,eol,start	" backspace for dummys
set linespace=0					" No extra spaces between rows
set whichwrap=b,s,h,l,<,>,[,]	" backspace and cursor keys wrap to

" Use the same symbols as TextMate for tabstops and EOLs
"set listchars=tab:▸\ ,eol:¬
"
let g:DeleteTrailingWhitespace_Action = 'delete'
""" Code folding options
"set foldmethod=syntax
"set nofoldenable
"set foldlevel=10

"function! JavaScriptFold()
    "setl foldmethod=syntax
    "setl foldlevel=99
    "syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    "function! FoldText()
        "return substitute(getline(v:foldstart), '{.*', '{...}', '')
    "endfunction
    "setl foldtext=FoldText()
"endfunction
"au FileType javascript call JavaScriptFold()
"au FileType javascript setl fen
"
"
"" SEARCH
set showmatch         " Show matching brackets
set incsearch         " Incremental searches
set hlsearch          " Highlight search results

set ignorecase				" case insensitive search
set smartcase					" case sensitive when uc present
set gdefault					" the /g flag on :s substitutions by default


"" SESSION
set backup						" backups are nice ...
set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
set history=1000					" Store a ton of history (default is 20)
function! InitializeDirectories()
	let separator = "."
	let parent = $HOME
	let prefix = '.vim'
	let dir_list = {
				\ 'backup': 'backupdir',
				\ 'views': 'viewdir',
				\ 'swap': 'directory' }

	for [dirname, settingname] in items(dir_list)
		let directory = parent . '/' . prefix . dirname . "/"
		if exists("*mkdir")
			if !isdirectory(directory)
				call mkdir(directory)
			endif
		endif
		if !isdirectory(directory)
			echo "Warning: Unable to create backup directory: " . directory
			echo "Try: mkdir -p " . directory
		else
			let directory = substitute(directory, " ", "\\\\ ", "")
			exec "set " . settingname . "=" . directory
		endif
	endfor
endfunction
call InitializeDirectories()

"" STATUS
set number
set shortmess+=filmnrxoOtTI			" abbrev. of messages (avoids 'hit enter')
set showmode										" display the current mode
if has('statusline')
	set laststatus=2

	" Broken down into easily includeable segments
	set statusline=%<%f\    " Filename
	set statusline+=%w%h%m%r " Options
	"set statusline+=%{fugitive#statusline()} "  Git Hotness
	set statusline+=\ [%{&ff}/%Y]            " filetype
	set statusline+=\ [%{getcwd()}]          " current dir
	"set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
	set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

""" Filetypes
autocmd Filetype python setl ts=4 sts=4 sw=4
autocmd Filetype coffee setl foldmethod=indent nofoldenable
au BufNewFile,BufRead *.json set ft=javascript
au BufNewFile,BufRead *.ejs set ft=jst

" tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
" http://sourceforge.net/mailarchive/forum.php?thread_name=AANLkTinkbdoZ8eNR1X2UobLTeww1jFrvfJxTMfKSq-L%2B%40mail.gmail.com&forum_name=tmux-users

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

set mouse=a					" automatically enable mouse usage

" Disable silly bells
set noerrorbells visualbell t_vb=

set winminheight=0				" windows can be 0 line high
let mapleader = ','
" nearest VCS root, starting from CWD
let g:ctrlp_working_path_mode = '0'

"" MiniBufExplorer
let g:miniBufExplBuffersNeeded = 0
"let g:miniBufExplShowBufNumbers = 0
let g:miniBufExplStatusLineText = '\ '
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplCycleArround = 1           " wrap around with prev/next movements

"" NERDTree
let g:NERDTreeShowBookmarks=1
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.pyc$', '\~$']
let g:NERDTreeMinimalUI=1
"""

""" COMMANDS
command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(values(buffer_numbers))
endfunction
"""

""" KEY BINDINGS
map <C-e> :MBEbd<CR>
map <Leader>a :MBEbp<CR>
map <Leader>s :MBEbn<CR>

" No need to use shift to execute commands
nnoremap ; :

" Change Working Directory to that of the current file
cmap cd. cd %:p:h

" sudo write
cmap w!! w !sudo tee % >/dev/null

" replace yank buffer in whole file
map <Leader>r :%s/<C-r>"/

" Retabulate
map <F12> m`ggVG=``

" Insert line breaks easily
map <S-CR> m`o<ESC>``

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

"remove empty lines
map <F6> :%s/\s\+$//e<CR>

" select all
map <Leader>A ggVG


"clearing highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>

map <C-q> :silent! hide<CR>
"noremap <C-J>     <C-W>j
"noremap <C-K>     <C-W>k
"noremap <C-H>     <C-W>h
"noremap <C-L>     <C-W>l
"
map <Leader>f :Ack <C-r>"<CR>

" CtrlP
map <Leader>p :CtrlP<CR>
map <Leader>b :CtrlPBuffer<CR>
nmap <Leader>t :NERDTreeToggle<CR>

" ZoomWin
map <Leader><Leader> :ZoomWin<CR>
