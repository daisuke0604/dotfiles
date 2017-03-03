"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/home/pi/dein')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('itchyny/lightline.vim')
call dein#add('jiangmiao/simple-javascript-indenter')
call dein#add('mattn/emmet-vim')

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

"構文ごとに色分けを行う
syntax on
"カラースキーマ
colorscheme zenburn

"カーソル行ハイライト
set cursorline

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
set mouse=
"ステータス行を常に表示
set laststatus=2
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

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" SuperTab like snippets behavior.
imap <expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

"lightline
let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ }

"simple-javascript-indenter
let g:SimpleJsIndenter_BriefMode = 1

