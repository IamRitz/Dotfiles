"Vim Options
set nocompatible

filetype off

"Plugin Management
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround' 
Plug 'https://github.com/tpope/vim-commentary'    " Vim Comments using gcc or gc
Plug 'scrooloose/nerdtree'						" added nerdtree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'frazrepo/vim-rainbow'
Plug 'ap/vim-css-color'
Plug 'kshenoy/vim-signature'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'junegunn/fzf.vim'
Plug 'vimwiki/vimwiki'
Plug 'voldikss/vim-floaterm'
Plug 'junegunn/vim-emoji'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

call plug#end()

let g:rainbow_active = 1
let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ }

let g:Hexokinase_highlighters = [ 'backgroundfull' ]

filetype plugin indent on
syntax on
set backspace=indent,eol,start
set encoding=utf-8
let mapleader=" "

"Searching patterns and highlighting
set hlsearch
set incsearch
set magic "no need to escape backslashes
set ignorecase
set smartcase
set termguicolors "Use GUI colors for the terminal

"Tabs and Indenting
set expandtab "Expand tab to spaces in insert mode
set tabstop=4 "Num of spaces a <TAB> in the text stands for
set shiftwidth=4 "Num of spaces used for each step of (auto)indent
set softtabstop=4
set smarttab "A tab in an indent insets spaces of length shiftwidth
set autoindent
set number relativenumber

"Setting nrformats to include alphabets also
set nrformats=bin,octal,hex,alpha

"Status Lightline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

"Multiple Window management
set splitbelow
set splitright

"Using Mouse
set mouse=a

set showmatch "Briefly jump to correspoding bracket match
set matchtime=3

" non-normal modes showing in powerline, comment to show below powerline.
set noshowmode

"Add a Spell Check
set spelllang=en
set spellfile=~/.vim/spell/en.utf-8.add "File that is used to add or remove custom words by [zg]/[zug]

"reset hlsearch
nnoremap <nowait><silent> <CR> :noh<CR>

" set moving between windows to ctrl+hjkl
noremap <silent> <C-l> <c-w>l
noremap <silent> <C-p> <c-w>h
noremap <silent> <C-k> <c-w>k
noremap <silent> <C-j> <c-w>j

"Custom cut copy paste command
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

"Auto close pairs
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

"FZF mappings
nnoremap <leader>ff :Files<CR>

"NerdTree mappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

hi SignColumn guibg=NONE "Patch has made it case-sensitive i.e. NONE in place of none
hi SignColumn ctermbg=none
hi SignatureMarkText ctermbg=none

"Mapping for FloatTerm
let g:floaterm_keymap_new = '<leader>ft'
let g:floaterm_keymap_toggle = '<leader>tt'

"Map Ctrl-BS to delete a word
"Since Ctrl-BS sends C-H we need to remap to C-H and change mapping of C-H
"previously
"inoremap <C-w> <C-\><C-o>dB
inoremap <C-H> <C-\><C-o>dB

"Plug mappings for Limelight
nmap <Leader>l <Plug>(Limelight)
xmap <Leader>l <Plug>(Limelight)

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

"Goyo integration with Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"Map ,* to count the number of occurance of the word under the cursor
map ,* *<C-O>:%s///gn<CR>

"Custom command to count the number of occurance of a word
command -nargs=1 Count :%s/<args>//gn
