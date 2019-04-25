" EMACS style VI/VIM environment

set number
set cursorline
sy enable
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

nmap <C-x><Left> :bp<CR>
imap <C-x><left> <ESC>:bp<CR>i
nmap <C-x><Right> :bn<CR>
imap <C-x><Right> <ESC>:bn<CR>i

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
imap <silent> <A-Up> <ESC>:wincmd k<CR>i
imap <silent> <A-Down> <ESC>:wincmd j<CR>i
imap <silent> <A-Left> <ESC>:wincmd h<CR>i
imap <silent> <A-Right> <ESC>:wincmd l<CR>i

fu! MySplit()
  if winwidth('%') < winheight('%') * 3
    :split
  else
    :vsplit
  end
endf

nnoremap <C-]> :call MySplit()<CR><C-]>
inoremap <C-]> <ESC>:call MySplit()<CR><C-]>

nmap <C-f> /
imap <C-f> <ESC>/
" use n N * to navigate

nmap <C-n> :tabnew<Space>
imap <C-n> <ESC>:tabnew<Space>

nmap <C-o> :vsplit<Space>
imap <C-o> <ESC>:vsplit<Space>

nmap <C-Home> :tabprevious<CR>
imap <C-Home> <ESC>:tabprevious<CR>i

nmap <C-End> :tabnext<CR>
imap <C-End> <ESC>:tabnext<CR>i

nmap <C-k> :q<CR>
imap <C-k> <ESC>:q<CR>

nmap <C-s> :update<CR>
imap <C-s> <ESC>:update<CR><ESC>a

nmap <C-a> ggVG
imap <C-a> <ESC>ggVG

nmap <C-z> :undo<CR>
imap <C-z> <ESC>:undo<CR>i
vmap <C-z> <ESC>:undo<CR>i

vmap <BS> "_d<ESC>i
vmap <DEL> "_di
vmap <C-c> y<ESC>a
vmap <C-x> d<ESC>a
vmap <C-v> pi
imap <C-v> <ESC>pi

vmap <C-Left> b
nmap <C-Left> b
imap <C-Left> <ESC>bi
vmap <C-Right> w
nmap <C-Right> w
imap <C-Right> <ESC>lwi
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

