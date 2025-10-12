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

Plugin 'dominikduda/vim_current_word'

Plugin 'vim-syntastic/syntastic'

call vundle#end()

filetype plugin indent on

colorscheme jellybeans

let g:NERDTreeFileLines = 1

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

autocmd VimEnter * VimCurrentWordToggle

let g:indent_guides_enable_on_vim_startup = 1

" Highlight the word under the cursor
let g:vim_current_word#highlight_current_word = 1
let g:vim_current_word#highlight_delay = 0

" Syntax Check
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '➤'
let g:syntastic_style_warning_symbol = '➤'
let g:syntastic_stl_format = 0
highlight link SyntasticErrorSign Error
highlight link SyntasticWarningSign Todo
