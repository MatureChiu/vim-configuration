" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.
" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim
runtime! cmdalias.vim
" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Define Functions 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SetCsTagsPath__ISSUE(cs_tags_path)
    let cscope_db=a:cs_tags_path.'cscope.out'
    let tags_path=a:cs_tags_path.'tags'
    
    if filereadable(tags_path)
        echo tags_path
    else    
        echo "File: tags is not exist !" 
    endif
endfunction

function! FuncTest(var1, var2)
  let str=a:var1
    let str2=a:var2
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim alias && hot-key mapping;
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap ? :ls
nmap ! :!
nmap lc :!clear; locate 
nmap nb :badd 

nmap <F2> :TlistToggle <CR>
nmap <F3> :NERDTreeToggle <CR>
nmap <F4> :PluginList <CR>
nmap <F7> :if exists("syntax_on") <BAR>
\ syntax off <BAR><CR>
\ else <BAR>
\ syntax enable <BAR>
\ endif <CR>

nmap <F8> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
  \:!cscope -b -i cscope.files -f cscope.out<CR>
  \:!ctags -R<CR>
  \:cs reset<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope hot-key
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap cc :cs find c
nmap cg :cs find g 
nmap cc :cs find c 
nmap ce :cs find e 
nmap cf :cs find f 
nmap cg :cs find g 
nmap ci :cs find i 
nmap cd :cs find d 
nmap ch :cs help 
nmap cs :cs show 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable line number;
set nu
" Enable CursorLine;
set cursorline
" Default Colors for CursorLine
"highlight  CursorLine ctermbg=lightcyan ctermfg=yellow
"highlight  CursorLine ctermbg=lightcyan ctermfg=red
"highlight  CursorLine ctermbg=red ctermfg=yellow
highlight  CursorLine ctermbg=yellow ctermfg=red
" Change Color when entering Insert Mode
autocmd InsertEnter * highlight  CursorLine ctermbg=red ctermfg=white
" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * highlight  CursorLine ctermbg=blue ctermfg=yellow
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 顯示行列位置
set ruler
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自動找對應括號
set showmatch
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 啟用自動縮排
set autoindent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the commandheight
set cmdheight=1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" do not keep a backup files 
set nobackup
set nowritebackup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" keep 999 lines of command line history
set history=3999
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" show (partial) commands
set showcmd
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" do incremental searches (annoying but handy);
set incsearch
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show tab characters. Visual Whitespace.
set list
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set ignorecase on
set ignorecase smartcase
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always display a status line at the bottom of the window
set laststatus=1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" showmatch: Show the matching bracket for the last ')'?
set showmatch
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Java specific stuff
let java_highlight_all=1
let java_highlight_debug=1
let java_ignore_javadoc=1
let java_highlight_functions=1
let java_mark_braces_in_parens_as_errors=1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let c_comment_strings=1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hls
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set match string color 
hi Search term=reverse ctermbg=yellow ctermfg=red
"hi Search term=reverse ctermbg=yellow ctermfg=white
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nowrapscan 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" status line display 
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ic
set is
set vb
set confirm
set noswapfile
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set mouse=nv
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
" http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
" Setting up Vundle - the vim plugin bundler

let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" original repos on github
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'airblade/vim-gitgutter'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle 'Townk/vim-autoclose'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-fugitive'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'
Bundle 'autoload_cscope.vim'
Bundle 'taglist-plus'
"
"Bundle 'Valloric/YouCompleteMe'
"===========================
""colorscheme
set t_Co=175
set background=dark
"colorscheme solarized
"colorscheme molokai
"""colorscheme
"===========================
let g:ycm_global_ycm_extra_conf = "~/.vim/ycm_extra_conf.py"
"
filetype on
filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.
" Put your stuff after this line
"call vundle#end()           " required
filetype plugin indent on    " required

