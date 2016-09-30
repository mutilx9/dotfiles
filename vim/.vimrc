" vim: set foldmethod=marker foldlevel=0:

let g:mapleader = "\<Space>"

" Plug {{{
call plug#begin('~/.vim/plugged')

" Interface {{{
Plug 'tomasr/molokai'
	let g:molokai_original = 0
Plug 'timakro/vim-searchant'
" }}}

" Browsing {{{
Plug 'kien/ctrlp.vim', { 'on': 'CtrlP' }
	let g:ctrlp_show_hidden = 0
	nmap <C-p> :CtrlP<cr>
Plug 'mhinz/vim-grepper', { 'on': 'Grepper' }
	let g:grepper = {
		\ 'tools': ['ag', 'grep', 'git'],
		\ 'ag': {
		\   'grepprg':    'ag --vimgrep --hidden',
		\ }}
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
	let g:undotree_WindowLayout = 2
	let g:undotree_SetFocusWhenToggle = 1
	map <C-z> :UndotreeToggle<cr>
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	let g:NERDTreeIgnore=['\.pyc$', '\.orig$']
Plug 'tpope/vim-eunuch'
" }}}

" Edit {{{
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'wellle/targets.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'vimoutliner/vimoutliner', {'for': 'votl'}
" }}}

" Syntax {{{
if &t_Co == '256'
	Plug 'aserebryakov/filestyle'
endif
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
	let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'python', 'sass', 'xml', 'html']
Plug 'jtratner/vim-flavored-markdown', { 'for': ['markdown', 'mdown', 'md'] }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'Glench/Vim-Jinja2-Syntax', { 'for': 'jinja' }
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
Plug 'PotatoesMaster/i3-vim-syntax', { 'for': 'i3' }
Plug 'elentok/todo.vim', { 'for': 'todo' }
Plug 'lotheac/pf.vim', { 'for': 'pf' }
" }}}

" Programming {{{
Plug 'w0rp/ale'
Plug 'scrooloose/syntastic'
	let g:syntastic_mode_map = {
		\ "mode": "passive",
		\ "active_filetypes": [],
		\ "passive_filetypes": [] }
	let g:syntastic_check_on_wq = 0
	let g:syntastic_aggregate_errors = 1
	let g:syntastic_php_checkers = ['php', 'phpmd']
	let g:syntastic_python_checkers = ['python', 'flake8', 'pylint']
Plug 'Shougo/neocomplete.vim'
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
	let g:pymode_lint = 0
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
	let g:jedi#popup_on_dot = 0
	let g:jedi#use_splits_not_buffers = "left"
	let g:jedi#show_call_signatures = "0"
Plug 'phpvim/phpcd.vim', { 'for': 'php' }
Plug 'metakirby5/codi.vim', { 'on': 'Codi' }
Plug 'vim-scripts/dbext.vim', { 'for': 'sql' }
Plug 'vim-scripts/SQLComplete.vim', { 'for': 'sql' }
" }}}

" Git {{{
Plug 'tpope/vim-fugitive'
	autocmd	BufReadPost fugitive://* set bufhidden=delete
Plug 'airblade/vim-gitgutter'
	let g:gitgutter_grep_command='grep -e'
Plug 'rhysd/committia.vim'
Plug 'gregsexton/gitv', { 'on': 'Gitv' }
" }}}

call plug#end()
" }}}

" Vanilla configuration {{{

" Basic {{{
set backspace=indent,eol,start
set ffs=unix,dos,mac	" Use Unix as the standard file type
syntax on			" Syntax
set encoding=utf-8	" Charset for new files
set fileencoding=utf-8	" Charset for saved files
set noswapfile		" .swap
set number			" Lines with absolute numbers
set relativenumber	" Lines with relative numbers
set cursorline		" Highlights current line
set title			" Terminal title
set autoread		" Rereads the file when changed from the outside
set magic			" Regular expressions
set showtabline=1	" If a tab exist, show them
set tabstop=4		" Default: TAB = 4 spaces visually
set softtabstop=4	" Default: TAB = 4 spaces visually
set shiftwidth=4	" Default: only tabs
set noexpandtab		" Never uses spaces to indent
set autoindent		" Copy indent at <BR>
set smartindent		" Indent when needed
set ignorecase		" Ignore case at searches
set smartcase		" Ignore case at searches, when needed
set gdefault		" g flag default at substitute
set scrolloff=10	" Number of lines to keep above and below the cursor
set hlsearch		" Highlight searches
set incsearch		" Jump to search while writing
set laststatus=2	" Always show the status line
set shortmess=atI	" Shorter info tokens
set cpoptions+=$	" Change like vi
set wildmenu		" Better command-line completion
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set lazyredraw		" Don't redraw when executing macros
" }}}

" Window {{{
set winwidth=80
set winheight=10
set winminheight=10
set winheight=999
" }}}

" Status line {{{
set statusline=
set statusline+=%1*%3v
set statusline+=%0*\ %f%m\ %w
set statusline+=\ \ %=
set statusline+=\ \ %{&ff=='unix'?'\\n':(&ff=='mac'?'\\r':'\\r\\n')}
set statusline+=\ \ %{&fenc}
set statusline+=\ \ %{&ft}
set statusline+=\ %{GitHead()}
set statusline+=\ %{GitHunks()}
" }}}

" Chars {{{
set listchars=tab:▸\ 
set listchars+=eol:$
set listchars+=trail:+
set listchars+=space:␣
" }}}

" Persistent undo {{{
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000
" }}}

" }}}

" Mappings {{{

" Movement {{{
nnoremap <Tab> ''
" }}}
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
" Change cmd history to quit
map q: :q
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

colorscheme molokai

" }}}

" Filetypes {{{

filetype plugin on

" Disable filestyle at tagbar without breaking everything
autocmd Filetype tagbar setlocal expandtab
" Web
autocmd Filetype html,jinja,css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype markdown,*.rst setlocal spell

" PEP8 Python
autocmd Filetype python setlocal textwidth=79 colorcolumn=79
autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd Filetype python setlocal expandtab softtabstop=4 shiftround autoindent
autocmd Filetype python setlocal foldmethod=indent
autocmd Filetype python setlocal omnifunc=jedi#completions

" }}}

" Funcs {{{

function! GitHead()
	if exists(":Gstatus")
		return fugitive#head()
	else
		return ''
	endif
endfunction

function! GitHunks()
	let hunk_symbols = ['+', '~', '-']
	let string = ''
	if exists(":GitGutter")
		let hunks = GitGutterGetHunkSummary()
	else
		return string
	endif
	for i in [0, 1, 2]
		if hunks[i] > 0
			let string .= printf('%s%s', hunk_symbols[i], hunks[i])
		endif
	endfor
	return string
endfunction

" Save cursor position
augroup resCur
	autocmd!
	autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" }}}
