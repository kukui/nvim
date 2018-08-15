set statusline= " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\  " buffer number
set statusline+=%f\      " file name
set statusline+=%h%m%r%w " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%-13.(%l,%c%V%)\ %<%P

set number

call plug#begin('~/.vim/pluginz')
  Plug 'airblade/vim-gitgutter'
  Plug 'tmhedberg/simpylfold'
  Plug 'tpope/vim-sensible'
  Plug 'scrooloose/nerdtree' 
  Plug 'w0rp/ale' " asynchronous linting
  Plug 'davidhalter/jedi' " autocompletion and static analysis 
  Plug 'davidhalter/jedi-vim' " python autocompletion with vim
  Plug 'roxma/vim-tmux-clipboard' " provides tmux/vim copy paste
  Plug 'dag/vim-fish'
call plug#end()

let g:ale_linters = {'fish': ['fish -n'], 'javascript': ['eslint'], 'python': ['pycodestyle', 'flake8']}
let g:ale_completion_enabled = 1

highlight Normal ctermfg=245
highlight Constant ctermfg=160
highlight String ctermfg=160
highlight Comment ctermfg=242
highlight StatusLine cterm=none ctermfg=141 ctermbg=000
highlight StatusLineNC cterm=none ctermfg=242 ctermbg=000
highlight Folded ctermfg=208 ctermbg=000 cterm=none
highlight VertSplit ctermfg=141 ctermbg=000 cterm=none

" filetype indentation
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType fish setlocal shiftwidth=4 tabstop=4 expandtab


set fillchars=stl:.,stlnc:.,vert:.,fold:.,diff:.

