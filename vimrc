"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Shortcut for moving between splits
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set splitbelow
set splitright

silent! set winheight=30
silent! set winminheight=5

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <space> /
nnoremap <enter> :nohl<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Leadermaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
nmap <leader>t :nnoremap <lt>leader>r :w \\| :silent! ! & <lt>cr> \\| :redraw!<lt>cr><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
nmap <leader>d :redraw!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Layout Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on

set number
set relativenumber

" Indents
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

autocmd Filetype html setlocal ts=2 sw=2 sts=2
autocmd Filetype ruby setlocal ts=2 sw=2 sts=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Multipurpose tab key
" Indents if at beginning of line, otherwise tab completes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-n>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Statusline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
set statusline=
set statusline+=\ %f
set statusline+=%h%m%r%w
set statusline+=\ [%{strlen(&ft)?&ft:'none'},
set statusline+=\ %{strlen(&fenc)?&fenc:&enc},
set statusline+=\ %{&fileformat}]
set statusline+=\ %F
set statusline+=\ (%l,%c)
set statusline+=%=
set statusline+=%{getcwd()}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamed
set shellcmdflag=-ic
set mouse=a

" Move .swp files
set directory^=$HOME/.vim/tmp//

" Fix common typos
command! WQ wq
command! Wq wq
command! Wqa wqa
command! W w
command! Q q

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup AutoCommands
    au!
" Remove trailing whitespace when saving
autocmd BufWritePre * :%s/\s\+$//e

autocmd bufreadpost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \     exe "normal g`\"" |
  \ endif
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set rtp +=~/.vim/bundle/Vundle.vim/
call vundle#rc()
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tmhedberg/matchit'
Plugin 'terryma/vim-multiple-cursors'
" HTML
Plugin 'rstacruz/sparkup'

