local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
    -- Plug('nyoom-engineering/oxocarbon.nvim')
    -- Plug('olimorris/onedarkpro.nvim')
    Plug('folke/tokyonight.nvim')
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
    -- Snippet engine: Track the engine.
    Plug('L3MON4D3/LuaSnip')
    -- Snippets are separated from the engine. Add this if you want them:

    -- modern completetion
    Plug('ms-jpq/coq_nvim', {branch = 'coq'})
    -- 9000+ Snippets
    Plug('ms-jpq/coq.artifacts', {branch = 'artifacts'})
    
    -- Rust tools
    Plug('neovim/nvim-lspconfig')
    Plug('simrat39/rust-tools.nvim')

    -- twilight uses treesitter to try and latch to function contexts
    Plug('nvim-treesitter/nvim-treesitter')
    -- icons come last
    Plug('nvim-tree/nvim-web-devicons')

    -- fish script sytax highlighting
    Plug('nickeb96/fish.vim')

    -- LaTex support 
    Plug('lervag/vimtex')

    -- popup terminal
    Plug('voldikss/vim-floaterm')
vim.call('plug#end')
