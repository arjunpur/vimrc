set relativenumber
set clipboard=unnamed
set splitright
set splitbelow
set nocompatible

map <C-a> :FixWhitespace<cr>
nmap <leader>m :noh<cr>

let g:NERDTreeWinPos = "left"

" Delete actually blackholes the removal
nnoremap d "_d
vnoremap d "_d

"
" Wrap window-move-cursor
"
function! s:GotoNextWindow( direction, count )
  let l:prevWinNr = winnr()
  execute a:count . 'wincmd' a:direction
  return winnr() != l:prevWinNr
endfunction

function! s:JumpWithWrap( direction, opposite )
  if ! s:GotoNextWindow(a:direction, v:count1)
    call s:GotoNextWindow(a:opposite, 999)
  endif
endfunction

nnoremap <silent> <C-w>h :<C-u>call <SID>JumpWithWrap('h', 'l')<CR>
nnoremap <silent> <C-w>j :<C-u>call <SID>JumpWithWrap('j', 'k')<CR>
nnoremap <silent> <C-w>k :<C-u>call <SID>JumpWithWrap('k', 'j')<CR>
nnoremap <silent> <C-w>l :<C-u>call <SID>JumpWithWrap('l', 'h')<CR>
nnoremap <silent> <C-w><Left> :<C-u>call <SID>JumpWithWrap('h', 'l')<CR>
nnoremap <silent> <C-w><Down> :<C-u>call <SID>JumpWithWrap('j', 'k')<CR>
nnoremap <silent> <C-w><Up> :<C-u>call <SID>JumpWithWrap('k', 'j')<CR>
nnoremap <silent> <C-w><Right> :<C-u>call <SID>JumpWithWrap('l', 'h')<CR>

inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>


" http://stackoverflow.com/questions/1551231/highlight-variable-under-cursor-in-vim-like-in-netbeans
:autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

set mouse=a

call plug#begin('~/.vim/bundle')

" Plug 'ervandew/supertab'
Plug 'tpope/vim-sleuth'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " For fugitive
Plug 'fatih/vim-go'
Plug 'davidhalter/jedi-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Quramy/tsuquyomi'
Plug 'yegappan/mru'
Plug 'scrooloose/nerdtree'
Plug 'jlanzarotta/bufexplorer'
Plug 'jason0x43/vim-js-indent'
Plug 'tpope/vim-commentary'
Plug 'mileszs/ack.vim'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
" Plug 'vim-syntastic/syntastic'
" Plug 'flazz/vim-colorschemes'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'

call plug#end()

let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

let g:github_enterprise_urls = ['git@github.plaid.com']

syntax enable
"colorscheme gruvbox
"colorscheme codedark
colorscheme onedark
let g:onedark_termcolors=256



let vim_markdown_preview_browser='Google Chrome'

" highlight Normal ctermfg=white ctermbg=darkblue

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=python3complete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

" Omni complete- Ctrl-a for menu
inoremap <C-a> <C-x><C-o>

" use ctrl-j and ctrl-k to navigate omni complete menu
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Set working directory to current buffer on entry
autocmd BufEnter * lcd %:p:h

" Trim all trailing whitespaces
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

command! TrimWhitespace call TrimWhitespace()
noremap <Leader>q :call TrimWhitespace()<CR>


:inoremap <F5> <C-R>=strftime("%c")<CR>


