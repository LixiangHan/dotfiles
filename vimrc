set number
syntax on
set encoding=utf-8
filetype indent on
set autoindent
set tabstop=4
set shiftwidth=4
set cursorline
set textwidth=80
set wrap
set linebreak
set wrapmargin=2
set ruler
set showmatch
set hlsearch
set incsearch
set smartcase
set noerrorbells
set visualbell
set autoread
set autowrite
set rtp+=~/dotfiles/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'The-NERD-tree'     
Bundle 'AutoClose'            
Bundle 'prabirshrestha/vim-lsp'
Bundle 'mattn/vim-lsp-settings'
Bundle 'prabirshrestha/asyncomplete.vim'
Bundle 'prabirshrestha/asyncomplete-lsp.vim'

map <F2> :NERDTreeToggle<CR>
map <F3> :LspInstallServer<CR>

let g:lsp_diagnostics_echo_cursor = 1 
let g:lsp_diagnostics_float_cursor = 1 
let g:lsp_diagnostics_signs_enabled = 1 
let g:lsp_diagnostics_signs_error = {'text': '✗'}
let g:lsp_diagnostics_signs_warning = {'text': '⚠'}
let g:lsp_diagnostics_signs_information = {'text': 'i'}
let g:lsp_diagnostics_signs_hint = {'text': '?'}

let g:lsp_auto_enable = 1

if executable('pylsp')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'allowlist': ['python'],
        \ })
endif

if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'allowlist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

filetype plugin on
set completeopt=menuone,noinsert,noselect

function! s:on_lsp_buffer_enabled() abort
    " 设置补全函数
    setlocal omnifunc=lsp#complete

    " 导航映射
    nmap <buffer> gd <plug>(lsp-definition) " 跳转到定义
    nmap <buffer> gr <plug>(lsp-references) " 查找引用
    nmap <buffer> gi <plug>(lsp-implementation) " 跳转到实现
    nmap <buffer> gt <plug>(lsp-type-definition) " 跳转到类型定义
    nmap <buffer> <leader>rn <plug>(lsp-rename) " 重命名符号
    nmap <buffer> [g <plug>(lsp-previous-diagnostic) " 上一个错误
    nmap <buffer> ]g <plug>(lsp-next-diagnostic) " 下一个错误
    nmap <buffer> K <plug>(lsp-hover) " 悬停查看文档

    " 命令映射
    command! -buffer LspCodeAction call lsp#ui#vim#code_action()
    command! -buffer LspDocumentDiagnostics call lsp#ui#vim#document_diagnostics()
    command! -buffer LspWorkspaceDiagnostics call lsp#ui#vim#workspace_diagnostics()
    command! -buffer LspDocumentFormat call lsp#ui#vim#document_format() " 格式化文档
endfunction

augroup vim_lsp_autocompletion
    autocmd!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


