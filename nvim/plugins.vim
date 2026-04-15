" A minimal configuration of plugins for neovim.
" https://github.com/ef2k/dotfiles
"
" Install vim-plug:
"
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" Powered by vim-plug
if has('nvim')
  call plug#begin('~/.local/share/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

" Distraction free writing
Plug 'junegunn/goyo.vim'
nnoremap <Leader><S-d> :Goyo<CR>

function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  set wrap
  set linebreak
  nnoremap j gj
  nnoremap k gk
  vnoremap j gj
  vnoremap j gk
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  set nowrap
  set nolinebreak
  nunmap j
  nunmap k
  vunmap j
  vunmap k
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Airline
Plug 'vim-airline/vim-airline'

" Find and replace
Plug 'brooth/far.vim'

" Auto pairs () [] {}
Plug 'jiangmiao/auto-pairs'

" Colorschemes
Plug 'tomasr/molokai'
Plug 'rakr/vim-one'
Plug 'cocopon/iceberg.vim'

" Dash integration
Plug 'rizzatti/dash.vim'

" Markdown previews
Plug 'junegunn/vim-xmark'

" FZF - fuzzy finder mapped to ctrl-P
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let $FZF_DEFAULT_COMMAND = 'ag -g "" --ignore "vendor/*"'
'
nnoremap <C-p> :Files<CR>

" Git status
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Deocomplete with Go support
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-go', { 'do': 'make'}
" neocomplete like
set completeopt+=noinsert
" deoplete.nvim recommend
set completeopt+=noselect

" Run deoplete.nvim automatically
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" Vue
Plug 'posva/vim-vue'
let g:vue_disable_pre_processors=1

" Go
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries'}
let g:go_fmt_command = 'goimports'
" let g:go_auto_type_info = 1
" let g:go_metalinter_autosave = 0
" let g:go_metalinter_autosave_enabled = ['vet', 'errcheck']
" :autocmd BufWritePre *.go :GoBuild
nnoremap <Leader>b :GoBuild<CR>
nnoremap <Leader>t :GoTest<CR>
nnoremap <Leader>l :GoLint<CR>

" JS
Plug 'pangloss/vim-javascript'

" HTML
Plug 'mattn/emmet-vim'

" Handlebars
Plug 'joukevandermaas/vim-ember-hbs'

" Tagbar of all source symbols
Plug 'majutsushi/tagbar'

" Comments
Plug 'tpope/vim-commentary'

" Surround
Plug 'tpope/vim-surround'

" Preview subs before doing them
Plug 'osyo-manga/vim-over'
nnoremap <leader>s :OverCommandLine<CR> %s/<C-r><C-w>/

" Side-bar file menu
Plug 'scrooloose/nerdtree'
nnoremap <Leader>\ :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" End plugins
call plug#end()

" colorscheme molokai
colorscheme iceberg
" let g:one_allow_italics = 1
" set background=dark
" colorscheme one
" highlight ColorColumn ctermbg=7 guibg=#2F2F2F
