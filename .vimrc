set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" Mappings
let mapleader=","
let g:mapleader = ","

Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-sensible' " Be sensible
Plugin 'sheerun/vim-polyglot' " Language packs
Plugin 'vim-scripts/ReplaceWithRegister' " (eg. griw)
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-lastpat' " Search reuslts as text objects (eg. di/)
Plugin 'kana/vim-textobj-indent'  " Motions on similar indents of text (eg. <<ii, <<iI)

" NERDTree
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
let g:NERDTreeChDirMode = 2
let g:NERDTreeShowHidden = 1

" CtrlP
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_working_path_mode = 'rw'

" Ctags
Plugin 'ludovicchabant/vim-gutentags'
let g:gutentags_cache_dir = '/tmp'

" Airline
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
let g:airline#extensions#default#section_truncate_width = {
      \  'b': 90,
      \  'w': 150,
      \  'x': 90,
      \  'y': 130,
      \  'z': 110,
      \  'warning': 80,
      \  'error': 80,
      \ }

" Better searching
Plugin 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Tagbar for viewing file overview
Plugin 'majutsushi/tagbar'
noremap <leader>t :TagbarToggle<cr>

" Js syntax
" Plugin 'isRuslan/vim-es6'
Plugin 'elzr/vim-json'
Plugin 'pangloss/vim-javascript'
" Plugin 'jelera/vim-javascript'
" autocmd FileType javascript setlocal makeprg=standard

" Easily move blocks of text
Plugin 'matze/vim-move'
vmap <C-k> <Plug>MoveBlockUp
vmap <C-j> <Plug>MoveBlockDown
nmap <A-j> <Plug>MoveLineDown
nmap <A-k> <Plug>MoveLineUp

" Gitgutter
Plugin 'airblade/vim-gitgutter'
" let g:move_map_keys = 0
" let g:gitgutter_sign_column_always = 2
" let g:gitgutter_map_keys = 1
let g:gitgutter_realtime = 1
" let g:gitgutter_eager = 0
let g:gitgutter_sign_added = '⇒'
let g:gitgutter_sign_modified = '⇔'
let g:gitgutter_sign_removed = '⇐'
let g:gitgutter_sign_modified_removed = '⇎'

" Move around super easily
Plugin 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = '<Leader>e'
map <Space><Space> <Plug>(easymotion-bd-w)
" nmap s <Plug>(easymotion-s2)
" nmap t <Plug>(easymotion-t2)

" Visually display indents
Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_auto_colors = 1
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkgrey ctermbg=233
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=black ctermbg=232
let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_guide_size = 1 k

" SnipMate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
autocmd Filetype snippets setlocal expandtab tabstop=4 shiftwidth=4

" Auto wordwrap with some file types
au BufRead,BufNewFile *.md setlocal wrap

" Syntastic
Plugin 'scrooloose/syntastic'
let g:syntastic_javascript_checkers = ['standard']
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Themes
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'
Plugin 'NLKNguyen/papercolor-theme'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" using Source Code Pro
" set anti enc=utf-8
set guifont=Source\ Code\ Pro\ 11

" Wildmenu
set wildmenu
set wildmode=longest,full

" Whitespace
set listchars=tab:▸\ ,trail:· " Show tabs, trailing whitespace and end of lines
set list
set nowrap                    " Do not wrap lines
set expandtab                 " Use spaces instead of tabs
set smarttab                  " Be smart when using tabs ;-)
set softtabstop=2             " 1 tab is 2 spaces
set shiftwidth=2
set foldlevelstart=99         " Expand all folds by default.
set backspace=2
set smartcase                 " Infer uppercase search when uppercase used
" set encoding=utf-8

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Don't find these patterns
set wildignore+=/node_modules/*,*/tmp/*,*.so,*.swp,*.zip

" Easy window navigation
" nnoremap <C-h> <C-W>h
" nnoremap <C-j> <C-W>j
" nnoremap <C-k> <C-W>k
" nnoremap <C-l> <C-W>l
" if has('nvim')  " Required for neovim to handle c-h
"   nmap <BS> <C-W>h
" endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.* :call DeleteTrailingWS()

" Disable backup. No swap files.
set nobackup
set nowb
set noswapfile

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Don't hide json quotes
let g:vim_json_syntax_conceal = 0

" Set theme
colorscheme gruvbox
set background=dark
let g:gruvbox_italicize_comments = 1
let g:gruvbox_contrast_dark = "hard"
let g:indent_guides_auto_colors = 1
" set t_Co=256
" colorscheme PaperColor
" set background=dark

" colorscheme solarized
" set background=light

" Bindings
noremap <leader>n :NERDTree<cr>
nnoremap <Leader-p> :CtrlP<CR>:
nnoremap <Leader>/ :noh<CR><ESC>|
map <Leader>sw :w<Cr>
nmap <leader>v :tabedit $MYVIMRC<CR>

" Window
syntax enable       " Syntax highlighting
set hidden          " Allow hiding buffers with unsaved changes
set number          " Show line numbers
set relativenumber
set ruler           " Show cursor position
set spelllang=en_au " Australian English
set cursorline      " Show current line
set autoread        " Reload file when edited externally
set autoindent
" set smartindent

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Set tab colours
hi TabLineFill ctermfg=Red ctermbg=240
hi TabLine cterm=none ctermfg=234 ctermbg=240
hi TabLineSel ctermfg=white ctermbg=234

" Search
set ignorecase " Case insensitive search
set incsearch  " Makes search act like search in modern browsers
set hlsearch   " Highlight search results
highlight Search guibg=NONE guifg=197 gui=underline ctermfg=197 ctermbg=NONE cterm=underline
"
" Persistent undo
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " Where to save histories
set undolevels=1000         " How many undos
set undoreload=10000        " Number of lines to save

" colorscheme solarized
" set background=light
" Switch on highlighting the last used search pattern.
" if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
"   colorscheme solarized
"   set hlsearch
" endif

" hi Normal ctermbg=none
" hi NonText ctermbg=none

" Show spelling mistakes
hi SpellBad ctermfg=magenta

" " Tweak theme
hi javaScriptBraces cterm=none ctermbg=none ctermfg=darkcyan
hi javaScriptParens cterm=none ctermbg=none ctermfg=darkcyan
" syn match parens /[(){}]/
" hi parens ctermfg=magenta
" autocmd BufRead,BufNewFile * syn match commas /[(){}]/ | hi parens ctermfg=darkmagenta
" autocmd BufRead,BufNewFile * syn match parens /:,/ | hi parens ctermfg=darkmagenta
" " hi jsOperator ctermfg=blue
hi Operator cterm=none ctermbg=none ctermfg=blue
hi MatchParen cterm=none ctermbg=none ctermfg=darkmagenta
hi jsParen ctermfg=175
hi jsNoise ctermfg=cyan
hi jsVariableDef ctermfg=white
hi jsObject ctermfg=blue
syn keyword temp ","
hi temp ctermfg=red
hi IndentGuidesOdd  guibg=darkgrey ctermbg=235
hi IndentGuidesEven guibg=black ctermbg=234

" Color column
" let &colorcolumn=join(range(81,999),",")
" highlight ColorColumn ctermbg=235 guibg=#2c2d27
" let &colorcolumn="80,".join(range(120,999),",")
highlight ColorColumn ctermbg=236
call matchadd('ColorColumn', '\(\%80v\|\%100v\)', 100)  " Show +80 as coloured

runtime macros/matchit.vim
