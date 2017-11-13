call plug#begin('~/.vim/plugged')

" Text processors
Plug 'ntpeters/vim-better-whitespace'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'

" UI Modules
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'rking/ag.vim'

" UI Enhancements
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'powerline/powerline'

" Lang: HTML
Plug 'mattn/emmet-vim'

" Vim
set autoindent
set backspace=indent,eol,start
set colorcolumn=80
set expandtab
set number
set shiftwidth=4
set smarttab
set softtabstop=4
set tabstop=4
filetype plugin indent on

" Solarized
syntax enable
set background=dark
colorscheme solarized

" NerdTree
autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore = ['\.pyc$']
map <C-n> :NERDTreeToggle<CR>
autocmd BufNew * wincmd l

" Syntastic
let g:syntastic_javascript_checkers=['eslint']
" let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_python_checkers=['flake8']
let g:syntastic_scss_checkers=['scss_lint']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Powerline
set rtp+=~/.vim/plugged/powerline/powerline/bindings/vim

" Ctrl-P
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" The Silver Searcher (ag)
"
nnoremap K :Ag! "\b<cword>\b"<CR>:cw<CR>

" YCM
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Add plugins to &runtimepath
call plug#end()

" Fix clipboard
set clipboard=unnamed
