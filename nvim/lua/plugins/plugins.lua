local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
    -- Plug('nyoom-engineering/oxocarbon.nvim')
    -- Plug('olimorris/onedarkpro.nvim')
    Plug('rose-pine/neovim')
    -- makes all backgrounds transparent
    Plug('xiyaowong/nvim-transparent')

    -- game to get good at vim motions
    Plug('ThePrimeagen/vim-be-good')

    -- UI stuff for neo tree
    Plug('MunifTanjim/nui.nvim')

    -- Backend utilities for neo tree (scanning filesystem)
    Plug('nvim-lua/plenary.nvim')
    Plug('nvim-telescope/telescope.nvim')

    -- Neo tree, tree structure thingy 
    Plug('nvim-neo-tree/neo-tree.nvim')

    -- For installing packages/fonts
    Plug('williamboman/mason.nvim')

    -- Nice lsp conf stuff for built in lsp 
    Plug('neovim/nvim-lspconfig')

    -- Zig plugin
    Plug('ziglang/zig.vim')

    -- eww config language
    Plug('elkowar/yuck.vim')
    
    -- modern completetion
    Plug('ms-jpq/coq_nvim', {branch = 'coq'})
    -- 9000+ Snippets
    Plug('ms-jpq/coq.artifacts', {branch = 'artifacts'})
    
    -- Rust tools
    Plug('simrat39/rust-tools.nvim')

    -- Treesitter
    Plug('nvim-treesitter/nvim-treesitter')
    -- icons come last
    Plug('nvim-tree/nvim-web-devicons')

    -- fish script sytax highlighting
    Plug('nickeb96/fish.vim')

    -- LaTex support 
    Plug('lervag/vimtex')

    -- plugin for running formatters on buffers
    Plug('sbdchd/neoformat')
    
    -- Wiki 
    Plug('vimwiki/vimwiki')

    -- verilog 
    Plug('vhda/verilog_systemverilog.vim')
vim.call('plug#end')
