let mapleader = " "

set t_Co=256
set laststatus=2 
set noshowmode
set encoding=UTF-8
set mouse=a
set nu
set wildmode=longest,list

" Tabs as 2 spaces
set ai
set tabstop=2
set shiftwidth=2
set expandtab

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

call plug#begin('~/.vim/plugged')
  " Plug 'preservim/nerdtree'
  " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'preservim/nerdcommenter'
  Plug 'ryanoasis/vim-devicons'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'tomasiser/vim-code-dark'
  Plug 'sheerun/vim-polyglot'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'epilande/vim-es2015-snippets'
  Plug 'epilande/vim-react-snippets'
  Plug 'iamcco/coc-tailwindcss'
  "Plug 'SirVer/ultisnips'
  Plug 'rust-lang/rust.vim'
  "Plug 'jiangmiao/auto-pairs'
  Plug 'itchyny/lightline.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-vinegar'
  Plug 'kshenoy/vim-signature'
call plug#end()

" Keybinds
nnoremap <C-F> :GFiles<CR>
nnoremap <C-f> :Files<CR>
nnoremap <C-g> :Ag<CR>
nnoremap <silent><leader>l :Buffers<CR>
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <C-A> :Ga<CR>
nnoremap ` :Marks<CR>
nnoremap <C-m> :make<CR>

" Custom commands
command Ga Git add %:p

" CoC config
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" fzf layout
let g:fzf_layout = { 'window': { 'width': 0.5, 'height': 1.0, 'relative': v:true, 'xoffset': 1.0, 'border': 'left' } }
let g:fzf_preview_window = ['up:40%:border-sharp', 'tab']

" Netrw config
let g:netrw_banner = 0
let g:netrw_keepdir = 0

" Signature config, don't overwrite git-gutter 
let g:SignatureMarkerTextHLDynamic = 1
let g:SignatureMarkTextHLDynamic   = 1

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="Visual", timeout=1000}
augroup END

if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p
colorscheme codedark
