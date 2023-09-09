set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set encoding=UTF-8



set rtp +=~/.config/nvim
call plug#begin('~/.config/nvim/plugged')
    " theme
    Plug 'rockerBOO/boo-colorscheme-nvim'
    "Nerdtree structure
    Plug 'preservim/nerdtree'

    " For installing packages/fonts
    Plug 'williamboman/mason.nvim'

    " Nice lsp conf stuff for built in lsp 
    Plug 'neovim/nvim-lspconfig'

    " Zig plugin
    Plug 'ziglang/zig.vim'

    " Snippet engine: Track the engine.
    Plug 'SirVer/ultisnips'

    " Snippets are separated from the engine. Add this if you want them:
    Plug 'honza/vim-snippets'

    " modern completetion
    Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
    " 9000+ Snippets
    Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
    
    " Rust tools
    Plug 'neovim/nvim-lspconfig'
    Plug 'simrat39/rust-tools.nvim'

    " twilight uses treesitter to try and latch to function contexts
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'folke/twilight.nvim'
    " icons come last
    Plug 'ryanoasis/vim-devicons'
call plug#end()
colorscheme boo
" LSP manager
lua require("mason").setup()

" Setup LSP's to use coq_nvim
lua require "lspconfig".clangd.setup{}

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" ZLS setup
:lua << EOF
    local lspconfig = require('lspconfig')

    local on_attach = function(_, bufnr)
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        require('coq_nvim').on_attach()
    end

    local servers = {'zls'}
    for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
            on_attach = on_attach,
        }
    end
EOF

let g:UltiSnipsExpandTrigger="<return>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" open new split panes to right and below
set splitright
set splitbelow

" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" move split panes to left/bottom/top/right
 nnoremap <A-h> <C-W>H
 nnoremap <A-j> <C-W>J
 nnoremap <A-k> <C-W>K
 nnoremap <A-l> <C-W>L
" move between panes to left/bottom/top/right
 nnoremap <C-h> <C-w>h
 nnoremap <C-j> <C-w>j
 nnoremap <C-k> <C-w>k
 nnoremap <C-l> <C-w>l

" Press i to enter insert mode, and ii to exit insert mode.
:inoremap ii <Esc>

" Press ctrl+n to toggle nerdtree
nmap <C-n> :NERDTreeToggle<CR>

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.diagnostic.goto_next()<CR>

" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
