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

nmap <C-f> /
imap <C-f> <ESC>/
" use n N * to navigate

nmap <C-o> :edit<SPACE>
imap <C-o> <ESC>:edit<SPACE>

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

nmap <PageUp> 32k
imap <PageUp> <ESC>32k
nmap <PageDown> 32j
imap <PageDown> <ESC>32j

nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
nmap <C-S-Up> v<C-Up>
nmap <C-S-Down> v<C-Down>
nmap <C-S-Left> v<C-Left>
nmap <C-S-Right> v<C-Right>

vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>
vmap <C-S-Up> <C-Up>
vmap <C-S-Down> <C-Down>
vmap <C-S-Left> <C-Left>
vmap <C-S-Right> <C-Right>

imap <S-Up> <Esc>v<Up>
imap <S-Down> <Esc>v<Down>
imap <S-Left> <Esc>v<Left>
imap <S-Right> <Esc>v<Right>
imap <C-S-Up> <Esc>v<C-Up>
imap <C-S-Down> <Esc>v<C-Down>
imap <C-S-Left> <Esc>v<C-Left>
imap <C-S-Right> <Esc>v<C-Right>
