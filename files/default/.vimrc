if has("gui_running")
	set guioptions-=T  "remove toolbar
endif
if has('gui_running') && !has('unix')
	set encoding=utf-8
endif

" Source other vim command
"if has('mac')
"    source $VIMRUNTIME/delmenu.vim
"	set langmenu=ja_jp.utf-8
"	source $VIMRUNTIME/menu.vim
"	set antialias
"	set macatsui
"	set termencoding=japan
"	set guifont=Osaka-Mono:h15
"endif
if has("gui_win32")
	if $TERM == ""
		set shell=$BASHPATH\ --login
	else
		set shell=$BASHPATH
	endif
	set shellslash

	" Add .vim directory to runtimepath
	set runtimepath+=$HOME\.vim

	" Windows setting for Access permissions
	set backupcopy=yes
	set nobackup
endif
if has('kaoriya')
  highlight CursorIM guibg=Purple guifg=NONE
  inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
  set iminsert=0 imsearch=0
endif

"highlight SpecialKey cterm=underline ctermfg=darkgrey
"highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
"match ZenkakuSpace /　/

" カレントウィンドウにのみ罫線を引く
"augroup cch
"  autocmd! cch
"  autocmd WinLeave * set nocursorcolumn nocursorline
"  autocmd WinEnter,BufRead * set cursorcolumn cursorline
"augroup END
"
"highlight CursorLine ctermbg=blue guibg=blue
"highlight CursorColumn ctermbg=blue guibg=blue


".vimrc


" Common options
syntax on
"set nobk
set grepprg=search\ $*
set iminsert=0
set imsearch=0
set listchars=eol:$,tab:>-
set ruler
set shortmess+=I
set visualbell
set scrolloff=2

set fileformats=unix,dos,mac " 改行コードの自動認識
"set showcmd
"set number
set nocompatible
"set clipboard+=unnamed
set wildmode=list:longest
set autoread
set showmode
set hidden
set noinsertmode
set showmode
set cmdheight=1
set nowrap
"set wrap
set laststatus=2
"set cmdheight=2
set showcmd
set title
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

if has("gui_win32")
	set guifont=ＭＳ_ゴシック:h12:cSHIFTJIS
	set printfont=ＭＳ_ゴシック:h10:cSHIFTJIS
	" autocmd GUIEnter * simalt ~x
	" autocmd GUIEnter * winpos 100 0
	autocmd GUIEnter * winsize 80 52
else
	au BufNewFile,BufRead fstab setf fstab
	if has("gui_running")
		if $LANG == "ja_JP.utf-8"
			inoremap   :set iminsert=0
			if $HOSTNAME == "vaio"
				" set guifontset=-alias-fixed-medium-r-normal-*-*-160-*-*-c-*-jisx0201.1976-0
				set printfont=-alias-fixed-medium-r-normal-*-*-160-*-*-c-*-jisx0201.1976-0
				set guifont=gothic\ Medium\ 14
			else
				set guifontset=-alias-fixed-medium-r-normal-*-*-160-*-*-c-*-jisx0201.1976-0
				set printfont=-alias-fixed-medium-r-normal-*-*-160-*-*-c-*-jisx0201.1976-0
			endif
			set imactivatekey=S-space
		endif
		autocmd GUIEnter * winsize 80 45 
	endif
endif

"tab (tab setting in ~/.vim/ftplugin/*.vim)
filetype plugin indent on
set tabstop=4
set shiftwidth=4

"edit
set columns=80
set showmatch
set backspace=indent,eol,start
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<

" search
set ignorecase
set smartcase
"set hlsearch
set nohlsearch
set incsearch 

" backup
set nobackup
set nowritebackup
set noswapfile

" □とか○の文字があってもカーソル位置がずれないようにする
set ambiwidth=double

if has("win32")
	set termencoding=cp932
endif
set fileencoding=utf8

" 文字コードの自動認識
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に utf-8 を使うようにする
" if has('autocmd')
"   function! AU_ReCheck_FENC()
"     if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
"       let &fileencoding = &encoding
"     endif
"   endfunction
"   autocmd BufReadPost * call AU_ReCheck_FENC()
" endif

"taglist.vim
set tags=tags

if has('mac')
  set iskeyword=@,48-57,_,128-167,224-235
  " SpotlightOpen
  let g:spotlightopen_match = 2
endif

" key map
nmap j gj
nmap k gk
vmap j gj
vmap k gk

" mru.vim 
let MRU_Max_Entries = 300
"let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'
let MRU_File = $HOME . '/.vim/.vim_mru_files'
" let MRU_Window_Height = 20 
" let MRU_Use_Current_Window = 1
" let MRU_Auto_Close = 0
nnoremap <silent> ;' :MRU<CR>

" FuzzyFinder
nnoremap <C-p> :FuzzyFinderFile <C-r>=fnamemodify(getcwd(), ':p')<CR><CR>
nnoremap <C-n> :FuzzyFinderFile <C-r>=expand('%:~:.')[:-1-len(expand('%:~:.:t'))]<CR><CR>


"バッファタブにパスを省略してファイル名のみ表示する(buftabs.vim)
let g:buftabs_only_basename=1
"バッファタブをステータスライン内に表示する
let g:buftabs_in_statusline=1
"バッファ切替のショートカット
noremap <C-left> :bprev<CR>
noremap <C-right> :bnext<CR>

"qbuf ショートカットキー
let g:qb_hotkey = ";;"

" zencoding
let g:user_zen_expandabbr_key = '<c-e>'

"半透明
if has("gui_running")
	gui
	set transparency=220
	colorscheme darkblue
endif
