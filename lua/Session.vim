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
badd +7 jourgnal.lua
badd +1 1
badd +4 inbox.md
badd +57 ~/org/01_tasks/01_home/orgtool.md
badd +21 ~/Documents/jourgnal/doc/jourgnal.txt
badd +3 ~/Documents/jourgnal/.gitignore
badd +1 terminal
badd +5 term://~/Documents/jourgnal/lua//30312:/bin/zsh
argglobal
%argdel
edit ~/Documents/jourgnal/.gitignore
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
3wincmd h
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
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
exe '2resize ' . ((&lines * 24 + 25) / 50)
exe 'vert 2resize ' . ((&columns * 105 + 141) / 283)
exe '3resize ' . ((&lines * 23 + 25) / 50)
exe 'vert 3resize ' . ((&columns * 105 + 141) / 283)
exe '4resize ' . ((&lines * 23 + 25) / 50)
exe 'vert 4resize ' . ((&columns * 105 + 141) / 283)
exe '5resize ' . ((&lines * 24 + 25) / 50)
exe 'vert 5resize ' . ((&columns * 105 + 141) / 283)
exe 'vert 6resize ' . ((&columns * 40 + 141) / 283)
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
wincmd w
argglobal
balt terminal
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
let s:l = 1 - ((0 * winheight(0) + 12) / 24)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 03|
wincmd w
argglobal
if bufexists(fnamemodify("term://~/Documents/jourgnal/lua//30312:/bin/zsh", ":p")) | buffer term://~/Documents/jourgnal/lua//30312:/bin/zsh | else | edit term://~/Documents/jourgnal/lua//30312:/bin/zsh | endif
if &buftype ==# 'terminal'
  silent file term://~/Documents/jourgnal/lua//30312:/bin/zsh
endif
balt terminal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 5 - ((4 * winheight(0) + 11) / 23)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 5
normal! 063|
wincmd w
argglobal
if bufexists(fnamemodify("~/Documents/jourgnal/doc/jourgnal.txt", ":p")) | buffer ~/Documents/jourgnal/doc/jourgnal.txt | else | edit ~/Documents/jourgnal/doc/jourgnal.txt | endif
if &buftype ==# 'terminal'
  silent file ~/Documents/jourgnal/doc/jourgnal.txt
endif
balt ~/org/01_tasks/01_home/orgtool.md
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
let s:l = 21 - ((17 * winheight(0) + 11) / 23)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 21
normal! 0428|
wincmd w
argglobal
if bufexists(fnamemodify("~/Documents/jourgnal/.gitignore", ":p")) | buffer ~/Documents/jourgnal/.gitignore | else | edit ~/Documents/jourgnal/.gitignore | endif
if &buftype ==# 'terminal'
  silent file ~/Documents/jourgnal/.gitignore
endif
balt ~/org/01_tasks/01_home/orgtool.md
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
let s:l = 3 - ((2 * winheight(0) + 12) / 24)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 3
normal! 06|
lcd ~/Documents/jourgnal
wincmd w
argglobal
enew
file ~/Documents/jourgnal/lua/__Tagbar__.1
balt ~/Documents/jourgnal/lua/inbox.md
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
wincmd w
3wincmd w
exe 'vert 1resize ' . ((&columns * 30 + 141) / 283)
exe '2resize ' . ((&lines * 24 + 25) / 50)
exe 'vert 2resize ' . ((&columns * 105 + 141) / 283)
exe '3resize ' . ((&lines * 23 + 25) / 50)
exe 'vert 3resize ' . ((&columns * 105 + 141) / 283)
exe '4resize ' . ((&lines * 23 + 25) / 50)
exe 'vert 4resize ' . ((&columns * 105 + 141) / 283)
exe '5resize ' . ((&lines * 24 + 25) / 50)
exe 'vert 5resize ' . ((&columns * 105 + 141) / 283)
exe 'vert 6resize ' . ((&columns * 40 + 141) / 283)
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
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
