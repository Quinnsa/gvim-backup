set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" set encoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,default,latin1

" show line number
set nu

" Enable syntax highlight
syntax enable

set smarttab

" Auto indent
set ai

" Smart indet
set si

" Set to auto read when a file is changed from the outside
set autoread

" Set magic on
set magic

" No sound on errors
set noerrorbells
set novisualbell

" Highlight search things
set hlsearch

" Turn backup off
set nobackup
set nowb
set noswapfile

" autoload _vimrc editor the file autoload it 
autocmd! bufwritepost _vimrc source %

" 设置命令行高度
set cmdheight=1

" tab width
set tabstop=4
set cindent shiftwidth=4
set autoindent shiftwidth=4

" vimwiki
let g:vimwiki_use_mouse=1
let g:vimwiki_list = [{'path': 'E:\MySite\',
      \ 'path_html': 'E:\MySite\html\',
      \ 'template_path': 'E:\MySite\templates\',
      \ 'template_default': 'default',
      \ 'template_ext': '.html',
      \ 'css_name': '',
      \ 'diary_link_count': 5}]
let g:vimwiki_camel_case=0
map <F4> <Plug>Vimwiki2HTML
map <S-F4> <Plug>VimwikiAll2HTML
