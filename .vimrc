"neobundle
if has('vim_starting')
    set nocompatible               " Be iMproved
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

"構文ごとに色分けを行う
syntax on
"カラースキーマ
colorscheme hybrid

"バッファ切り替え
cmap bb :ls<CR>:buf

"新しい行のインデントを現在行と同じにする
set autoindent
"バックアップファイルを作るディレクトリ
set backupdir=$HOME/vimbackup
"スワップファイル用のディレクトリ
set directory=$HOME/vimbackup
"タブの代わりに空白文字を挿入する
set expandtab
"インクリメンタルサーチを行う
set incsearch
"タブ文字、行末など不可視文字を表示する
"set list
"listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>\ ,extends:<
"行番号を表示する
set number
"シフト移動幅
set shiftwidth=4
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"ファイル内の <Tab> が対応する空白の数
set tabstop=4
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"マウス連携
set mouse=a
"ステータス行を常に表示
set laststatus=2
"カレント行ハイライト
"set cursorline
"スクロール送り
set scrolloff=10

"保存時に行末の空白を除去
function! s:remove_eol_spaces()
    let cursor = getpos(".")
    %s/\s\+$//ge
    call setpos(".", cursor)
    unlet cursor
endfunction
autocmd BufWritePre * call <SID>remove_eol_spaces()

"makefileでexpandtabを無効にする
autocmd FileType make setlocal noexpandtab

"netrwの初期状態でツリー表示
let g:netrw_liststyle = 3

"lightline
let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ }


"simple-javascript-indenter
let g:SimpleJsIndenter_BriefMode = 1

call neobundle#rc(expand('~/.vim/bundle/'))

"Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

"Recommended to install
"After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc', {
            \ 'build': {
            \   'windows': 'make -f make_mingw32.mak',
            \   'cygwin': 'make -f make_cygwin.mak',
            \   'mac': 'make -f make_mac.mak',
            \   'unix': 'make -f make_unix.mak',
            \ },
            \}

"My Bundles here:
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'itchyny/lightline.vim'

NeoBundle 'scrooloose/syntastic'
NeoBundle 'jiangmiao/simple-javascript-indenter'

NeoBundle 'w0ng/vim-hybrid'

NeoBundle 'mattn/emmet-vim'

filetype plugin indent on     " Required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

"Installation check.
NeoBundleCheck

