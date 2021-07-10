" Buffer line
let g:airline#extensions#tabline#enabled = 1

let g:NERDCreateDefaultMappings = 0

let NERDTreeChDirMode=2
let NERDTreeIgnore=['node_modules']
let NERDTreeMinimalUI=1
let NERDTreeMouseMode=3
let NERDTreeShowBookmarks=1
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
