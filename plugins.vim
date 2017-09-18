" A minimal configuration of plugins for neovim.
" https://github.com/ef2k/dotfiles

" Powered by vim-plug
if has('nvim')
  call plug#begin('~/.local/share/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

" Colorschemes
Plug 'tomasr/molokai'
Plug 'cocopon/iceberg.vim'

" Markdown previews
Plug 'junegunn/vim-xmark'

" FZF - fuzzy finder mapped to ctrl-p
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
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
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['errcheck', 'vet', 'golint']
nnoremap <Leader>b :GoBuild<CR>

" Tagbar of all source symbols
Plug 'majutsushi/tagbar'
nnoremap <Leader>t :TagbarToggle<CR>

" Comments
Plug 'tpope/vim-commentary'

" Side-bar file menu
Plug 'scrooloose/nerdtree'
nnoremap <Leader>\ :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" End plugins
call plug#end()
