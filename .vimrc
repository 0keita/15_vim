set nocompatible               " Be iMproved
filetype off                   " Required!

if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundleFetch 'Shougo/vimproc.vim'

" color
NeoBundle 'DrSpatula/vim-buddy'

NeoBundle 'Lokaltog/vim-distinguished'
NeoBundle 'slim-template/vim-slim.git'
" indent補助
if expand("%:t") =~ ".*\.slim"
  NeoBundle 'nathanaelkane/vim-indent-guides'
  let g:indent_guides_auto_colors=0
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=8
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=248
  let g:indent_guides_enable_on_vim_startup=1
  let g:indent_guides_guide_size=1
endif

" 行末のスペースの削除
NeoBundle 'bronson/vim-trailing-whitespace'
nnoremap <silent>,dsp :FixWhitespace<CR>

" Git
NeoBundle 'tpope/vim-fugitive'
" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow
au FileType fugitiveblame nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
nnoremap <silent>gn :cn<CR>
nnoremap <silent>gp :cp<CR>
let QFix_Edit = 'tab'
let QFix_PreviewEnable = 1
nnoremap <silent> :gg :Ggrep

" FileTree
NeoBundle 'scrooloose/nerdtree'
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" Ruby向けにendを自動挿入してくれる
NeoBundle 'Shougo/neocomplete.vim'
let g:neocomplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
NeoBundle 'tpope/vim-endwise'

" smart replace
NeoBundle 'tpope/vim-abolish'

" true/false
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-scripts/ruby-matchit'
NeoBundle 'AndrewRadev/switch.vim'
nnoremap ! :Switch<CR>
let g:switch_custom_definitions =
    \ [
    \   ['true', 'false'],
    \   ['present?', 'blank?'],
    \   ['&&', '||'],
    \   ['&&', '||'],
    \   ['if', 'unless']
    \ ]

" Unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
let g:unite_enable_start_insert = 1
let g:unite_enable_split_vertically = 0
let g:unite_winwidth = 40
nnoremap <silent> ,um   :<C-u>Unite file_mru -tab <CR>
nnoremap <silent> ,uf   :<C-u>Unite file_rec -tab <CR>

" method jump
NeoBundle 'universal-ctags/ctags'

augroup AlpacaTags
  autocmd!
  if exists(':Tags')
    autocmd BufWritePost Gemfile TagsBundle
    autocmd BufEnter * TagsSet
    autocmd BufWritePost * TagsUpdate
  endif
augroup END

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

set number
set hlsearch
set incsearch

set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent

" 検索の時の対象の大文字小文字の区別
set ignorecase
set smartcase

set wildmenu
set wildmode=full
set pastetoggle=,v

inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
if expand("%:t") =~ ".*\.rb"
  inoremap # #{}<LEFT>
endif

"color theme
syntax enable
colorscheme buddy

" for vim practice
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Right> <Nop>

" jbuilder
au BufNewFile,BufRead *.jbuilder set ft=ruby syn=ruby
