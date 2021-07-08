" Mappings

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" fuck original usage of ;, just shortcut for : now :)
nnoremap ; :

"" Toggle NERDTree
nnoremap <leader>t :NERDTreeToggle<CR>

"" clear highlighting
nnoremap <leader>/ :nohl<CR>

" Close current buffer,  but not window
nnoremap <C-e> :Bclose<CR>

"" Navigate windows easier
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

"" Navigate buffers
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>

"" Toggle Comments Ctrl + /
nnoremap <C-_> <Plug>NERDCommenterToggle
vnoremap <C-_> <Plug>NERDCommenterToggle

"" Ctrl S Save
nnoremap <C-s> :w<CR>

"" Ctrl P FZF
nnoremap <C-p> :FZF<CR>
