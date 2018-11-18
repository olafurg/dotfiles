"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Olafur Gudmundsson
" <olafurg@gmail.com>
"
" Sections:
"    -> General
"    -> Plugins
"    -> VIM user interface
"    -> Colors and fonts
"    -> Text, tab related
"    -> Searching
"    -> Files and backups
"    -> Visual mode related
"    -> Moving around, tabs, windows and buffers
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-plug auto-install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug plugins list (between begin/end
call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'morhetz/gruvbox'
Plug 'jpo/vim-railscasts-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'ajmwagar/vim-deus'
Plug 'tpope/vim-rails'
Plug 'danro/rename.vim'
Plug 'junegunn/vim-easy-align'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'janko-m/vim-test'
call plug#end()

" ctrlp config
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Allow CtrlP to find dotfiles
let g:ctrlp_show_hidden = 1

"Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Line numbering on
set number

" jk is esc
inoremap jk <esc>l

" Enable filetype plugins
filetype plugin on
filetype indent on

" Indenting
" set autoindent
" set smartindent

" Show (partial) command in the last line of the screen
set showcmd

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving with leader+w
nnoremap <leader>w :w!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set 'n' lines to the cursor - when moving vertically using j/k
set scrolloff=7

" Split window differently
set splitright
set splitbelow


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

" Colorscheme settings
set background=dark
try
 let g:gruvbox_termcolors=256
  colorscheme gruvbox
  let g:airline_theme='gruvbox'
catch
endtry
"let g:solarized_termcolors=256
"let g:airline_theme='solarized'
"colorscheme solarized

" Set utf8 as standard encoding
set encoding=utf8

" Use unix as the standard file type
set fileformats=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab

" Set 1 tab == 2 spaces
set softtabstop=2
set shiftwidth=2

" Does nothing as I have softtabstop and shiftwidth with expandtab. No tabs exist.
set tabstop=8

" Be smart when using tabs
set smarttab

" Show matching brackets when text indicator is over them
set showmatch

" Make it obvious where 80 characters is
set colorcolumn=80,100
"set textwidth=100 " Splits line automatically

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ignore case when searching
set ignorecase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    -> Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable swap files
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Move visual lines up/down rather than actual lines
noremap j gj
noremap k gk

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee,*.rb,*.md,*.haml :call CleanExtraSpaces()
endif

