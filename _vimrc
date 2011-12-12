"Vi互換をオフ
set nocompatible
"シンタックスハイライト
syntax on

"vundle用
filetype off
if has("win32") || has("win64")
  set rtp+=~/vimfiles/vundle.git/ 
  call vundle#rc('~/vimfiles/bundle/')
else
  set rtp+=~/.vim/vundle.git/ 
  call vundle#rc()
endif

"Plugins  
Bundle 'Shougo/neocomplcache'
Bundle 'quickrun.vim'
Bundle 'html5.vim'
Bundle 'rails.vim'
Bundle 'project.tar.gz'

filetype plugin indent on

cd $HOME

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

"ステータスバーに文字コードと改行コードを表示する
set laststatus=2
set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P\

" キーマップ
nmap <Space>b :ls<CR> :buffer
nmap <Space>f :edit .<CR>
nmap <Space>v :vsplit<CR><C-w><C-w>:ls<CR>:buffer
nmap <Space>V :Vexplore!<CR><CR>

" neocomplcache用の設定
	let g:acp_enableAtStartup = 0
	" Use neocomplcache.
	let g:neocomplcache_enable_at_startup = 1
	" Use smartcase.
	let g:neocomplcache_enable_smart_case = 1
	" Use camel case completion.
	let g:neocomplcache_enable_camel_case_completion = 1
	" Use underbar completion.
	let g:neocomplcache_enable_underbar_completion = 1
	" Set minimum syntax keyword length.
	let g:neocomplcache_min_syntax_length = 3
	let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
	
	" Define dictionary.
	let g:neocomplcache_dictionary_filetype_lists = {
	    \ 'default' : '',
	    \ 'vimshell' : $HOME.'/.vimshell_hist',
	    \ 'scheme' : $HOME.'/.gosh_completions'
	        \ }
	
	" Define keyword.
	if !exists('g:neocomplcache_keyword_patterns')
	    let g:neocomplcache_keyword_patterns = {}
	endif
	let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
	
	" Plugin key-mappings.
	imap <C-k>     <Plug>(neocomplcache_snippets_expand)
	smap <C-k>     <Plug>(neocomplcache_snippets_expand)
	inoremap <expr><C-g>     neocomplcache#undo_completion()
	inoremap <expr><C-l>     neocomplcache#complete_common_string()
	
	" SuperTab like snippets behavior.
	"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
	
	" Recommended key-mappings.
	" <CR>: close popup and save indent.
	inoremap <expr><CR>  neocomplcache#close_popup() . "\<CR>"
	" <TAB>: completion.
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
	" <C-h>, <BS>: close popup and delete backword char.
	inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
	inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
	inoremap <expr><C-y>  neocomplcache#close_popup()
	inoremap <expr><C-e>  neocomplcache#cancel_popup()
	
	" For cursor moving in insert mode(Not recommended)
	inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
	inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
	inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
	inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
	
	" AutoComplPop like behavior.
	"let g:neocomplcache_enable_auto_select = 1
	
	" Shell like behavior(not recommended).
	"set completeopt+=longest
	"let g:neocomplcache_enable_auto_select = 1
	"let g:neocomplcache_disable_auto_complete = 1
	"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
	"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
	
	" Enable omni completion.
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
	
	" Enable heavy omni completion.
	if !exists('g:neocomplcache_omni_patterns')
	  let g:neocomplcache_omni_patterns = {}
	endif
	let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
	"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
	let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
	let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
	let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

