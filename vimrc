"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Sections for set commands                                                  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" type :part_of_a_command + tab will show a
" wildmode=longest:list,full means to list all commands.
set wildmenu
set wildmode=longest:list,full

set showmode

"
" type in command to help  :help foldmethod
" 'foldmethod' 'fdm'      string (default: "manual")
"                        local to window
"                        {not in Vi}
"                        {not available when compiled without the +folding
"                        feature}
"        The kind of folding used for the current window.  Possible values:
"        fold-manual     manual      Folds are created manually.
"        fold-indent     indent      Lines with equal indent form a fold.
"        fold-expr       expr        'foldexpr' gives the fold level of a line.
"        fold-marker     marker      Markers are used to specify folds.
"        fold-syntax     syntax      Syntax highlighting items specify folds.
"        fold-diff       diff        Fold text that is not changed.
"
" z + o opens a fold at the cursor.
" z + Shift+o opens all folds at the cursor.
" z + c closes a fold at the cursor.
" z + m increases the foldlevel by one.
" z + Shift+m closes all open folds.
" z + r decreases the foldlevel by one.
" z + Shift+r decreases the foldlevel to zero -- all folds will be open.
set foldmethod=manual
" Set intent of every level
set shiftwidth=4
" Use shift width when insert code
set sta

" Enable ability of deleting left characters.
set backspace=2 "allways 2

" Disable compatibility of vi
set nocompatible

" Enable line number
set number

" Enable filetype check
filetype on
" Auto load filetype plugins(code format) in runtime paths"
filetype plugin indent on

" Command history items count
set history=1000

" Apply the current line's intent format to next line.
"set autoindent

"set smartindent
" Auto change directory to the edited file's path.
"set autochdir

" Set tab to 4 space and replace tab with space
set tabstop=4
set expandtab
%retab!

" Diplay column number and row number when moving cursor. 
set ruler

" Auto locate to the word found
set incsearch
" Hilight the word found
set hlsearch

" Alt key does not map to menu
set winaltkeys=no

" File encoding
set fileencoding=utf-8
"set fileencodings=ucs-bom,utf-8,chinese,cp936,gbk
"set gfw=楷体:h11
"set guifont=SimKai:h14
set langmenu=zh_CN,utf-8

" Switch to intert mode when complete paste
"set t_BE=

" Enable syntax hilight.
syntax enable
syntax on

"setlocal spell spelllang=en_us

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Sections for loading plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load plugins
"set runtimepath^=~/.vim/bundle/snipmate
execute pathogen#infect()
" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
" (via http://stackoverflow.com/a/22253548/1626737)
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:ycm_key_list_select_completion = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
 
let g:UltiSnipsSnippetsDir = '~/.vim/bundle/snippets/UltiSnips'
let g:UltiSnipsSnippetDirectories = ['ultisnips']
let g:completekey = "<C-l>"

" Start nerd tree
function! NERDTree_Start()
    exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Sections for setting color theme                                           
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set color theme for lilyterm
" It will be a dark black background and white foreground.
function! <SID>setLily()
  set t_Co=256
  set background=dark
  colorscheme wombat256mod
endfunction

" Set solarize color theme
function! <SID>setSolarized()
  set background=dark
  set t_Co=16
  let g:solarized_termcolors=16
  let g:solarized_termtrans = 1
  colorscheme solarized
endfunction

" Set color theme by term name.
if !has("gui_running")
"  echo $TERM_NAME
  if $TERM_NAME  == "konsole"
    call <SID>setSolarized()
  elseif $TERM_NAME =~ "gnome"
    colorscheme seoul256
  elseif $TERM_NAME == "lilyterm"
    call <SID>setLily()
  elseif $TERM_NAME =~ ".*terminator$"
    call <SID>setSolarized()
  elseif $TERM_NAME =~ "sakura"
    colorscheme seoul256
  elseif $TERM_NAME =~ "broton.*"
  ""  colorscheme seoul256
    call <SID>setSolarized()
  else
    call <SID>setLily()
endif
else
" colorscheme solarized
 colorscheme desertEx
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Sections for setting plugins' params
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set nerdtree and tag bar width
let g:screen_col = str2nr(system('tput cols'))
let g:NERDTree_title='NERD Tree'
let g:NERDTreeWinSize = float2nr(0.5 * g:screen_col)
let g:winManagerWidth = float2nr(0.4 * g:screen_col)
let g:tagbar_width =    float2nr(0.4 * g:screen_col)

" Set buffer explore width
let g:miniBufExplMapCTabSwitchBufs = 1 " 供过tab切换窗口（这个好像没有发挥作用，不知道为什么）
let g:miniBufExplMapWindowNavVim = 1 " 通过h,j,k,l切换窗口
let g:miniBufExplMapWindowNavArrows = 1 " 通过方向键切换窗口
let g:bufExplorerSortBy='mru'

