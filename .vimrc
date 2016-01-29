
execute pathogen#infect()
"set runtimepath-=~/.vim/bundle/tagbar
"set runtimepath-=~/.vim/bundle/vim-go
"
syntax on
filetype plugin indent on

set notitle

autocmd BufNewFile,BufRead *.tex set filetype=tex
autocmd FileType c,cpp set cindent tw=0
autocmd Filetype tex set makeprg=latex\ %
"set tw=80
set tabstop=4
set shiftwidth=4
set cino=:0,g0,u0,(0
set expandtab
set foldmethod=syntax
set foldlevel=20
set backspace=indent,eol,start
set showmatch
set ruler
set ignorecase
set smartcase
set winheight=45
set wildmode=longest,list
set noincsearch
set nohlsearch
set nobackup
"set mouse=ir
set mouse=
highlight SpellErrors ctermfg=Red guifg=Red
   \ cterm=underline gui=underline term=underline
let spell_auto_type = "tex,mail,text,html"
"map <F2> :w<CR>:!latex %<CR>
map <F2> :w<CR>:make<CR>
nmap <F3> :TagbarToggle<CR>
"nmap <F7> :let @/ = "<C-R><C-W>"<CR>:grep <C-R><C-W> *<CR>:cope<CR>
nmap <F7> :let @/ = "<C-R><C-W>"<CR>:Ag -s -w <C-R><C-W> *<CR>
"nmap <F8> :let @/ = "<C-R><C-W>"<CR>:!grep <C-R><C-W> *<CR>
nmap <F8> :let @/ = "<C-R><C-W>"<CR>:!ag -s -w <C-R><C-W> *<CR>
nmap <F9> :GoReferrers<CR>
nmap <F11> :qa<CR>
nmap <C-N> :cn<CR>
nmap <C-P> :cp<CR>
"nmap <C-\> :exec("stselect ".expand("<cword>"))<CR>
nmap <C-\> <Plug>(go-def-split)
nmap <Space> <Plug>(go-info)


highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=black guibg=LightGreen
highlight DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black guibg=#FFFF80
highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black gui=NONE guibg=#FFFF20
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black gui=NONE guifg=Blue guibg=LightRed

hi MatchParen cterm=none ctermbg=none ctermfg=white

"set diffopt=filler,context:3,iwhite
set diffopt=filler,context:3
set diffexpr=MyDiff()
function MyDiff()
   let opt = ""
   if &diffopt =~ "icase"
      let opt = opt . "-i "
   endif
   if &diffopt =~ "iwhite"
      let opt = opt . "-b "
   endif
   silent execute "!diff -a -d --binary " . opt . v:fname_in . " " . v:fname_new . " > " . v:fname_out
endfunction

autocmd BufNewFile,BufRead *.sc set filetype=python
autocmd BufNewFile,BufRead *.sc.BASE set filetype=python
autocmd BufNewFile,BufRead SConstruct set filetype=python
autocmd BufNewFile,BufRead *.py.BASE set filetype=python
autocmd BufNewFile,BufRead *.tex set filetype=tex tw=80 makeprg=make spell
autocmd BufNewFile,BufRead *.c.BASE set filetype=c
autocmd BufNewFile,BufRead *.cpp.BASE set filetype=cpp
autocmd BufNewFile,BufRead *.h.BASE set filetype=cpp
autocmd BufNewFile,BufRead *.java.BASE set filetype=java
autocmd BufNewFile,BufRead seriallog* set filetype=messages
autocmd BufNewFile,BufRead hostd.* set filetype=messages
autocmd BufNewFile,BufRead vmkernel.* set filetype=messages
autocmd BufNewFile,BufRead vpxa.* set filetype=messages
autocmd BufNewFile,BufRead vpxd.* set filetype=messages
autocmd BufNewFile,BufRead *.log set filetype=messages
autocmd BufNewFile,BufRead *.vmsg set filetype=conf tw=0
autocmd BufNewFile,BufRead defaultxml set filetype=xml
autocmd BufNewFile,BufRead NOTES_EDITMSG set tw=80 ai spell

autocmd BufNewFile,BufRead de:ad:be:ef:00* set filetype=sh nonumber winheight=20
autocmd BufNewFile,BufRead library set filetype=sh nonumber

autocmd BufNewFile,BufRead vsantraces* set filetype=traces nonumber
autocmd BufNewFile,BufRead Tvsantraces* set filetype=traces nonumber
autocmd BufNewFile,BufRead Tvsantraces*.* set filetype=traces nonumber

autocmd FileType c,cpp syn keyword cType vmk_uint8 vmk_int8 vmk_uint16 vmk_int16 vmk_uint32 vmk_int32 vmk_uint64 vmk_int64 vmk_uintptr_t vmk_Bool VMK_ReturnStatus vmk_ListLinks vmk_atomic64
autocmd FileType c,cpp syn keyword cType uint8 int8 uint16 int16 uint32 int32 uint64 int64 uintptr_t Bool 
autocmd FileType c,cpp syn keyword cConstant VMK_TRUE VMK_FALSE TRUE FALSE

autocmd FileType c,cpp,java,asm set cindent tw=80 fo+=croq number
autocmd FileType c,cpp,java,sh,python,make highlight OverLength ctermbg=darkred ctermfg=white
autocmd FileType c,cpp,java,sh,python,make match OverLength /\%81v.\+/
autocmd FileType c,cpp,java,sh,python,make highlight ExtraWhitespace ctermbg=darkred ctermfg=white
autocmd FileType c,cpp,java,sh,python,make 2match ExtraWhitespace /\s\+$/
"autocmd FileType c,cpp,java call matchadd('ExtraWhitespace', '\s\+$')
"autocmd FileType c,cpp,java match ExtraWhitespace /\s\+$/
autocmd FileType sh,python set nocindent cindent fo+=croq number
autocmd FileType conf set smartindent fo=croqt number
autocmd FileType messages set nowrap

" This fixes the full-pathed files opened by tags
autocmd BufRead * cd .


" Go stuff
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
"let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1


" Enable goimports to automatically insert import paths instead of gofmt:
"let g:go_fmt_command = "goimports"

" By default vim-go shows errors for the fmt command, to disable it:
"let g:go_fmt_fail_silently = 1

" Disable auto fmt on save:
"let g:go_fmt_autosave = 0

" Disable opening browser after posting your snippet to play.golang.org:
"let g:go_play_open_browser = 0

"Show type info under cursor.
"let g:go_auto_type_info = 1


"let g:tagbar_type_go = {
"    \ 'ctagstype' : 'go',
"    \ 'kinds'     : [
"        \ 'p:package',
"        \ 'i:imports:1',
"        \ 'c:constants',
"        \ 'v:variables',
"        \ 't:types',
"        \ 'n:interfaces',
"        \ 'w:fields',
"        \ 'e:embedded',
"        \ 'm:methods',
"        \ 'r:constructor',
"        \ 'f:functions'
"    \ ],
"    \ 'sro' : '.',
"    \ 'kind2scope' : {
"        \ 't' : 'ctype',
"        \ 'n' : 'ntype'
"    \ },
"    \ 'scope2kind' : {
"        \ 'ctype' : 't',
"        \ 'ntype' : 'n'
"    \ },
"    \ 'ctagsbin'  : 'gotags',
"    \ 'ctagsargs' : '-sort -silent'
"\ }

set tags=./tags,./../tags,./../../tags,./../../../tags,./../../../../tags,./../../../../../tags

autocmd Filetype sql set makeprg=runsql\ %\ 2>&1
autocmd FileType go set number fo+=croq tw=100
autocmd Filetype go set makeprg=go\ build\ .
autocmd Filetype go nmap <C-]> :exec("GoDef")<CR>