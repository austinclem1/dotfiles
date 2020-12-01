call plug#begin(stdpath('data'))


" Plug 'SirVer/ultisnips'
" Plug 'Valloric/YouCompleteMe'
" Plug 'clktmr/vim-gdscript3'
" Plug 'dense-analysis/ale'
" Plug 'ervandew/supertab'
" Plug 'jiangmiao/auto-pairs'
" Plug 'jremmen/vim-ripgrep'
" Plug 'lifepillar/vim-mucomplete'
" Plug 'maralla/completor.vim', { 'do': 'make js' }
" Plug 'sheerun/vim-polyglot'
" Plug 'ternjs/tern_for_vim'
" Plug 'tpope/vim-endwise'
" Plug 'tpope/vim-ragtag'
" Plug 'tpope/vim-sensible'
" Plug 'vim-syntastic/syntastic'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'Raimondi/delimitMate'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'habamax/vim-godot'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'lambdalisue/vim-fullscreen'
Plug 'leafgarland/typescript-vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'mileszs/ack.vim'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'rbong/vim-flog'
Plug 'relastle/bluewery.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tomasiser/vim-code-dark'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'ziglang/zig.vim'
call plug#end()

set nocompatible

" don't skip over long wrapped lines
" noremap j gj
" noremap k gk

" autocmd vimenter * ++nested colorscheme gruvbox

colorscheme codedark
let g:airline_theme = 'codedark'

" set lines=32
" set columns=160

let g:coc_global_extensions = [
	\ 'coc-tsserver'
	\ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
	let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./nomodeline') && isdirectory('./nomodeline/esline')
	let g:coc_global_extensions += ['coc-eslint']
endif

" use powershell instead of cmd.exe
" set shell=powershell
" set shellquote="
" set shellpipe=\|
" set shellxquote=
" set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command
" set shellredir=\|\ Out-File\ -Encoding\ UTF8

" search will use smartcase with these together
set ignorecase
set smartcase

set wildmenu

syntax enable
filetype plugin indent on

let mapleader = "\<Space>"

set omnifunc=syntaxcomplete#Complete

" recursive path searching
set path+=**

" Generate ctags file, ctags must be installed
" Uses ripgrep to determine which files to parse
" Thanks to ripgrep input, it respects .gitignore
command! MakeTags !rg --files | ctags --links=no -L-
" - ^] jump to tag under cursor
" - g^] for ambiguous tags
" - ^t jump back up tag stack
map <Leader>mt :MakeTags<CR>

set number
set relativenumber

let g:netrw_banner=0 " disable banner
let g:netrw_browse_split=4 " open previous window
let g:netrw_altv=1 " right split
let g:netrw_liststyle=3 " tree style
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

if executable('rg')
	" set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
	" let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
	let g:ctrlp_user_command = 'rg %s --files'
	let g:ctrlp_use_caching = 0
	let g:ctrlp_working_path_mode = 'ra'
	let g:ctrlp_switch_buffer = 'et'
else
	let g:ctrlp_clear_cache_on_exit = 0
endif

nmap <leader>. :CocList outline<CR>

autocmd InsertEnter * :set timeoutlen=200
autocmd InsertLeave * :set timeoutlen=1000

imap <C-[> <Esc>
imap fd <Esc>

nmap 0 ^

nmap <A-/> :nohlsearch<CR>

nmap <leader>vr :tabedit $MYVIMRC<CR>
nmap <leader>so :source $MYVIMRC<CR>

" recent files
nmap <leader>fr :CtrlPMRU<CR>

" fuzzy open buffers
nmap <leader>bb :CtrlPBuffer<CR>
" close buffer
nmap <leader>bd :bd<CR>

let g:fullscreen#start_command = "call rpcnotify(0, 'Gui', 'WindowFullScreen', 1)"
let g:fullscreen#stop_command = "call rpcnotify(0, 'Gui', 'WindowFullScreen', 0)"
let g:fullscreen#toggle_callback_post = "mode"
map <F11> :FullscreenToggle<CR>

set backspace=2
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler
set showcmd
set incsearch
set laststatus=2
set autowrite
set modelines=0
set nomodeline

" If terminal has colors, use syntax highlighting
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
	syntax on
endif

set tabstop=2
set shiftwidth=2
set shiftround
set noexpandtab

set list listchars=tab:»·,trail:·,nbsp:·
set list

set nojoinspaces

if executable('rg')
	set grepprg=rg

	let $FZF_DEFAULT_COMMAND = 'rg'
endif

set textwidth=80
set colorcolumn=+1

set number
set numberwidth=5

nnoremap <Leader>r :RunInInteractiveShell<Space>

" More natural split default
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Move between tabs
nnoremap <A-l> gt
nnoremap <A-h> gT

" Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" Alt-w search for one character input
map <A-w> <Plug>(easymotion-s)
" Alt-s search by multiple characters, wait for enter
nmap <A-s> <Plug>(easymotion-sn)
let g:EasyMotion_smartcase = 1

map z/ <Plug>(incsearch-easymotion-/)

" colorscheme jellybeans
" let g:lightline = { 'colorscheme': 'jellybeans' }

" Esc works from terminal mode
tnoremap <Esc> <C-\><C-n>

" NERDTree open on right
let g:NERDTreeWinPos='right'

" " Tab completion
" " will insert tab at beginning of line,
" " will use completion if not at beginning
" set wildmode=list:longest,list:full
" function! InsertTabWrapper()
"		let col = col('.') - 1
"		if !col || getline('.')[col - 1] !~ '\k'
"			return "\<Tab>"
"		else
"			return "\<C-p>"
"		endif
" endfunction
" inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
" inoremap <S-Tab> <C-n>

" Ctrl Space to omni complete
imap <C-Space> <C-x><C-o>

" file types for close tag
let g:closetag_filetypes = 'html,xhtml,phtml,javascript,javascriptreact'
let g:closetag_shortcut = '>'

" expand <CR> with delimitmate
let g:delimitMate_expand_cr=1

" F8 to open tagbar
nmap <F8> :TagbarToggle<CR>

" SUGGESTED SETTINGS FOR CoC
set hidden

set cmdheight=2
set updatetime=300

set shortmess+=c

if has("patch-8.1.1564")
	set signcolumn=number
else
	set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" mappings to navigate diagnostics
" :CocDiagnostics to get all diagnostics of current buffer
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

nmap <F2> <Plug>(coc-refactor)

" c-space to trigger completion
if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" NeoVim-only mapping for visual mode scroll
" Useful on signatureHelp after jump placeholder of snippet expansion
if has('nvim')
  vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
  vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"
endif

" C-n toggle NERTTree
nmap <C-n> :NERDTreeToggle<CR>

" C-r to start replace with selection
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Make help windows appear on the right
autocmd FileType help wincmd L

nmap <F8> :TagbarToggle<CR>

" let g:tagbar_type_gdscript3.deffile = '~/ctags.d/gdscript3.ctags'

" leader lsd to interactively delete buffers
nnoremap <leader>lsd :ls<cr>:bd<space>

" git fugitive mappings
nmap <leader>gh :diffget //2<CR>
nmap <leader>gl :diffget //3<CR>
nmap <leader>gs :G<CR>
nmap <leader>gc :G commit<CR>
nmap <leader>gl :G log<CR>

" mapping to go to current file directory
nmap <leader>cd :cd %:h<CR>

nnoremap <Leader>/ :Rg<Space>

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>

" TEMP rename vars with m_ prefix
nnoremap <leader>rm "hyiW:%s/<C-r>h\\|self.<C-r>h/m_<C-r>h/gc
