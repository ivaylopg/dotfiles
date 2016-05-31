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
 Plugin 'wakatime/vim-wakatime'

call vundle#end()            " required
filetype plugin indent on     " required!

syntax enable
colorscheme monokai
hi Search term=standout ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow

" set nofoldenable    " disable folding
" let g:vim_markdown_folding_disabled=1
" let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" autocmd BufRead,BufNewFile *.md set filetype=markdown
" autocmd BufRead,BufNewFile *.txt set filetype=markdown
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd BufRead,BufNewFile *.js set ft=javascript syntax=javascript
autocmd BufRead,BufNewFile *.json set ft=json syntax=javascript

set noerrorbells
set noswapfile
set nobackup
" nnoremap ; :

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Display line numbers on the left
" set number

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" remap for escape
inoremap kk <ESC>
vnoremap kk <ESC>

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohlsearch<CR><C-L>

" Always show statusline
set laststatus=2

augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown,*.mdown setlocal filetype=ghmarkdown
augroup END

" https://github.com/AntJanus/dotfiles/blob/master/.vimrc
" http://chibicode.com/vimrc/
