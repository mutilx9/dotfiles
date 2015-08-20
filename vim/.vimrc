" vim: set foldmethod=marker foldlevel=0:

" Plug {{{
call plug#begin('~/.vim/plugged')

" Interface {{{
Plug 'bling/vim-airline'
	let g:airline_powerline_fonts = 1
	let g:airline#extensions#tagbar#enabled = 0
Plug 'edkolev/tmuxline.vim'
Plug 'ntpeters/vim-airline-colornum'
Plug 'tomasr/molokai'
	let g:molokai_original = 0
" }}}

" Browsing {{{
Plug 'kien/ctrlp.vim', { 'on': 'CtrlP' }
	let g:ctrlp_show_hidden = 0
	nmap <C-p> :CtrlP<cr>
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
	let g:undotree_WindowLayout = 2
	let g:undotree_SetFocusWhenToggle = 1
	map <C-z> :UndotreeToggle<cr>
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	let g:NERDTreeIgnore=['\.pyc$', '\.orig$']
	map <C-d> :NERDTreeToggle<cr>
" }}}

" Edit {{{
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
" }}}

" Syntax {{{
Plug 'aserebryakov/filestyle'
Plug 'tpope/vim-markdown', { 'for': ['markdown', 'mdown', 'md'] }
Plug 'jtratner/vim-flavored-markdown', { 'for': ['markdown', 'mdown', 'md'] }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'PotatoesMaster/i3-vim-syntax', { 'for': 'i3' }
Plug 'elentok/todo.vim', { 'for': 'todo' }
" }}}

" Programming {{{
Plug 'scrooloose/syntastic'
	let g:syntastic_check_on_wq = 0
	let g:syntastic_php_checkers = ['php', 'phpmd']
Plug 'SirVer/ultisnips'
	let g:UltiSnipsJumpForwardTrigger="<c-f>"
	let g:UltiSnipsJumpBackwardTrigger="<c-b>"
Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
	let g:tagbar_autofocus = 1
	nmap <C-t> :TagbarToggle<cr>
Plug 'klen/python-mode', { 'for': 'python' }
	let g:pymode = 1
	let g:pymode_rope = 0
	let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
	let g:jedi#use_splits_not_buffers = "left"
	let g:jedi#show_call_signatures = "2"
Plug 'vim-scripts/dbext.vim', { 'for': 'sql' }
Plug 'vim-scripts/SQLComplete.vim', { 'for': 'sql' }
" }}}

" Git {{{
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/committia.vim'
Plug 'gregsexton/gitv', { 'on': 'Gitv' }
" }}}

"System {{{
Plug 'darvelo/vim-systemd', { 'for': 'systemd' }
" }}}

call plug#end()
" }}}

" Basic configuration {{{

" Encoding
set encoding=utf-8	" Charset utf-8
scriptencoding utf-8

" Basic
set backspace=indent,eol,start
set ffs=unix,dos,mac	" Use Unix as the standard file type
syntax on			" Syntax
set noswapfile		" .swap
set number			" Lines with absolute numbers
set relativenumber	" Lines with relative numbers
set title			" Terminal title
set autoread		" Rereads the file when changed from the outside
set magic			" Regular expressions
set showtabline=1	" If a tab exist, show them
set tabstop=4		" Default: TAB = 4 spaces visually
set softtabstop=4	" Default: TAB = 4 spaces visually
set shiftwidth=4	" Default: only tabs
set noexpandtab		" Never uses spaces to indent
set autoindent		" Copy indent at <BR>
set scrolloff=10	" Number of lines to keep above and below the cursor
set incsearch		" Jump to search while writing
set laststatus=2	" Always show the status line
set shortmess=atI	" Shorter info tokens
set noshowmode		" Clean the command line

" Chars
set listchars=tab:▸\ 
set listchars+=eol:$
set listchars+=trail:+
set listchars+=space:␣

" persistent undo
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

" }}}

" Mappings {{{

let g:mapleader = ','
" Saving {{{
" Fast saving
nmap <leader>w :w!<cr>
" Fast saving and close
nmap <leader>x :x!<cr>
" Fast close without saving
nmap <leader>qq :q!<cr>
" }}}
" Clipboard {{{
" Yank to clipboard
nmap <leader>y "+y
vmap <leader>y "+y
" Put from clipboard
nmap <leader>p :put+<CR>
" }}}
" Windows {{{
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-h> <C-w><Left>
map <C-l> <C-w><Right>
" }}}
" Invisible chars
nmap <leader>l :set list!<CR>
" Spelling
nmap <leader>en :setlocal spell spelllang=en<CR>
nmap <leader>es :setlocal spell spelllang=es<CR>
" Escaping
inoremap jk <Esc>
" STOP USING THE ARROW KEYS, HOME AND END {{{
noremap <Up>	<nop>
imap <Up>	<nop>
noremap <Down>	<nop>
imap <Down>	<nop>
noremap <Left>	<nop>
imap <Left>	<nop>
noremap <Right>	<nop>
imap <Right>	<nop>
noremap <Home>	<nop>
imap <Home>	<nop>
noremap <End>	<nop>
imap <End>	<nop>
" }}}
" }}}

" Colorscheme {{{

color molokai

" }}}

" Filetypes {{{

filetype plugin on

" Disable filestyle at tagbar without breaking everything
autocmd Filetype tagbar setlocal expandtab
" Web and notes
autocmd Filetype html,css,rst setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype markdown,*.rst setlocal spell

" PEP8 Python
autocmd Filetype python setlocal textwidth=79 colorcolumn=79
autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd Filetype python setlocal expandtab softtabstop=4 shiftround autoindent
autocmd Filetype python setlocal foldmethod=indent
autocmd Filetype python setlocal omnifunc=jedi#completions

" }}}

" Funcs {{{

" Save cursor position
augroup resCur
	autocmd!
	autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" }}}
"
" Fallback {{{

" Standard status line
set statusline=
set statusline+=\ %f%m\ %w\ 
set statusline+=\ %=
set statusline+=%3*\ %04l\ /\ %03v\ 
set statusline+=%4*\ %{&fenc!=''?&fenc:&enc}\ 
set statusline+=%3*\ %{&ff=='unix'?'\\n':(&ff=='mac'?'\\r':'\\r\\n')}\ 
set statusline+=%=%5*\ %P\ 

" }}}
