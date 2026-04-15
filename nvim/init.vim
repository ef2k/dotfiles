" A minimal configuration of neovim.
" https://github.com/ef2k/dotfiles

" Change the map leader
let mapleader = "\,"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" +- Set python providers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
let g:python_host_prog ='/usr/local/opt/pyenv/versions/2.7.11/bin/python'
let g:python3_host_prog = '/usr/local/opt/pyenv/versions/3.4.4/bin/python'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" +- Load Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
if filereadable(expand("~/.config/nvim/plugins.vim"))
  source ~/.config/nvim/plugins.vim
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" +- Basics
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
set termguicolors

set linespace=4        " Line height, expects integers
set nocursorline       " Highlight current line
set nojoinspaces       " Use one space after punctuation.
set colorcolumn=80     " Highlight the ruler
set textwidth=0        " Don't textwrap
set number             " Show line numbers
set numberwidth=3      " Width of number gutter
set nowrap             " Don't wrap lines
set diffopt+=vertical  " Always use vertical diffs
set backspace=2        " Backspace deletes like most programs in insert mode
set ruler              " Show the cursor position all the time
set showcmd            " Display incomplete commands
set incsearch          " Do incremental searching
set laststatus=2       " Always display the status line
set autowrite          " Automatically :write before running commands
set nocursorcolumn     " Speed up syntax highlighting
set nobackup  	       " No backups
set nowritebackup      " No backups
set noswapfile         " No swapfile backup
set history=50         " Shorten history entries
set nolist
set ttimeout
set ttimeoutlen=100

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" +- UX
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Always open the quickfix window across the bottom
au FileType qf wincmd J
"
" Enable relative line numbers
set relativenumber

" Only show completion as a list instead of a sub-window
set completeopt-=preview

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
"
" Hide scrollbars
set guioptions-=L
set guioptions-=T
set guioptions-=r
"
" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
"
" Code folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" +- Key Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unset the last search pattern, clears the highlight after hitting return
nnoremap <CR> :noh<CR><CR>
"
" Switch between the last two files
nnoremap <leader><leader> <c-^>
"
" Faster save
nnoremap <Leader>w :w<CR>
"
" Faster quit
nnoremap <Leader>q :q<CR>
"
" Map the ; to :, saves the shift + ; to get :
nnoremap ; :
nnoremap : ;
"
" Quicker window movements
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" +- Language specific
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When editings HBS files always use the handlebars syntax
au BufRead,BufNewFile *.hbs set filetype=handlebars
"
" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'
"
" Display extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
