let mapleader=","

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>t :NERDTreeToggle<CR>

call plug#begin()
  Plug 'ambv/black'
  Plug 'arcticicestudio/nord-vim'
  Plug 'tpope/vim-fugitive'
  Plug 'preservim/nerdcommenter'
  Plug 'preservim/nerdtree'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'puremourning/vimspector'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'luochen1990/rainbow'

  " lsp plugins
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lua'

  " formatting
  Plug 'lukas-reineke/lsp-format.nvim' 

  Plug 'onsails/lspkind.nvim'

  " Snippets
  Plug 'SirVer/ultisnips'

call plug#end()

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:rainbow_active = 1

set relativenumber
set rtp+=/opt/homebrew/opt/fzf

colorscheme nord

filetype plugin on

syntax on
set autoindent
set smartindent

set tabstop=4                       " ┐
set softtabstop=4                   " │ Set global <TAB> settings.
set shiftwidth=4                    " │
set expandtab                       " ┘

" Remap window leader
nnoremap ,w <C-w>
nnoremap ,, <C-w><C-w>

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Vimspector remaps
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Open init.vim
nnoremap <Leader>vc :e $MYVIMRC<cr>
nnoremap <Leader>vs :so $MYVIMRC<cr>

" Hide tmux status bar when Vim opens
autocmd VimEnter,VimLeave * silent !tmux set status

" Folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
autocmd BufReadPost,FileReadPost * normal zR
