" TODO: switch to neovim(?)
"""""""""""""""""""""""""""""""""""""""
"""     General configuration       """
"""""""""""""""""""""""""""""""""""""""

" Enable plugins
filetype plugin on
filetype plugin indent on

" Enable builtin matchit plugin
runtime macros/matchit.vim

" set culomns numbers on
set number
" enable syntax highlighting
syntax enable
" enable highlighting on search
set hlsearch

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" Prevents line breaking
set nowrap

" highlight unwanted(trailing) whitespace
" + have this highlighting not appear whilst you are typing in insert mode
" + have the highlighting of whitespace apply when you open new buffers
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=237 guibg=darkgray
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=237 guibg=darkgray
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

" allow writing with sudo rights
cmap w!! w !sudo tee %

"""""""""""""""""""""""""""""""""""""""
"""     Vim-plug configuration     """"
"""""""""""""""""""""""""""""""""""""""

" TODO: add syntastic to plugins
call plug#begin('~/.vim/plugged')

" Async REPL for python
Plug 'metakirby5/codi.vim'
" Airline plugin, makes lower bar fancier
Plug 'vim-airline/vim-airline'
" Git differences on file
Plug 'airblade/vim-gitgutter'
" Git plugin
Plug 'tpope/vim-fugitive'
" Search and replace
Plug 'brooth/far.vim'
" NerdTree
Plug 'scrooloose/nerdtree'

call plug#end()

"""""""""""""""""""""""""""""""""""""""
"""              Keys               """
"""""""""""""""""""""""""""""""""""""""

" Set the paste button
set pastetoggle=<F2>
" Detect the filetype, therefore refreshing the syntax hightlight
nnoremap <F5> :filetype detect<CR>
" Get rid of that stupid windows
map q: :q
" Hide highlight on search with <leader><space>
nnoremap <leader><space> :nohlsearch<CR>
" Insert a tab rather than spaces
inoremap <S-Tab> <C-V><Tab>
" Make Y yank to end of line (as suggested by Vim help)
noremap Y y$
" Add a new tab
map <Leader>t :tabnew<CR>

"""""""""""""""""""""""""""""""""""""""
""" Syntastic plugin configuration """"
"""""""""""""""""""""""""""""""""""""""

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" Allow to display the location list
let g:syntastic_always_populate_loc_list = 1
" Automaticaly open and close the location list on error
let g:syntastic_auto_loc_list = 1
" Runs the checker on open but not on :wq
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" Make the cursor jump to the next error, but not warning
let g:syntastic_auto_jump = 2

" Toogle syntastic with F4
map <F4> :SyntasticToggleMode<CR>
" Run syntastic check
map <leader>c :SyntasticCheck<CR>

"""""""""""""""""""""""""""""""""""""""
"""   Airline plugin configuration """"
"""""""""""""""""""""""""""""""""""""""

" Allow powerline display
let g:airline_powerline_fonts = 1
" Enable airline even with a single tab open
set laststatus=2
" Display buffers
let g:airline#extensions#tabline#enabled = 1

"""""""""""""""""""""""""""""""""""""""
"""  NERDTree plugin configuration """"
"""""""""""""""""""""""""""""""""""""""

" Open NERDTree at startup if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open NERDTree at startup if a directory is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
