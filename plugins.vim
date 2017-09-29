" A minimal configuration of plugins for neovim.
" https://github.com/ef2k/dotfiles

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

" Find and replace
Plug 'brooth/far.vim'

" Auto pairs () [] {}
Plug 'jiangmiao/auto-pairs'

" Colorschemes
Plug 'tomasr/molokai'
Plug 'cocopon/iceberg.vim'
Plug 'ef2k/supralight.vim'

" Markdown previews
Plug 'junegunn/vim-xmark'

" FZF - fuzzy finder mapped to ctrl-p
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :Files<CR>

" Git status
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

" YouCompleteMe
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries'}
let g:go_fmt_command = 'goimports'
let g:go_auto_type_info = 1
" let g:go_metalinter_autosave = 0
" let g:go_metalinter_autosave_enabled = ['vet', 'errcheck']
" :autocmd BufWritePre *.go :GoBuild
nnoremap <Leader>b :GoBuild<CR>
nnoremap <Leader><S-t> :GoTest<CR>
nnoremap <Leader><S-l> :GoLint<CR>

" Tagbar of all source symbols
Plug 'majutsushi/tagbar'
nnoremap <Leader>t :TagbarToggle<CR>

" Comments
Plug 'tpope/vim-commentary'

" Side-bar file menu
Plug 'scrooloose/nerdtree'
" let g:NERDTreeSortOrder = map(range(0, 25), '"\\." . nr2char(char2nr("a") + v:val) . "[^.]*$"')
nnoremap <Leader>\ :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" End plugins
call plug#end()

colorscheme iceberg
