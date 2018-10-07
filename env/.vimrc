set title
set laststatus=2
set nobackup
set number
set tabstop=2
set shiftwidth=2
set backspace=indent,eol,start
set nocp
set expandtab
filetype plugin on

set encoding=utf-8
set fenc=utf-8
set fileencodings=utf-8
set termencoding=utf-8
set fileformat=unix

"*******************************************************************

set hlsearch
set incsearch
set showmode

" indent *******************************************************************

set autoindent
set smartindent
set smarttab
autocmd FileType c,cpp,perl,rb :set cindent

" alias *******************************************************************
ab pub public
ab priv private
ab prot protected

" colors *******************************************************************
set background=dark
syntax on
hi LineNr ctermfg=cyan

hi Comment ctermfg=yellow
hi Constant ctermfg=red
hi String ctermfg=red
hi Character ctermfg=red
hi Number ctermfg=yellow
hi Boolean ctermfg=green
hi Float ctermfg=green

hi Identifier ctermfg=green
hi Function ctermfg=green

hi Statement ctermfg=green
hi Conditional ctermfg=green
hi Repeat ctermfg=green
hi Label ctermfg=green
hi Operator ctermfg=yellow
hi Keyword ctermfg=green
hi Exception ctermfg=green

hi Preproc ctermfg=green
hi Include ctermfg=green
hi Define ctermfg=green
hi Macro ctermfg=green
hi PreCondit ctermfg=green

hi Type ctermfg=green
hi StorageClass ctermfg=green
hi Structure ctermfg=green
hi Typedef ctermfg=green
"*******************************************************************
