" install Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhartington/oceanic-next'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
call plug#end()

" enable true colors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

syntax on
filetype plugin on

" colors
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext
let g:airline_theme='oceanicnext'

" options
set textwidth=80
set colorcolumn=+1
set expandtab
set shiftwidth=2 | set tabstop=2
set shiftround
set number relativenumber
set splitbelow splitright

set foldmethod=indent
set foldnestmax=3
set nofoldenable

set list listchars=tab:»·,precedes:-,trail:·,nbsp:+
set tags=./tags;,tags

set incsearch
set hlsearch
set ignorecase
set smartcase

set mouse=a
set showcmd
set belloff=all
set noswapfile
set lazyredraw

set wildignorecase
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class,*DS_Store* " general
set wildignore+=*bower_components/**,*node_modules/**,*build/**,*dist/** " JS
set wildignore+=*deps/**,*_build/** " elixir

" key mappings
let mapleader = " "

" normal mode

" use - and | for horizontal or vertical splits
nnoremap \| :vsplit<CR>
nnoremap - :split<CR>

" use arrow keys for split resizing
nnoremap <silent> <DOWN> :resize -2 <CR>
nnoremap <silent> <UP> :resize +2 <CR>
nnoremap <silent> <RIGHT> :vertical resize +5 <CR>
nnoremap <silent> <LEFT>  :vertical resize -5 <CR>

" move up and down a wrapped line
nnoremap j gj
nnoremap k gk

" open fzf fuzzy file finder
nnoremap <C-p> :Files<CR>

" quick fuzzy-ish edit
nnoremap <leader>e :edit **/

" start rgrep find command
nnoremap <leader>g :Rg<SPACE>

" rgrep on current word
nnoremap <leader>G :execute 'Rg ' expand('<cword>')<CR>

" go to last buffer
nnoremap <leader>lb :b#<CR>

" disable highlights after search
nnoremap <leader>q :nohlsearch<CR>

" repeat last commnad
nnoremap <leader>lc @:

" quit all splits
nnoremap <leader>qa :qa<CR>

" qq to record, Q to replay
nnoremap Q @q

" open vimrc file to edit it
nnoremap <leader>ev :vsplit $MYVIMRC<CR>

" reload vimrc file
nnoremap <leader>sv :source $MYVIMRC<CR>

" insert mode

" delete line when CTRL+d and enter insert mode at end of prev line
inoremap <C-d> <ESC>ddA

" disable arrow keys in insert mode
inoremap <UP> <NOP>
inoremap <DOWN> <NOP>
inoremap <LEFT> <NOP>
inoremap <RIGHT> <NOP>

" FileType specific
augroup filetype_python
  autocmd!
  autocmd FileType python setlocal textwidth=88
augroup END

augroup filetype_markdown
  autocmd!
  autocmd FileType markdown setlocal textwidth=120
  autocmd FileType markdown setlocal spell spelllang=en_us complete+=kspell
augroup END

augroup filetype_elixir
  autocmd!
  autocmd FileType elixir,eelixir setlocal textwidth=98
augroup END
