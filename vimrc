" 開発用
" set runtimepath+=/home/rock-db/develop/mpc.vim


call plug#begin()

" ステータスバー
Plug 'itchyny/lightline.vim'

" LSPとか
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" ファイルビューワー
Plug 'lambdalisue/vim-fern'

" :edit とかで起動するファイルマネージャーをfernにするやつ
Plug 'lambdalisue/vim-fern-hijack'

" zigの公式vimプラグイン
Plug 'ziglang/zig.vim'

" theme
Plug 'gruvbox-community/gruvbox'

" コードのコメントアウトを簡単にするやつ（gcc など）
Plug 'tpope/vim-commentary'

" skkをvim内で使うやつ
Plug 'vim-skk/eskk.vim'

" mpcをvim内から動かしたい！
Plug 'rock-db/mpc.vim'

call plug#end()

set background=dark
colorscheme gruvbox

set autoindent

autocmd FileType sh setlocal shiftwidth=2 tabstop=2 softtabstop=2



" Fern keybinds
let mapleader = "\<Space>"
nnoremap <Leader>f :Fern . -drawer -reveal=% -toggle -width=25<CR>


" 再インデント用
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
xnoremap <Leader>e gc


" Coc
autocmd CursorHoldI * silent call CocActionAsync('showSignatureHelp')

" Enterキーで候補があればそれを確定、なければ改行
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"

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

" vim-mpcの設定
nnoremap <Leader>m :MpcPlaylist<CR>
nnoremap <silent>+ :MpcVolumeUP<CR>
nnoremap <silent>- :MpcVolumeDown<CR>
nnoremap <Leader>n :MpcPlayNext<CR>
nnoremap <Leader>p :MpcPlayPrev<CR>


" eskkの設定
let g:eskk#enable_dictionary_cache = 0
let g:eskk#large_dictionary = {
      \ 'path': expand('~/.skk/SKK-JISYO.L.utf8'),
      \ 'sorted': 1,
      \ 'encoding': 'utf-8',
      \ }


let g:eskk#dictionary = {
      \ 'file': expand('~/.skk-jisyo'),
      \ 'sorted': 0,
      \ 'encoding': 'utf-8',
      \ }

" SKK有効化トグルキー（任意）
inoremap <C-j> <Plug>(eskk:toggle)

" lightlineと連携（任意）
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'eskk' ], [ 'filename' ] ],
      \ },
      \ 'component_function': {
      \   'eskk': 'eskk#statusline',
      \ }
      \ }


" 普通にキーバインド
nnoremap Q :bprev<CR>
nnoremap E :bnext<CR>


