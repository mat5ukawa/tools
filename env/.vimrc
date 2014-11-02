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
autocmd Filetype coffee :set noet


"*******************************************************************


if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundle 'vim-scripts/Align'
"NeoBundle 'Shougo/neocomplete'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise'

filetype plugin indent on
NeoBundleCheck


"*******************************************************************


autocmd QuickFixCmdPost *grep* cwindow


"*******************************************************************


set encoding=utf-8
set fenc=utf-8
set fileencodings=utf-8
set termencoding=utf-8
set fileformat=unix


"*******************************************************************


set hlsearch
set incsearch
set showmode


"*******************************************************************


set autoindent
set smartindent
set smarttab
autocmd FileType c,cpp,perl,rb :set cindent


"*******************************************************************


" general
ab ii ++i
ab jj ++j
ab kk ++k
ab pub public
ab priv private
ab prot protected

" C/C++
autocmd FileType c,cpp ab /.. /*
autocmd FileType c,cpp ab ../ */

" rb
ab codu -*- coding: utf-8 -*-
ab ewi each_with_index do \|
ab ea each do \|
ab cont controller 
ab ac action

" rails
ab pe <%= %>
ab pc <% %>

" markdown
:ab pre <pre>
:ab ep </pre>
:ab bb <b>
:ab eb </b>
:ab uu <u>
:ab eu </u>



"*******************************************************************


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
