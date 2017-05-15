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

"""""""""""""""""""""""""""""""""""""""
"""     Vim-plug configuration     """"
"""""""""""""""""""""""""""""""""""""""

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

" Toogle syntastic with F4
map <F4> :SyntasticToggleMode<CR>

" Run syntastic check
map <leader>c :SyntasticCheck<CR>

"""""""""""""""""""""""""""""""""""""""
""" Syntastic plugin configuration """"
"""""""""""""""""""""""""""""""""""""""

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Allow to display the location list
let g:syntastic_always_populate_loc_list = 1
" Automaticaly open and close the location list on error
let g:syntastic_auto_loc_list = 1
" Runs the checker on open but not on :wq
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Make the cursor jump to the next error, but not warning
let g:syntastic_auto_jump = 2

"""""""""""""""""""""""""""""""""""""""
"""   Airline plugin configuration """"
"""""""""""""""""""""""""""""""""""""""

" Allow powerline display
let g:airline_powerline_fonts = 1
" Enable airline even with a single tab open
set laststatus=2
" Display buffers
let g:airline#extensions#tabline#enabled = 1
