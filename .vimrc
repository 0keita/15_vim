set nocompatible               " Be iMproved
filetype off                   " Required!

if 0 | endif

" dein
if has('vim_starting')
	if &compatible
		set nocompatible
	endif
  silent !mkdir ~/.vimdein > /dev/null 2>&1
	" Add the dein installation directory into runtimepath
	set runtimepath+=~/.vimdein/repos/github.com/Shougo/dein.vim

	if dein#load_state('~/.vimdein')
		call dein#begin('~/.vimdein')

		call dein#add('~/.vimdein/repos/github.com/Shougo/dein.vim')
		call dein#add('Shougo/deoplete.nvim')

    " General
    "" color theme
    call dein#add('DrSpatula/vim-buddy')
    call dein#add('Lokaltog/vim-distinguished')

    "" 行末のスペースの削除
    call dein#add('bronson/vim-trailing-whitespace')
    nnoremap <silent>,dsp :FixWhitespace<CR>

    "" smart replace
    call dein#add('tpope/vim-abolish')

    " File
    "" FileTree
    call dein#add('scrooloose/nerdtree')
    nnoremap <silent><C-e> :NERDTreeToggle<CR>

    "" Unite
    call dein#add('Shougo/unite.vim')
    call dein#add('Shougo/neomru.vim')
    let g:unite_enable_start_insert = 1
    let g:unite_enable_split_vertically = 0
    let g:unite_winwidth = 40
    nnoremap <silent> ,um :<C-u>Unite file_mru -tab <CR>
    nnoremap <silent> ,uf :<C-u>Unite file_rec -tab <CR>

    " Git
    "" git command
    "" READ_LATER : https://qiita.com/yuku_t/items/0c1aff03949cb1b8fe6b
    call dein#add('tpope/vim-fugitive')
    " grep検索の実行後にQuickFix Listを表示する
    autocmd QuickFixCmdPost *grep* cwindow
    au FileType fugitiveblame nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
    nnoremap <silent>gn :cn<CR>
    nnoremap <silent>gp :cp<CR>
    let QFix_Edit = 'tab'
    let QFix_PreviewEnable = 1
    nnoremap <silent> :gg :Ggrep

    " development
    "" comment out
    call dein#add('tomtom/tcomment_vim')

    "" surround
    call dein#add('tpope/vim-surround')

    " Ruby
    "" jump to end
    call dein#add('vim-scripts/ruby-matchit')

    "" TODO
    call dein#add('Shougo/neocomplete.vim')
    let g:neocomplete#enable_at_startup = 1
    inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

    "" add 'end' automatically
    call dein#add('tpope/vim-endwise')

    " method jump
    "" TODO
    call dein#add('universal-ctags/ctags')
    augroup AlpacaTags
      autocmd!
      if exists(':Tags')
        autocmd BufWritePost Gemfile TagsBundle
        autocmd BufEnter * TagsSet
        autocmd BufWritePost * TagsUpdate
      endif
    augroup END

    "" true/false
    call dein#add('AndrewRadev/switch.vim')
    let g:switch_mapping="!"
    "" FIXME: %style
    autocmd FileType ruby let b:switch_custom_definitions =
      \ [
      \   {
      \     'true': 'false',
      \     'present?': 'blank?',
      \     '&&': '||',
      \     'if': 'unless',
      \     ':\(\k\+\)\s\+=>': '\1:',
      \     '\<\(\k\+\):':     ':\1 =>',
      \     'should ':     'should_not ',
      \   },
      \ ]

    " slim file
    "" slim syntax highlighting for vim.
    call dein#add('slim-template/vim-slim.git')

    "" indent補助
    call dein#add('nathanaelkane/vim-indent-guides')
    if expand("%:t") =~ ".*\.slim"
      let g:indent_guides_auto_colors=0
      autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=8
      autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=248
      let g:indent_guides_enable_on_vim_startup=1
      let g:indent_guides_guide_size=1
    endif

		if !has('nvim')
			call dein#add('roxma/nvim-yarp')
			call dein#add('roxma/vim-hug-neovim-rpc')
		endif

		call dein#end()
		call dein#save_state()
	endif
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
" dein end


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
