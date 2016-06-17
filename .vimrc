set nocompatible              " be iMproved, required
filetype off                  " required

let mapleader=","

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
 Plugin 'scrooloose/nerdtree'
 Plugin 'guns/xterm-color-table.vim'

call vundle#end()            " required
filetype plugin indent on     " required!

" don't forgrt to run :PluginInstall


syntax enable
colorscheme monokai
hi Search term=standout ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow
" hi clear SpellBad
hi SpellBad guibg=NONE gui=underline guisp=#870000 ctermbg=088 term=underline
" hi SpellCap guibg=NONE gui=underline guisp=#00005f ctermbg=017 term=underline
hi clear SpellCap
hi clear SpellRare
hi clear SpellLocal

" Highlight extra whitespace
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" set nofoldenable    " disable folding
" let g:vim_markdown_folding_disabled=1
" let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" autocmd BufRead,BufNewFile *.md set filetype=markdown
" autocmd BufRead,BufNewFile *.txt set filetype=markdown
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd BufRead,BufNewFile *.js set ft=javascript syntax=javascript
autocmd BufRead,BufNewFile *.json set ft=json syntax=javascript


autocmd FileType gitcommit,ghmarkdown,markdown,text setlocal spell
set complete+=kspell


set noerrorbells
set noswapfile
set nobackup
" nnoremap ; :

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
set incsearch

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

" START PLUGIN CUSTOMIZATIONS

let NERDTreeShowHidden=1

" END PLUGIN CUSTOMIZATIONS

" START MAPPINGS

nnoremap ; :
noremap ;; ;

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

" TAB for autocomplete
imap <leader><Tab> <C-P>

" tab shortcuts
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>

nnoremap th :tabnext<CR>
nnoremap tl :tabprev<CR>
nnoremap tn :tabnew<CR>
nnoremap tt :tabedit<Space>
nnoremap tm :tabm<Space>
nnoremap tq :tabclose<CR>


if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    " play nice with OSX paste
    nnoremap <C-p> :r !pbpaste<CR>
    inoremap <C-p> <Esc>:r !pbpaste<CR>
  endif
endif

map <leader>md :call MarkdownActions(1)<CR>
map <leader>mdh :call MarkdownActions(1)<CR>
map <leader>mdr :call MarkdownActions(2)<CR>
map <leader>mdp :call MarkdownActions(3)<CR>
map <leader>mdc :call MarkdownActions(4)<CR>

map <leader>nt :NERDTree<CR>

" END MAPPINGS


" START FUNCTIONS

function MarkdownActions(action)
  if (&ft=='ghmarkdown' || &ft=='markdown')
    if a:action == 1
      :! mdhtml %:t
      ":! echo %:t
    elseif a:action == 2
      :! mdrtf %:t
    elseif a:action == 3
      :! mdpdf %:t
    elseif a:action == 4
      " pandoc test.mdown -f markdown_github -t html5 -c  ~/Dotfiles/misc/ghmd.css -s | pandoc -f html -s -t rtf | pbcopy
      ":! pandoc test.mdown -f markdown_github -t html5 -c  ~/Dotfiles/misc/ghmd.css -s | pandoc -f html -s -t rtf | pbcopy
      :! mdcp %:t
    else
      return
    endif
  endif
  return
endfunction

" END FUNCTIONS

" Always show statusline
set laststatus=2

" type w!! to sudo-edit a file if you forgot to do it when you opened
cmap w!! w !sudo tee % >/dev/null

augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown,*.mdown setlocal filetype=ghmarkdown
augroup END

" https://github.com/AntJanus/dotfiles/blob/master/.vimrc
" http://chibicode.com/vimrc/

