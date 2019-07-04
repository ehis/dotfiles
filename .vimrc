" Don't try to be vi compatible set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

set completeopt+=noinsert

" Load plugins here (pathogen, vundle or vim-plug)
call plug#begin('~/.vim/plugged')

Plug 'w0rp/ale'
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-signify'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'scrooloose/nerdcommenter'
Plug 'hashivim/vim-terraform'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'luochen1990/rainbow'
Plug 'jparise/vim-graphql'

call plug#end()

"Rainbow Brackets - Set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_active = 1

let g:javascript_plugin_jsdoc = 1

"Flow
let g:javascript_plugin_flow = 1

" Elixir
let g:mix_format_on_save = 1

" ALE Configuration
let g:ale_set_highlights = 0
let g:ale_completion_enabled = 1
let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
let g:ale_linter_aliases = {'tsx': ['css', 'typescript']}

let g:ale_linters = {'javascript': ['eslint', 'flow-language-server']}

let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'javascript': ['eslint', 'prettier'],
      \   'typescript': ['tslint', 'prettier'],
      \   'css': ['prettier'],
      \   'jsx': ['eslint', 'stylelint'],
      \ }

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

" FZF Configuration

" This is the default extra key bindings
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'


" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" Collect swap files in a tmp directory
set directory^=$HOME/.vim/tmp//

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" Pick a leader key
let mapleader = " "

" Split window navigation in vim
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" move lines up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


" Copy & Paste to system clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" FZF mappings
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>F :GFiles<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>m :Marks<CR>
nnoremap <silent> <leader>a :Ag<CR>
nnoremap <silent> <leader>r :Rg<CR>

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Encoding
set encoding=utf-8

" Whitespace
set nowrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file]"


" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Colorscheme
colorscheme peachpuff
hi Statusline guibg=White ctermfg=Magenta ctermbg=White
hi Search ctermbg=DarkGrey

" Vimdiff color fixes
highlight DiffAdd    cterm=NONE ctermfg=0 ctermbg=2
highlight DiffDelete cterm=NONE ctermfg=0 ctermbg=1
highlight DiffChange cterm=NONE ctermfg=0 ctermbg=6
highlight DiffText   cterm=NONE ctermfg=0 ctermbg=6

" Turn relative line numbers on
set relativenumber

" Set code folding configuration
" set foldmethod=syntax
