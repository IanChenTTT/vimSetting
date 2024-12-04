call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting
"
" Sets how many lines of history VIM has to remember

" enable filetype detection:
filetype on
filetype plugin on
filetype indent on " file type based indentation

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
set history=500
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config


inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function! s:CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Enable syntax highlighting
syntax enable

" Set regular expression engine automatically
set regexpengine=0

" Turn on the Wild menu
set wildmenu
set wildmode=list:longest,full
set wildoptions=pum

"Ignore status line
autocmd BufRead,BufNewFile * set laststatus=0

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Vim no swap
set noswapfile
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
" set wrap
set nowrap     " 不換行。

" 關閉嗶嗶聲。
set noeb

" 自動切換當前目錄。
set autochdir

" 捲動時保留底下 3 行。
set scrolloff=3


" 摺疊 Folding。
set foldenable
set foldmethod=manual
set foldcolumn=1
set foldlevel=5


set t_Co=256
set encoding=utf-8
set background=dark

"COLOR
let g:transparent_bg = '0'
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_number_column = 'neutral_orange'
let g:gruvbox_invert_selection = '0'
let g:gruvbox_termcolors = '256'
colorscheme gruvbox

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


" ALL ABOUT MAKE FILE ADJUST YOU LIKE
nnoremap <leader>m :vert :term make<CR><C-W><C-w>
nnoremap <leader>mr :vert :term make run<CR><C-W><C-w>
nnoremap <leader>mb :vert :term make build<CR><C-W><C-w>
nnoremap <leader>ma :vert :term make all<CR><C-W><C-w>
nnoremap <leader>mc :vert :term make clean<CR><C-W><C-w>
nnoremap <leader>mt :vert :term make test<CR><C-W><C-w>
nnoremap <leader>mtr :vert :term make trunAll<CR><C-W><C-w>


" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nnoremap <Leader>b :buffers<CR>:buffer<Space>
nnoremap <Leader>e :e<CR>:e

" REPLACE WORD
nnoremap <Leader>rw :%s/Hello/HI/gc 
nnoremap <Leader>rwc :,$s/old/new/c

" COMMENT
au FileType haskell,vhdl,ada let b:comment_leader = '-- '
au FileType vim let b:comment_leader = '" '
au FileType c,cpp,java let b:comment_leader = '// '
au FileType sh,make let b:comment_leader = '# '
au FileType tex let b:comment_leader = '% '
noremap <Leader>c :<C-B>sil <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:noh<CR>
noremap <Leader>cu :<C-B>sil <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:noh<CR>

inoremap jk <esc>
" BRACKET ISSUE
" let loaded_matchparen = 1
