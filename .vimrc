" EMACS style VI/VIM environment

set number
syntax on

nmap <C-x>0 :hide<CR>
imap <C-x>0 <ESC>:hide<CR>

nmap <C-x>1 :only<CR>
imap <C-x>1 <ESC>:only<CR>

nmap <C-x>2 :split<CR>
imap <C-x>2 <ESC>:split<CR>

nmap <C-x>3 :vsplit<CR>
imap <C-x>3 <ESC>:vsplit<CR>

nmap <silent> <C-x><Up> :wincmd k<CR>
nmap <silent> <C-x><Down> :wincmd j<CR>
nmap <silent> <C-x><Left> :wincmd h<CR>
nmap <silent> <C-x><Right> :wincmd l<CR>
imap <silent> <C-x><Up> <ESC>:wincmd k<CR>
imap <silent> <C-x><Down> <ESC>:wincmd j<CR>
imap <silent> <C-x><Left> <ESC>:wincmd h<CR>
imap <silent> <C-x><Right> <ESC>:wincmd l<CR>

nmap <C-f> /
imap <C-f> <ESC>/
" use n N * to navigate

nmap <C-o> :edit<Space>
imap <C-o> <ESC>:edit<Space>i

nmap <C-w> :q<CR>
imap <C-w> <ESC>:q<CR>

nmap <C-s> :update<CR>
imap <C-s> <ESC>:update<CR>

nmap <C-a> ggVG
imap <C-a> <ESC>ggVG

vmap <C-c> y<ESC>i
vmap <C-x> d<ESC>i
map <C-v> pi
imap <C-v> <ESC>pi
imap <C-z> <ESC>ui

nmap <C-Up> {
imap <C-Up> <ESC>{i
nmap <C-Down> }
imap <C-Down> <ESC>}i
nmap <PageUp> 32k
imap <PageUp> <ESC>32k
nmap <PageDown> 32j
imap <PageDown> <ESC>32j

vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>
vmap <C-S-Up> {
vmap <C-S-Down> }
vmap <C-S-Left> <C-Left>
vmap <C-S-Right> <C-Right>
vmap <S-Home> <Home>
vmap <S-End> <End>
vmap <S-PageUp> 32k
vmap <S-PageDown> 32j

nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
nmap <C-S-Up> v<C-Up>
nmap <C-S-Down> v<C-Down>
nmap <C-S-Left> v<C-Left>
nmap <C-S-Right> v<C-Right>
nmap <S-Home> v<Home>
nmap <S-End> v<End>
nmap <S-PageUp> v<PageUp>
nmap <S-PageDown> v<PageDown>

imap <S-Up> <ESC>v<Up>
imap <S-Down> <ESC>v<Down>
imap <S-Left> <ESC>v<Left>
imap <S-Right> <ESC>v<Right>
imap <C-S-Up> <ESC>v<C-Up>
imap <C-S-Down> <ESC>v<C-Down>
imap <C-S-Left> <ESC>v<C-Left>
imap <C-S-Right> <ESC>v<C-Right>
imap <S-Home> <ESC>v<Home>
imap <S-End> <ESC>v<End>
imap <C-S-PageUp> <ESC>v<PageUp>
imap <C-S-PageDown> <ESC>v<PageDown>
