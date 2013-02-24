set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()

"Bundle 'gmarik/vundle'
"Bundle 'nibblebot/google-closure-linter-for-vim'
"Bundle 'altercation/vim-colors-solarized'
"Bundle 'The-NERD-Commenter'
"Bundle 'The-NERD-tree'
"Bundle 'repeat.vim'
"Bundle 'matchit.zip'
"Bundle 'Raimondi/delimitMate'
"Bundle 'ack.vim'
"Bundle 'EasyGrep'
"Bundle 'tpope/vim-fugitive'
"Bundle 'tpope/vim-surround'
"Bundle 'juvenn/mustache.vim'
"Bundle 'nono/vim-handlebars'
"Bundle 'UltiSnips'
"Bundle 'ZoomWin'
"Bundle 'fholgado/minibufexpl.vim'
"Bundle 'groenewege/vim-less'
"Bundle 'Command-T'
"Bundle 'briancollins/vim-jst'
"Bundle 'pangloss/vim-javascript'
"Bundle 'bigfish/vim-js-beautify'
"Bundle 'kchmck/vim-coffee-script'
"Bundle 'jnwhiteh/vim-golang'


filetype plugin indent on     " required!
syntax on

let mapleader = ','
let delimitMate_no_esc_mapping = 1

let g:miniBufExplorerMoreThanOne=1

"let loaded_minibufexplorer = 1
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


if has('gui_running')
    set guifont=Consolas:h15
    set guioptions=egmr
endif

set background=light


" FORMATTING
set autoindent " Maintain indent
set smartindent " Indent further within code blocks
set ts=4 sts=4 sw=4
autocmd Filetype less setl ts=2 sts=2 sw=2
autocmd Filetype scss setl ts=2 sts=2 sw=2
autocmd Filetype ruby setl ts=2 sts=2 sw=2
autocmd Filetype eruby setl ts=2 sts=2 sw=2
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable ts=2 sts=2 sw=2
"autocmd Filetype js setlocal makeprg=gjslint\ %
"autocmd Filetype js setlocal errorformat=%-P%>-----\ FILE\ \ :\ \ %f\ -----,Line\ %l\\,\ %t:%n:\ %m,%-Q
set expandtab " Tabs are spaces!
set backspace=indent,eol,start	" backspace for dummys
set linespace=0					" No extra spaces between rows
"let delimitMate_expand_cr = 1
set virtualedit=onemore				" allow for cursor beyond last character
set whichwrap=b,s,h,l,<,>,[,]	" backspace and cursor keys wrap to

" SEARCH
set showmatch "Show matching brackets
set incsearch "Incremental searches
set hlsearch "Highlight search results

set ignorecase					" case insensitive search
set smartcase					" case sensitive when uc present
set gdefault					" the /g flag on :s substitutions by default
"clearing highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>
nmap <silent> <leader>d /<<<<<<<<CR>


set mouse=a					" automatically enable mouse usage

" Color
set t_Co=256
"colorscheme solarized

" Plugin Config
"" NERDTree
let g:NERDTreeShowBookmarks=1
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.pyc$', '\~$']
let g:NERDTreeMinimalUI=1

map <Leader>p :NERDTreeToggle<CR>
" tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
" http://sourceforge.net/mailarchive/forum.php?thread_name=AANLkTinkbdoZ8eNR1X2UobLTeww1jFrvfJxTMfKSq-L%2B%40mail.gmail.com&forum_name=tmux-users

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
"
"
"" ZoomWin
map <Leader><Leader> :ZoomWin<CR>

"" MiniBufExplorer
"let g:miniBufExplMaxSize = 1
let g:miniBufExplorerMoreThanOne=2
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplShowBufNumbers = 0
let g:statusLineText='%{getcwd()}'          " current dir
let g:miniBufExplCheckDupeBufs = 0
"map <Leader>x :MBEbn<CR>
"map <Leader>z :MBEbp<CR>

set noesckeys
let g:miniBufExplUseSingleClick = 1
"let g:miniBufExplForceSyntaxEnable = 1

"" Unimpaired
" Bubble single lines
"nmap <C-Up> [e
"nmap <C-Down> ]e
" Bubble multiple lines
"vmap <C-Up> [egv
"vmap <C-Down> ]egv

"" Syntastic syntax checking
"let g:syntastic_enable_signs=1
"let g:syntastic_quiet_warnings=1

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript
au BufNewFile,BufRead *.ejs set ft=jst

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" BUFFERS
set hidden " Allow buffer switching for unsaved buffers
map <C-e> :bp<CR>:silent! bd! #<CR>

" WINDOWS
set winminheight=0				" windows can be 0 line high
map <C-q> :silent! hide<CR>

" Disable silly bells
set noerrorbells visualbell t_vb=

" BACKUPS
set backup						" backups are nice ...
"au BufWinLeave * silent! mkview  "make vim save view (state) (folds, cursor, etc)
"au BufWinEnter * silent! loadview "make vim load view (state) (folds, cursor, etc)

" CURSOR
set cursorline					" highlight current line
hi cursorline guibg=#CECCEC		" highlight bg color of current line
hi CursorColumn guibg=#333333   " highlight cursor
set scrolljump=5					" lines to scroll when cursor leaves screen
set scrolloff=5					" minimum lines to keep above and below cursor

" Command Line
if has('cmdline_info')
	set ruler										" show the ruler
	set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
	set showcmd									" show partial commands in status line and
	" selected characters/lines in visual mode
endif
set wildmenu					" show list instead of just completing
set wildmode=list:longest,full	" command <Tab> completion, list matches, then longest common part, then all.

" SESSION
set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
set history=1000					" Store a ton of history (default is 20)

" STATUS
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


""" Code folding options
"set foldmethod=syntax
"set nofoldenable
"set foldlevel=10

function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevel=99
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction
au FileType javascript call JavaScriptFold()
"au FileType javascript setl fen


" Key (re)Mappings {

" No need to use shift to execute commands
nnoremap ; :

""" EDITING
" Retabulate
map <F12> m`ggVG=``
nmap <leader>j :JSBeautify<cr>

" Insert line breaks easily
map <S-CR> m`o<ESC>``

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

"remove empty lines
map <F6> :%s/\s\+$//e<CR> 

" select all
map <Leader>a ggVG

"Ack
map <Leader>f :Ack <C-r>"<CR>
""" FILES
"Change Working Directory to that of the current file
cmap cd. cd %:p:h

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Opens an edit command with the path of the currently edited file filled in
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

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

command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(values(buffer_numbers))
endfunction
