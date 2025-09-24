set nocompatible
syntax on
set showmode
set showcmd
set mouse=a
set encoding=utf-8
set t_Co=256
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set number
set relativenumber
set cursorline
set cursorcolumn
set laststatus=2
set ruler
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase
set spell spelllang=en_us
set undofile
set noerrorbells
set visualbell
set history=1000
set autoread
set listchars=tab:»■,trail:■
set list
set scrolloff=5
set splitright
set splitbelow
set confirm
set wildmenu
set wildmode=longest:list,full

nnoremap <f5> :!ctags -R --fields=+iaS --extra=+q *<CR>
nnoremap <f2> :NERDTreeToggle<CR>
nnoremap <f3> :Tagbar<CR>

filetype off

set rtp+=~/dotfiles/bundle/vundle
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'davidhalter/jedi-vim'

Plugin 'jiangmiao/auto-pairs'

Plugin 'bling/vim-bufferline'

Plugin 'nanotech/jellybeans.vim'

Plugin 'preservim/nerdtree'

Plugin 'preservim/tagbar'

Plugin 'nathanaelkane/vim-indent-guides'

call vundle#end()

filetype plugin indent on

colorscheme jellybeans

let g:NERDTreeFileLines = 1

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

autocmd VimEnter * Tagbar

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=#dadada
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=#dadada
let g:indent_guides_guide_size=1
