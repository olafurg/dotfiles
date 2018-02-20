"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Olafur Gudmundsson
" <olafurg@gmail.com>
"
" Sections:
"    -> General
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
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Line numbering on
set number

" jk is esc
inoremap jk <esc>

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

" Fast saving
nnoremap <leader>w :w!<cr>

" Pathogen install
execute pathogen#infect()

" Allow CtrlP to find dotfiles
let g:ctrlp_show_hidden = 1

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
set background=light
try
    let g:solarized_termcolors=256
    colorscheme solarized
    let g:airline_theme='solarized'
catch
endtry

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

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
"set smarttab

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
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee,*.rb :call CleanExtraSpaces()
endif

