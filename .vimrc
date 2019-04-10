" EMACS style VI/VIM environment

set number
syntax on

set tabstop=2
set expandtab
set shiftwidth=2
set autoindent
set smartindent
set cindent

set tags=~/TAGS

nmap <TAB> =
vmap <TAB> =i

nmap <C-x>0 :hide<CR>
imap <C-x>0 <ESC>:hide<CR>i

nmap <C-x>1 :only<CR>
imap <C-x>1 <ESC>:only<CR>i

nmap <C-x>2 :split<CR>
imap <C-x>2 <ESC>:split<CR>i

nmap <C-x>3 :vsplit<CR>
imap <C-x>3 <ESC>:vsplit<CR>i

nmap <silent> <C-x><Up> :wincmd k<CR>
nmap <silent> <C-x><Down> :wincmd j<CR>
nmap <silent> <C-x><Left> :wincmd h<CR>
nmap <silent> <C-x><Right> :wincmd l<CR>
imap <silent> <C-x><Up> <ESC>:wincmd k<CR>i
imap <silent> <C-x><Down> <ESC>:wincmd j<CR>i
imap <silent> <C-x><Left> <ESC>:wincmd h<CR>i
imap <silent> <C-x><Right> <ESC>:wincmd l<CR>i

nmap <C-f> /
imap <C-f> <ESC>/
" use n N * to navigate

nmap <C-o> :tabnew<Space>
imap <C-o> <ESC>:tabnew<Space>

nmap <C-n> :tabnew<CR>i
imap <C-n> <ESC>:tabnew<CR>i

nmap <C-Home> :tabprevious<CR>
imap <C-Home> <ESC>:tabprevious<CR>i

nmap <C-End> :tabnext<CR>
imap <C-End> <ESC>:tabnext<CR>i

nmap <C-w> :q<CR>
imap <C-w> <ESC>:q<CR>

nmap <C-s> :update<CR>
imap <C-s> <ESC>:update<CR>li

nmap <C-a> ggVG
imap <C-a> <ESC>ggVG

nmap <C-z> :undo<CR>
imap <C-z> <ESC>:undo<CR>i
vmap <C-z> <ESC>:undo<CR>i

nmap <C-y> :redo<CR>
imap <C-y> <ESC>:redo<CR>i
vmap <C-y> <ESC>:redo<CR>i

vmap <BS> "_di
vmap <DEL> "_di
vmap <C-c> y<ESC>li
vmap <C-x> d<ESC>li
map <C-v> pi
imap <C-v> <ESC>pi

vmap <C-Left> ge
nmap <C-Left> ge
imap <C-Left> <ESC>gei
vmap <C-Right> e
nmap <C-Right> e
imap <C-Right> <ESC>lei
vmap <C-Up> {
nmap <C-Up> {
imap <C-Up> <ESC>{i
vmap <C-Down> }
nmap <C-Down> }
imap <C-Down> <ESC>}i
vmap <PageUp> 32k
nmap <PageUp> 32k
imap <PageUp> <ESC>32ki
vmap <PageDown> 32j
nmap <PageDown> 32j
imap <PageDown> <ESC>32ji

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

