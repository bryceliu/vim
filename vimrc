" For pathogen.vim: auto load all plugins in .vim/bundle
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set history=50                               " Keep 50 lines of command line history
set ruler                                    " Show the cursor position all the time
set autoread                                 " Auto read when file is changed from outside
filetype on                                  " Enable filetype detection
filetype indent on                           " Enable filetype-specific indenting
filetype plugin on                           " Enable filetype-specific plugins
autocmd! bufwritepost .vimrc source ~/.vimrc " Auto reload vimrc when editing it

" Vi compatible
set nocompatible

" Syntax highlight
syntax enable
syntax on

" Color theme
color desert
colors desert

" Highlight search
set hlsearch
set incsearch

" File encoding
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gb2312,big5,latin1
set ambiwidth=double

" No backup
set nobackup
set nowritebackup

" Switch tab to four spaces
set expandtab
set tabstop=4
set softtabstop=4

" Indent
set autoindent
set cindent
set smartindent
set shiftwidth=4

set showmatch      " Show matched curly braces, brackets and parentheses
set showcmd        " Show uncompleted cmds at the bottom of screen
set showmode       " Show current mode
set wildchar=<TAB> " Start wild expansion in the command line using <TAB>
set wildmenu       " Wild char completion menu
set ignorecase     " Ignore case when searching
set smartcase      " Ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab       " Insert tabs on the start of a line according to context

" C/C++ specific settings
autocmd FileType c,cpp,cc set cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30

" Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

set backspace=indent,eol,start

" Set leader to ,
let mapleader=","
let g:mapleader=","

" ,/ Turn off search highlighting
nmap <leader>/ :nohl<CR>

" Enable omni completion. (Ctrl-X Ctrl-O)
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Use syntax complete if nothing else available
if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
              \ if &omnifunc == "" |
              \     setlocal omnifunc=syntaxcomplete#Complete |
              \ endif
endif

set cot-=preview " Disable doc preview in omnicomplete

" --- SuperTab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

" NERDTree
" :Bookmark [name] - bookmark any directory as name
" :NERDTree [name] - open the bookmark [name] in Nerd Tree
" C change tree root to the selected dir
" u move tree root up a dir
" cd change the CWD to the selected dir
" o open & close node
map <leader>nt :NERDTreeToggle<CR>

" Show bufexplorer
map <leader>be :BufExplorer<CR>

" tComment
map <leader>c <c-_><c-_>

" Use <F4> to save
imap <F4> <ESC>:w<CR>
nmap <F4> :w<CR>

" Use <F5> to execute the current php script
autocmd FileType php nmap <F5> <ESC>:!clear && php <C-R>%<CR>

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" php folding
let php_folding = 1
