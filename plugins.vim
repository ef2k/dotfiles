" A minimal configuration of plugins for neovim.
" https://github.com/ef2k/dotfiles

" Powered by vim-plug

call plug#begin('~/.local/share/nvim/plugged')

" Monokai as colorscheme
Plug 'tomasr/molokai'

" Markdown previews
Plug 'junegunn/vim-xmark'

" Side-bar file menu
Plug 'scrooloose/nerdtree'
nnoremap <Leader>\ :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Comments


" End plugins
call plug#end()
