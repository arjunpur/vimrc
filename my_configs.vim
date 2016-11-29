set relativenumber
set clipboard=unnamedplus
set splitright
set splitbelow
set nocompatible


au BufRead,BufNewFile *.xtx setfiletype tex
autocmd FileType sml set tabstop=2|set shiftwidth=2|set expandtab

map <C-a> :FixWhitespace<cr>
nmap <leader>m :noh<cr>


let g:NERDTreeWinPos = "left"


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


filetype off
set rtp+=~/.vim_runtime/sources_non_forked/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'othree/yajs.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'davidhalter/jedi-vim'

call vundle#end()
filetype plugin indent on

let g:livepreview_previewer = 'open -a Preview'
set tags=./tags

syntax on