" Doxygen params
let g:winManagerWindowLayout = "NERDTree|BufExplorer"
let g:DoxygenToolkit_authorName="biwenyang@huawei.com"
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "

" Set youcompleteme params
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'

" Set commandT params
let g:CommandTMaxFiles=10000000 "Max number of files showed

" Auto save sessions when close vim
"autocmd VimLeave * mks! ~/.vim/vimsession.vim

" Warning when code exceed the 80th cloumn
"match DiffAdd '\%>80v.*'
"highlight OverLength ctermfg=magenta guibg=#592929
"match OverLength /\%81v.\+/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Sections for self-defined commands and hotkeys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! <SID>ShowTabSpace()
set list
set listchars=tab:>-,trail:-
endfunction

function! <SID>HideTabSpace()
set nolist
endfunction

function! <SID>TrimTailSpace()
:%s/ *$//
endfunction

function! <SID>ConvertTabToSpace()
set expandtab
%retab!
endfunction

function! <SID>CopyPath()
    let @+=expand("%:p:h")
endfunction

function! <SID>CopyFilePathName()
    let @+=expand("%:p")
endfunction

function! <SID>CopyFileName()
    let @+=expand("%:t")
endfunction


function ShowFuncTag()
    let wordUnderCursor = expand("<cword>")
    execute ":ptag " . wordUnderCursor
endfunction

function ShowTag()
    let wordUnderCursor = expand("<cword>")
    execute ":tselect " . wordUnderCursor
endfunction

"Open file in project
"The value will be set in 'loadproject.vim'
let g:project_root = ''
function! <SID>OpenFileInProject()
    let openCmd = ":CommandT " . g:project_root
    echo openCmd
    execute openCmd
endfunction

"Activate bookmarks placed to source files.
function! <SID>PlaceBookmarks()
  if filereadable(g:vbookmark_bookmarkSaveFile)
    execute ":VbookmarkPlaceAll"
  endif
endfunction

if has("autocmd")
   autocmd BufRead *.txt set tw=78
   "autocmd BufEnter * call <SID>ShowTabSpace()
   "autocmd BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal g'\"" |  endif
"    au BufReadPost *
"       \ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" |
"            \ execute("normal `\"") |
"       \ endif
 au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

function! ActivateWindowByName(...)
  if a:0
    let l:bufname = bufname(a:1)
    let l:bufid = bufnr(l:bufname)
    let l:winids = win_findbuf(l:bufid)
    call win_gotoid(l:winids[0])
  endif
endfunction

if !exists(':Aw')
  command -nargs=? Aw : call ActivateWindowByName(<f-args>)
endif

if !exists(':ShowTabSpace') 
  command -nargs=0 ShowTabSpace : call <SID>ShowTabSpace()
endif

if !exists(':HideTabSpace') 
  command -nargs=0 HideTabSpace : call <SID>HideTabSpace()
endif

if !exists(':ConvertTabToSpace') 
  command -nargs=0 ConvertTabToSpace : call <SID>ConvertTabToSpace()
endif

if !exists(':TrimTailSpace') 
  command -nargs=0 TrimTailSpace : call <SID>TrimTailSpace()
endif

"nmap gf :tabedit <cfile><CR>
nmap <S-F5> :call <SID>ShowTabSpace()<CR>
nmap <S-F6> :call <SID>HideTabSpace()<CR>
nmap <S-F7> :call <SID>ConvertTabToSpace()<CR>
nmap <S-F8> :call <SID>TrimTailSpace()<CR>
nmap <S-F9> :files<CR>
nmap <F10> :call <SID>OpenFileInProject()<CR>
nmap <F6> :call <SID>CopyPath()<CR>
nmap <F7> :call <SID>CopyFilePathName()<CR>
nmap <F8> :call <SID>CopyFileName()<CR>
nmap <F4> :TagbarToggle<CR>
nmap <C-F8> :set mouse=a<CR>
nmap <C-F9> :set mouse=<CR>
nmap <C-F3> :call ShowFuncTag()<CR>
nmap <C-F4> :pclose<CR>
nmap <C-S-y> :redo<CR>
"map <F9> :NERDTreeToggle<cr>
map <F3> :WMToggle<cr>
nmap lsm :VbookmarkGroup<CR>
nmap <C-F10> :VbookmarkSave<CR>
"nmap <C-F9> :VbookmarkClearAll<CR>
map <C-g> "+y$
map <C-y> "+y
nmap gl  :call cursor(line("."), col("$")/2)<CR>
nnoremap <C-F7> :set invpaste paste?<CR>
set pastetoggle=<C-F7>
nnoremap <c-]> g<c-]>
