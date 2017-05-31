" For pathogen.vim: auto load all plugins in .vim/bundle
" call pathogen#runtime_append_all_bundles()
" call pathogen#helptags()
execute pathogen#infect()

set history=1000                             " Keep 1000 lines of command line history
set ruler                                    " Show the cursor position all the time
set autoread                                 " Auto read when file is changed from outside
filetype on                                  " Enable filetype detection
filetype plugin on                           " Enable filetype-specific plugins
autocmd! bufwritepost .vimrc source ~/.vimrc " Auto reload vimrc when editing it

" Vi compatible
set nocompatible

" Syntax highlight
syntax enable
syntax on

" Color theme
" color desert
" colors desert
set t_Co=256
set background=dark
colorscheme solarized

" Highlight search
set hlsearch
set incsearch

" File encoding
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gb2312,big5,latin1
set ambiwidth=double

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
set nofoldenable   " not fold functions

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
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" autocmd FileType c set omnifunc=ccomplete#Complete
" autocmd FileType java set omnifunc=javacomplete#Complete
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Use syntax complete if nothing else available
" if has("autocmd") && exists("+omnifunc")
"     autocmd Filetype *
"               \ if &omnifunc == "" |
"               \     setlocal omnifunc=syntaxcomplete#Complete |
"               \ endif
" endif

" set cot-=preview " Disable doc preview in omnicomplete

" --- SuperTab
" let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
" let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

" DoxygenToolkit
let g:load_doxygen_syntax=1
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@return "
let g:DoxygenToolkit_authorName="hellofreedom liudezhiabc@gmail.com"
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:DoxygenToolkit_briefTag_className="yes"
let g:DoxygenToolkit_briefTag_structName="yes"
let g:DoxygenToolkit_briefTag_enumName="yes"
let g:DoxygenToolkit_briefTag_namespaceName="yes"
let s:licenseTag="Copyright(C)\<enter>"
let s:licenseTag=s:licenseTag . "For free\<enter>"
let s:licenseTag=s:licenseTag . "All right reserved\<enter>"
map <leader>da :DoxAuthor<CR>
map <leader>df :Dox<CR>

" NERDTree
" :Bookmark [name] - bookmark any directory as name
" :NERDTree [name] - open the bookmark [name] in Nerd Tree
" C change tree root to the selected dir
" u move tree root up a dir
" cd change the CWD to the selected dir
" o open & close node
map <leader>nt :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1

" Show bufexplorer
map <leader>be :BufExplorer<CR>

" tComment
map <leader>c <c-_><c-_>

" Use <F4> to save
imap <F4> <ESC>:w<CR>
nmap <F4> :w<CR>

" Use <F5> to execute the current php script
autocmd FileType php imap <F5> <ESC>:w<CR> :!clear && php %<CR>
autocmd FileType php nmap <F5> :w<CR> :!clear && php %<CR>
autocmd FileType c imap <F5> <ESC>:w<CR> :!clear && gcc % -o %:t:r && ./%:t:r<CR>
autocmd FileType c nmap <F5> :w<CR> :!clear && gcc % -o %:t:r && ./%:t:r<CR>
autocmd FileType cpp imap <F5> <ESC>:w<CR> :!clear && g++ % -o %:t:r && ./%:t:r<CR>
autocmd FileType cpp nmap <F5> :w<CR> :!clear && g++ % -o %:t:r && ./%:t:r<CR>

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F8>

" php folding
let php_folding = 1

" php autocomplete function name
function! AddPHPFunclist()
    set dictionary-=~/.vim/funclist/php_funclist.txt dictionary+=~/.vim/funclist/php_funclist.txt
    set complete-=k complete+=k
endfunction
au FileType php call AddPHPFunclist()

" strip whitespaces at end of line
map <leader>fw :FixWhitespace<CR>

" rainbow parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

" MarksBrowser
map <leader>mb :MarksBrowser<CR>

" rescan the buffer from the start for highlight
autocmd BufEnter * :syntax sync fromstart

" markdown
let g:vim_markdown_folding_disabled=1

" Open nerdtree when there is no file
function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction
autocmd VimEnter * call StartUp()

let g:MarkStackCacheFile = '/tmp/mark_stack_for_vim.txt'
let g:MarkStackTable = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
    \ 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
function! MarkStackPush()
    let marks = []
    if filereadable(g:MarkStackCacheFile)
        let marks = readfile(g:MarkStackCacheFile)
    endif
    let mark = 'A'
    if len(marks) > 0
        let index = index(g:MarkStackTable, marks[-1]) + 1
        if index > 25
            let index -= 26
        endif
        let mark = g:MarkStackTable[index]
    endif
    execute 'normal! m' . mark
    call add(marks, mark)
    call writefile(marks, g:MarkStackCacheFile)
endfunction
function! MarkStackPop()
    if filereadable(g:MarkStackCacheFile)
        let marks = readfile(g:MarkStackCacheFile)
        if len(marks) < 1
            echohl ErrorMsg | echo 'Err: mark stack empty' | echohl None
        else
            execute 'normal! g`' . marks[-1]
            execute 'delmarks ' . marks[-1]
            let marks = marks[0:-2]
            call writefile(marks, g:MarkStackCacheFile)
        endif
    else
        echohl ErrorMsg | echo 'Err: mark stack empty' | echohl None
    endif
endfunction
