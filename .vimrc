set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

 Plugin 'tpope/vim-fugitive'
 Plugin 'godlygeek/tabular'
 Plugin 'jtratner/vim-flavored-markdown'
" Plugin 'plasticboy/vim-markdown'
 Plugin 'editorconfig/editorconfig-vim'
" Plugin 'bling/vim-airline'
 Plugin 'airblade/vim-gitgutter'
" Plugin 'scrooloose/syntastic'

call vundle#end()            " required
filetype plugin indent on     " required!

syntax enable
colorscheme monokai

set nofoldenable    " disable folding
let g:vim_markdown_folding_disabled=1

autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.txt set filetype=markdown
autocmd BufRead,BufNewFile *.module set filetype=php
autocmd BufRead,BufNewFile *.install set filetype=php
autocmd BufRead,BufNewFile *.test set filetype=php
autocmd BufRead,BufNewFile *.inc set filetype=php
autocmd BufRead,BufNewFile *.profile set filetype=php
autocmd BufRead,BufNewFile *.view set filetype=php
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd BufRead,BufNewFile *.js set ft=javascript syntax=javascript
autocmd BufRead,BufNewFile *.json set ft=json syntax=javascript
autocmd BufRead,BufNewFile *.twig set ft=htmldjango
autocmd BufRead,BufNewFile *.rabl set ft=ruby
autocmd BufRead,BufNewFile *.jade set ft=jade

set noerrorbells
set noswapfile
set nobackup
nnoremap ; :

" Always show statusline
set laststatus=2

augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" https://github.com/AntJanus/dotfiles/blob/master/.vimrc
