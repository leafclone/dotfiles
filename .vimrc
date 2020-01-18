set statusline=%f\ \ :\ %{getcwd()}%=Col:\%4c\ Row:\%4l\/\%4L

" swap file directory
" in linux, setting // will change the path separator to %
set directory=$HOME/.vim/swapfiles

set number
set ignorecase
set laststatus=2
set clipboard=unnamedplus

" somehow I need these options after switching to vim with xtermclipboard
syntax on
set hlsearch
set backspace=2 " make backspace work like most other programs
set backspace=indent,eol,start

nnoremap <F3> :tabn<CR>
nnoremap <F2> :tabp<CR>
"set mouse=a
" tells vim to search for files in the current directory . or all subdirectories
set path=.,**

nnoremap gd "tyiwh/<C-R>t<CR>
nnoremap gD "tyiw/<C-R>/\\|<C-R>t<CR>

" surround selection with quotes
vnoremap g' <Esc>`>a'<Esc>`<i'<Esc>
vnoremap g" <Esc>`>a"<Esc>`<i"<Esc>
vnoremap g[ <Esc>`>a]<Esc>`<i[<Esc>
vnoremap g( <Esc>`>a)<Esc>`<i(<Esc>
vnoremap g{ <Esc>`>a}<Esc>`<i{<Esc>
vnoremap g< <Esc>`>a><Esc>`<i<<Esc>

" move to the next/previous line with same indentation
nnoremap gk :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>
nnoremap gj :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>

" select and tab to indent
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" automatically wrap left and right
set whichwrap+=h,l,<,>,[,]

" cursorline in insert mode
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

" Change directory to the current buffer when opening files
set autochdir
set autoindent
set nosmartindent
set expandtab tabstop=2 shiftwidth=2 smarttab softtabstop=2

" stop vim from removing indentation on empty lines
inoremap <CR> <CR>x<BS>
nnoremap o ox<BS>
nnoremap O Ox<BS>

" disable shift down and shift up so it stops jumping around
map <C-a> <Nop>
map <S-Up> <Nop>
map <S-Down> <Nop>
vmap <S-Down> j
vmap <S-Up> k

" tab autocompletion
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
"https://stackoverflow.com/questions/2169645/vims-autocomplete-is-excruciatingly-slow
set complete=.,w,b,u

set guitablabel=%t

set ssop-=options " do not store global and local values in a session
set ssop-=folds   " do not store folds

" place to look for tags
set tags=./tags,~/.vim/tags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <C-]> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

behave xterm " as opposed to behave mswin

"let g:plug_url_format = 'git@stash:/%s'
"call plug#begin('~/.vim/plugged')
"Plug 'vimplugins/ctrlp.vim'
"Plug 'vimplugins/vim-airline'
"Plug 'vimplugins/vim-airline-themes'
"call plug#end()

colorscheme desert
set t_Co=128
" AIRLINE SETTINGS
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline_theme = 'base16_ashes'
"let g:airline_detect_whitespace = 0
"let g:airline#extensions#whitespace#enabled = 0
"dont show filename in tabline
"let g:airline#extensions#tabline#show_splits = 0
" END AIRLINE SETTINGS

function StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction

nnoremap <silent> <F5> :call StripTrailingWhitespace()<CR>

" add period to be word boundary keyword
set iskeyword-=.

