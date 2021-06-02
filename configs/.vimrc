let mapleader = " "

" set laststatus=2 
" set noshowmode
set encoding=UTF-8
set mouse=a
set nu
" set timeoutlen=0 
" set ttimeoutlen=1000
set wildmode=longest,list

call plug#begin('~/.vim/plugged')
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'tomasiser/vim-code-dark'
  Plug 'sheerun/vim-polyglot'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'epilande/vim-es2015-snippets'
  Plug 'epilande/vim-react-snippets'
  Plug 'iamcco/coc-tailwindcss'
  Plug 'SirVer/ultisnips'
  Plug 'rust-lang/rust.vim'
  Plug 'jiangmiao/auto-pairs'
call plug#end()

nnoremap <C-n> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p
colorscheme codedark
