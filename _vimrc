"Vi互換をオフ
set nocompatible
"set number
"バックアップファイルを作るディレクトリ
set backupdir=$HOME/vimbackup
set directory=$HOME/vimbackup
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer 
"クリップボードをWindowsと連携
set clipboard=unnamed
"タブ,インデント関係
set autoindent
set expandtab
set ts=4 sw=2 sts=2
set smarttab
set smartindent

"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"インクリメンタルサーチを行う
set incsearch
"タブ文字、行末など不可視文字を表示する
set list
set listchars=tab:>\ ,extends:<

"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END
