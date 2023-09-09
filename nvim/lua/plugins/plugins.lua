local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
    Plug('nyoom-engineering/oxocarbon.nvim')
 
    -- game to get good at vim motions
    Plug('ThePrimeagen/vim-be-good')
    -- UI stuff for neo tree
    Plug('MunifTanjim/nui.nvim')

    -- Backend utilities for neo tree (scanning filesystem)
    Plug('nvim-lua/plenary.nvim')

    -- Neo tree, tree structure thingy 
    Plug('nvim-neo-tree/neo-tree.nvim')
    -- Nerdtree structure
    -- Plug 'preservim/nerdtree'

    -- For installing packages/fonts
    Plug('williamboman/mason.nvim')

    -- Nice lsp conf stuff for built in lsp 
    Plug('neovim/nvim-lspconfig')

    -- Zig plugin
    Plug('ziglang/zig.vim')

    -- Snippet engine: Track the engine.
    Plug('SirVer/ultisnips')

    -- Snippets are separated from the engine. Add this if you want them:
    Plug('honza/vim-snippets')

    -- modern completetion
    Plug('ms-jpq/coq_nvim', {branch = 'coq'})
    -- 9000+ Snippets
    Plug('ms-jpq/coq.artifacts', {branch = 'artifacts'})
    
    -- Rust tools
    Plug('neovim/nvim-lspconfig')
    Plug('simrat39/rust-tools.nvim')

    -- twilight uses treesitter to try and latch to function contexts
    Plug('nvim-treesitter/nvim-treesitter')
    --Plug 'folke/twilight.nvim'
    -- icons come last
    Plug('nvim-tree/nvim-web-devicons')

    -- better line number behavior
    Plug('jeffkreeftmeijer/vim-numbertoggle')
vim.call('plug#end')
