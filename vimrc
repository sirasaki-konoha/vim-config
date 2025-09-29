packadd vim-jetpack

call jetpack#begin()
	Jetpack 'tani/vim-jetpack'
	Jetpack 'obcat/vim-hitspop'
	Jetpack 'tpope/vim-commentary'
	Jetpack 'tpope/vim-sensible'
	Jetpack 'dominikduda/vim_current_word'
	Jetpack 'ConradIrwin/vim-bracketed-paste'
	Jetpack 'ctrlpvim/ctrlp.vim'
	Jetpack 'neoclide/coc.nvim', {'branch': 'release'}
	Jetpack 'karoliskoncevicius/moonshine-vim'
	Jetpack 'sirasaki-konoha/mpc.vim'
	Jetpack 'lambdalisue/vim-fern'
	Jetpack 'lambdalisue/vim-fern-hijack'
	Jetpack 'lambdalisue/nerdfont.vim'
	Jetpack 'lambdalisue/vim-fern-renderer-nerdfont'
	Jetpack 'simeji/winresizer'
	Jetpack 'jiangmiao/auto-pairs'
call jetpack#end()

"""""""""""""" leader
let mapleader = "\<Space>"

"""""""""""""" colorscheme
colorscheme moonshine

"""""""""""""" mpc.vim
nnoremap <silent> <Leader>m :MpcPlaylist<CR>
nnoremap <silent> <Leader>l :MpcLibrary<CR>
nnoremap <silent> <Leader>> :MpcPlayNext<CR>
nnoremap <silent> <Leader>< :MpcPlayPrev<CR>

"""""""""""""" Fern
let g:fern#renderer = "nerdfont"
nnoremap <Leader>e :Fern . -drawer -reveal=% -toggle -width=25<CR>

"""""""""""""" Coc
autocmd CursorHoldI * silent call CocActionAsync('showSignatureHelp')

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Tabで補完候補の移動
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" シンボル定義にジャンプ（LSP機能）
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" ホバーで型情報やドキュメントを表示
nnoremap <silent> K :call CocActionAsync('doHover')<CR>

"""""""""""""" hlsearch
set hlsearch
let g:vim_current_word#highlight_current_word = 0
let g:vim_current_word#highlight_delay = 500

"""""""""""""" indent
set autoindent
set smartindent
set cindent
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=0



