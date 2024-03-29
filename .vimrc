:set spell
" note that here is based on: https://realpython.com/vim-and-python-a-match-made-in-heaven/

set nu

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

Plugin 'tmhedberg/SimpylFold'
"if you want to see the docstrings for folded code:
let g:SimpylFold_docstring_preview=1

"proper PEP 8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

"other stuff as well..
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" autoindent
Plugin 'vim-scripts/indentpython.vim'


" utf 8 support
set encoding=utf-8

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF


" Syntax Checking/Highlighting
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
" make sure flake 8 is installed: https://github.com/nvie/vim-flake8
let python_highlight_all=1
syntax on

" Color Schemes
"Plugin 'jnurmine/Zenburn'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'arcticicestudio/nord-vim' "  set background=dark
"  colorscheme solarized

"colorscheme zenburn


"  To make switching between them
"call togglebg#map("<F5>")

" file browsing
Plugin 'scrooloose/nerdtree'

" use tabs
Plugin 'jistr/vim-nerdtree-tabs'

" hide .pyc files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" search
Plugin 'kien/ctrlp.vim'

" git command
Plugin 'tpope/vim-fugitive'

" clipboard 
set clipboard=unnamed





" BELOW USE VIMPLUG https://github.com/junegunn/vim-plug
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

Plug 'lifepillar/vim-mucomplete'

" also this is for latex; see https://github.com/gillescastel/latex-snippets
Plug 'sirver/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
let g:UltiSnipsSnippetDirectories = ['/Users/kueihsienchu/.vim/plugged/ultisnips']
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
" let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" nice tex-conceal math symbols
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'} "
" vimtex
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
"let g:vimtex_view_method='zathura'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

setlocal spell
set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u


" List ends here. Plugins become visible to Vim after this call.
call plug#end()
colorscheme nord
" correct syntax coloring for latex
hi Conceal guibg=#2E3440 guifg=white

set completeopt+=menuone
set completeopt+=noselect
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion


autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

" spelling auto correct
setlocal spell
set spelllang=en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
inoremap <key> <C-o>de
