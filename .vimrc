" set laststatus=2 
set noshowmode
set encoding=UTF-8
set mouse=a
set nu
set timeoutlen=0 
set ttimeoutlen=1000

call plug#begin('~/.vim/plugged')
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'tomasiser/vim-code-dark'
  Plug 'sheerun/vim-polyglot'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()


nnoremap <C-n> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
colorscheme codedark
