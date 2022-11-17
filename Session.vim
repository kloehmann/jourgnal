let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Documents/jourgnal/lua
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +4 jourgnal.lua
badd +1 1
badd +1 inbox.md
badd +17 ~/org/01_tasks/01_home/orgtool.md
badd +21 ~/Documents/jourgnal/doc/jourgnal.txt
badd +1 ~/Documents/jourgnal/.gitignore
badd +1 terminal
badd +14 ~/Documents/jourgnal/plugin/jourgnal.vim
badd +53 jourgnal/config.lua
badd +6 jourgnal/utils.lua
badd +20 term://~/Documents/jourgnal/lua//63167:/bin/zsh
badd +16 jourgnal/tasks.lua
argglobal
%argdel
edit jourgnal.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 30 + 141) / 283)
exe 'vert 2resize ' . ((&columns * 125 + 141) / 283)
exe '3resize ' . ((&lines * 23 + 25) / 50)
exe 'vert 3resize ' . ((&columns * 126 + 141) / 283)
exe '4resize ' . ((&lines * 24 + 25) / 50)
exe 'vert 4resize ' . ((&columns * 126 + 141) / 283)
argglobal
enew
file NvimTree_1
balt jourgnal.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
lcd ~/Documents/jourgnal
wincmd w
argglobal
balt ~/Documents/jourgnal/lua/jourgnal/config.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 10 - ((9 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 10
normal! 0
lcd ~/Documents/jourgnal
wincmd w
argglobal
if bufexists(fnamemodify("~/Documents/jourgnal/lua/jourgnal/tasks.lua", ":p")) | buffer ~/Documents/jourgnal/lua/jourgnal/tasks.lua | else | edit ~/Documents/jourgnal/lua/jourgnal/tasks.lua | endif
if &buftype ==# 'terminal'
  silent file ~/Documents/jourgnal/lua/jourgnal/tasks.lua
endif
balt ~/Documents/jourgnal/plugin/jourgnal.vim
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 16 - ((12 * winheight(0) + 11) / 23)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 16
normal! 0
lcd ~/Documents/jourgnal
wincmd w
argglobal
if bufexists(fnamemodify("~/org/01_tasks/01_home/orgtool.md", ":p")) | buffer ~/org/01_tasks/01_home/orgtool.md | else | edit ~/org/01_tasks/01_home/orgtool.md | endif
if &buftype ==# 'terminal'
  silent file ~/org/01_tasks/01_home/orgtool.md
endif
balt ~/Documents/jourgnal/plugin/jourgnal.vim
setlocal fdm=expr
setlocal fde=pandoc#folding#FoldExpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=1
setlocal fml=1
setlocal fdn=20
setlocal fen
8
normal! zo
10
normal! zo
19
normal! zo
25
normal! zo
48
normal! zo
52
normal! zo
55
normal! zo
63
normal! zo
79
normal! zo
94
normal! zo
48
normal! zc
let s:l = 17 - ((4 * winheight(0) + 12) / 24)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 17
normal! 04|
lcd ~/Documents/jourgnal
wincmd w
4wincmd w
exe 'vert 1resize ' . ((&columns * 30 + 141) / 283)
exe 'vert 2resize ' . ((&columns * 125 + 141) / 283)
exe '3resize ' . ((&lines * 23 + 25) / 50)
exe 'vert 3resize ' . ((&columns * 126 + 141) / 283)
exe '4resize ' . ((&lines * 24 + 25) / 50)
exe 'vert 4resize ' . ((&columns * 126 + 141) / 283)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
