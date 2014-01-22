" A GOOD VIM by http://dougblack.io/words/a-good-vimrc.html

" Colors {{{
syntax enable           " enable syntax processing
set bg=dark             " use 256 colors by default
colorscheme desert      " awesome colorscheme
" }}}

" Spaces and tabs {{{
set tabstop=2           " number of visual spaces per TAB
set softtabstop=2       " number of spaces in TAB when editing
set expandtab           " tabs are spaces
set modelines=1
" }}}

" UI Config {{{
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype specific indent files
set wildmenu            " visual autocomplete for command menu
"set lazyredraw          " redraw only when we need to
set showmatch           " highlight matching [{()}]
" }}}

" Searching {{{
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" }}}

" Folding {{{
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level
" }}}

" Movement {{{
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" highlight last inserted text
nmap gV `[V`]
" }}}

" Leader shortcuts {{{
let mapleader=","        " leader is comma
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR> 
nnoremap <leader>sv :source $MYVIMRC<CR> 
" save session
nnoremap <leader>s :mksession<CR>
" open ag.vim
nnoremap <leader>a :ag
" jk is escape 
inoremap jk <esc>   
" }}}
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
" }}}

" Tmux {{{
" allows cursor change in tmux mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" }}}

" Autogroups {{{
augroup configgroup
  autocmd!
  autocmd VimEnter * highlight clear SignColumn
  autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                          \:call <SID>StripTrailingWhitespaces()
  autocmd FileType java setlocal noexpandtab
  autocmd FileType java setlocal list
  autocmd FileType java setlocal listchars=tab:+\ ,eol:-
  autocmd FileType java setlocal formatprg=par\ -w80\ -T4
  autocmd FileType php setlocal expandtab
  autocmd FileType php setlocal list
  autocmd FileType php setlocal listchars=tab:+\ ,eol:-
  autocmd FileType php setlocal formatprg=par\ -w80\ -T4
  autocmd FileType ruby setlocal tabstop=2
  autocmd FileType ruby setlocal shiftwidth=2
  autocmd FileType ruby setlocal softtabstop=2
  autocmd FileType ruby setlocal commentstring=#\ %s
  autocmd FileType python setlocal commentstring=#\ %s
  autocmd BufEnter *.cls setlocal filetype=java
  autocmd BufEnter *.zsh-theme setlocal filetype=zsh
  autocmd BufEnter Makefile setlocal noexpandtab
  autocmd BufEnter *.sh setlocal tabstop=2
  autocmd BufEnter *.sh setlocal shiftwidth=2
  autocmd BufEnter *.sh setlocal softtabstop=2
augroup END
" }}}

" Launch configurations {{{
call pathogen#infect()                     " use pathogen
call pathogen#incubate()                  " use pathogen
" }}}

" Backups {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}

" vim:foldmethod=marker:foldlevel=0
