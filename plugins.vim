" A minimal configuration of plugins for neovim.
" https://github.com/ef2k/dotfiles

" Powered by vim-plug

call plug#begin('~/.local/share/nvim/plugged')

" Monokai as colorscheme
Plug 'tomasr/molokai'

" Markdown previews
Plug 'junegunn/vim-xmark'

" FZF - fuzzy finder mapped to ctrl-p
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :Files<CR>

" Deocomplete - Autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

" Go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries'}
Plug 'zchee/deoplete-go', { 'do': 'make' }

" Tags use F5 to open it
Plug 'majutsushi/tagbar'
nnoremap <F5> :TagbarToggle<CR>

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
