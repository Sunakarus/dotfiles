set nocompatible
set langmenu=en_US.UTF-8
set encoding=utf-8
syntax on
filetype plugin indent on

execute pathogen#infect()
set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

let mapleader="\<Space>"
inoremap jj <ESC>
set backspace=indent,eol,start
set number

"buffer navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"buffer option
set hidden

"airline
let g:airline_powerline_fonts = 1
let g:airline_theme="badwolf"

"let g:EclimCompletionMethod = 'omnifunc'
let g:delimitMate_expand_cr = 1

"gruvbox
let g:gruvbox_sign_column="bg0"
let g:gruvbox_contrast_dark="medium"
set background=dark
colorscheme gruvbox

"persistent undo history
if has("persistent_undo")
    set undodir=~/.vim/undodir/
    set undofile
endif

let $LANG='en_US'
set cursorline
set history=10000
set colorcolumn=80

"indent
set wrap
set linebreak
set breakindent
set autoindent
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set shiftround

"split options
set splitbelow
set splitright

"search
set incsearch
set hlsearch
set ignorecase

"statusline
set showcmd
set noruler
set laststatus=2

set statusline=
set statusline+=%1*\ %n\ %*                " buffer number
set statusline+=%5*%{&ff}%*                " file format
set statusline+=%3*%y%*                    " file type
set statusline+=%4*\ %<%F%*                " full path
set statusline+=%2*%m%*                    " modified flag
set statusline+=%1*%=%5l%*                 " current line
set statusline+=%2*/%L%*                   " total lines
set statusline+=%4*\ (%p%%)\ %*
set statusline+=%1*%4v\ %*                 " virtual column number
set statusline+=%#warningmsg#              " syntastic
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

hi User1 ctermfg=173 ctermbg=234
hi User2 ctermfg=160 ctermbg=234
hi User3 ctermfg=99 ctermbg=234
hi User4 ctermfg=118 ctermbg=234
hi User5 ctermfg=227 ctermbg=234

"command autocompletion options
set wildmenu
set wildmode=longest:list,full

nnoremap - /
nnoremap <leader>h :nohlsearch<CR>

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

map Q @q

"common typos
cnoreabbrev W w
cnoreabbrev WQ wq
cnoreabbrev Q q

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

" czech keybinds
set langmap=+1,ě2,š3,č4,ř5,ž6,ý7,á8,í9,é0,1!,2@,3#,4$,5%,6^,7&,8*
