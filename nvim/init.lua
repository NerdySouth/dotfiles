-- #########################################################
--                  GENERIC OPTIONS !!!
-- #########################################################

-- disable compatibility with vi (this is redundant, but i prefer explicit
-- settings over implicit defaults
vim.opt.compatible = false             
vim.opt.showmatch = true                -- show matching
vim.opt.ignorecase = true               -- case insensitive searches
vim.opt.smartcase = true                -- ignore case in searches, unless search term has a capital
vim.opt.hlsearch = true                 -- highlight search terms
vim.opt.incsearch = true                -- incremental search 
vim.opt.tabstop = 4                     -- number of columns occupied by a tab
vim.opt.softtabstop = 4                 -- see multiple spaces as tabstops so <BS> does the right 

vim.opt.expandtab = true                -- converts tabs to whitespace
vim.opt.shiftwidth = 4                  -- width for auto indents 
vim.opt.autoindent = true               -- indent a new line the same amount as

vim.opt.number = true                   -- add line numbers
vim.opt.wildmode ="longest,list"        -- bash-like tab completions
vim.opt.cc = "100"                      -- set a 100 column border for good coding style
vim.opt.mouse = 'a'                     -- enable mouse support in all modes
vim.opt.mousefocus = true               -- make neovim follow mouse for which buffer to focus
vim.opt.clipboard = "unnamedplus"       -- make neovim use system clipboard 
vim.opt.cursorline = true               -- highlight current cursor line
vim.opt.ttyfast = true                  -- speed up scrolling in nvim 
vim.opt.encoding = "UTF-8"              -- set encoding

-- run :h completeopt for what all of these do.
vim.opt.completeopt = "menuone,preview,noinsert,noselect"
vim.opt.splitright = true               -- when splitting, place the new window on the right side
vim.opt.splitbelow = true               -- place new window below original

-- if this many ms have passed since the last type event, the swap file will be pushed 
-- to disk. Also used for the CursorHold autocommand event
vim.opt.updatetime = 300

-- have a fixed column for the diagnostics to apprear in. This removes
-- the jitter when warnings/errors flow in.
vim.opt.signcolumn = "yes"           

-- set the runtime path for neovim 
vim.opt.rtp:append("/Users/tristen-macbook/.config/nvim")
-- ############ END GENERIC OPTIONS #######################


-- #########################################################
--                      PLUGINS !!!
-- #########################################################

-- setup plugins 
require('plugins/plugins')

-- set colorscheme, this is done after the plugins since we get the theme from a plugin 
vim.cmd('colorscheme oxocarbon')

-- setup webdev icons (general glyphs plugin)
require("plugins/webdevicons").setup()
-- setup mason for LSP management
require("mason").setup()
-- setup LSP to use COQ_nvim for better completion experience
require("lspconfig").clangd.setup{}
-- setup ZLS
require("plugins/zls").setup()
-- setup neotree 
require("plugins/neotree").setup()
-- setup rust 
require("plugins/rust").setup()

vim.cmd('let g:UltiSnipsExpandTrigger="<return>"')
vim.cmd('let g:UltiSnipsJumpForwardTrigger="<c-b>"')
vim.cmd('let g:UltiSnipsJumpBackwardTrigger="<c-z>"')
-- ############ END PLUGINS #################################



-- #########################################################
--                  AUTOCMDs !!!
-- #########################################################
-- this needs to be converted to lua eventually, but im lazy
-- It shows diagnostic popup on a cursor hold (hover over diagnostic)
-- vim.cmd("autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focusable = false })")
vim.api.nvim_create_autocmd('CursorHold', {
    pattern = {'*'},
    desc = 'Display diagnostic popup when cursor hovers over it.',
    callback = function(event)
        vim.diagnostic.open_float(nil, { focusable = false })
    end
})

-- vim.cmd("autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)")
vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = {'*.rs'},
    desc = 'Format rust files on save.',
    callback = function(event)
        vim.lsp.buf.formatting_sync(nil, 200)
    end
})

-- vim.cmd("autocmd VimEnter * call StartUp()")
-- ensures we always have neotree showing even if we didnt open a specific file or dir.
-- also makes sure TS highlighting is on, and COQ completions is on
vim.api.nvim_create_autocmd('VimEnter', {
    pattern = {'*'},
    desc = 'Open neotree even when we call nvim without any args.',
    callback = function(event)
        vim.cmd("Neotree filesystem reveal left")
        vim.cmd("TSEnable highlight")
        vim.cmd("COQnow")
    end
})

-- ################## END AUTOCMDs #############################


-- #############################################################
--                  KEY REMAPS !!!
-- #############################################################

local map = require("keys/remap").map 

-- use ctrl-[hjkl] to select active buffer
map("n", "<silent>", "<C-k> :wincmd k<CR>")
map("n", "<silent>", "<C-j> :wincmd j<CR>")
map("n", "<silent>", "<C-h> :wincmd h<CR>")
map("n", "<silent>", "<C-l> :wincmd l<CR>")

-- press ctrl+n to toggle neotree 
-- map("n", "<silent>", "<C-f> :NeoTreeFocusToggle<CR>")
vim.cmd("nmap <silent> <C-n> :NeoTreeFocusToggle<CR>")

-- press i to enter insert mode, and kj to exit insert mode
map("i", "kj", "<Esc>")

