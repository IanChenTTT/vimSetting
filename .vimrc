" Enable syntax highlighting
syntax enable

" Set regular expression engine automatically
set regexpengine=0

" Turn on the Wild menu
set wildmenu
set wildmode=list:longest,full
set wildoptions=pum

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Always show current position
 set ruler

" Show matching brackets when text indicator is over them
set showmatch

" Height of the command bar
set cmdheight=1


set ai

" 啟用行游標提示。
" set cursorline

" 文字編碼加入 utf8。
set enc=utf8

" 標記關鍵字。
set hls

" 只在 Normal 以及 Visual 模式使用滑鼠，也就是取消 Insert 模式的滑鼠，
set mouse=nv

" 顯示行號。
" set number

" 顯示相對行號。
set relativenumber

" 搜尋不分大小寫。
set ic

" 使用空白取到 Tab。
set expandtab

" 自訂縮排 (Tab) 位元數。
set tabstop=2
set shiftwidth=2

" 字數過長時換行。
set wrap
"set nowrap     " 不換行。

" 關閉嗶嗶聲。
set noeb

" 自動切換當前目錄。
set autochdir

" 捲動時保留底下 3 行。
set scrolloff=3

"===[ Curosr Shape ]==="
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"


" 摺疊 Folding。
set foldenable
set foldmethod=manual
set foldcolumn=1
set foldlevel=5

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\<space>"

" Fast saving
nmap <leader>w :w!<cr>

" Fast quit
nmap <leader>q :wq<cr>

" Fast FORCE quit
nmap <leader>Q :q!<cr>

" ALL ABOUT TABS
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext<cr>

inoremap jk <esc>

set t_Co=256
set encoding=utf-8

" ALL ABOUT MAKE FILE
nnoremap <leader>m :vert :term make<CR><C-W><C-w>
nnoremap <leader>mr :term 50 make run<CR><C-W><C-w>
nnoremap <leader>mb :term 50 make build<CR><C-W><C-w>
nnoremap <leader>ma :term 50 make all<CR><C-W><C-w>
nnoremap <leader>mc :term 50 make clear<CR><C-W><C-w>


" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
