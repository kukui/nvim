" filetype indentation
function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

set statusline= " clear the statusline for when vimrc is reloaded
set statusline=%{LinterStatus()}

set statusline+=%-3.3n\  " buffer number
set statusline+=%t\      " file name
set statusline+=%h%m%r%w " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{SyntaxItem()},
set statusline+=%-13.(%l,%c%V%)\ %<%P

set number

call plug#begin('~/.config/nvim/pluginz')
  Plug 'https://github.com/mhinz/vim-signify.git'                               " git
  Plug 'https://github.com/tmhedberg/simpylfold.git'                            " code folding
  Plug 'https://github.com/tpope/vim-sensible.git'                              " a collection of defaults
  Plug 'https://github.com/christoomey/vim-tmux-navigator.git'                  " seamless navigation between tmux panes and vim
  Plug 'https://github.com/scrooloose/nerdtree.git'                             " file navigation tree
  Plug 'https://github.com/w0rp/ale.git'                                        " asynchronous linting
  Plug 'https://github.com/davidhalter/jedi.git'                                " autocompletion and static analysis 
  Plug 'https://github.com/davidhalter/jedi-vim.git'                            " python autocompletion with vim
  Plug 'https://github.com/roxma/vim-tmux-clipboard.git'                        " provides tmux/vim copy paste
  Plug 'https://github.com/dag/vim-fish.git'                                    " fish filetype goodness
  Plug 'https://github.com/vim-python/python-syntax.git'
call plug#end()

set background=dark
colorscheme kaidark

let g:ale_linters = {'fish': ['fish -n'], 'javascript': ['eslint'], 'python': ['flake8','pycodestyle']}
let g:ale_fixers = {'python': ['remove_trailing_lines', 'trim_whitespace', 'autopep8']}
let g:ale_set_highlights = 0
let g:ale_completion_enabled = 1

let g:python_highlight_all = 1
let g:python_slow_sync = 0
filetype plugin on
autocmd FileType html setlocal shiftwidth=2 tabstop=2
" autocmd FileType python setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType fish setlocal shiftwidth=4 tabstop=4 expandtab


set fillchars=stl:.,stlnc:.,vert:.,fold:.,diff:.
