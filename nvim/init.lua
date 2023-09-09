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
vim.cmd.colorscheme('rose-pine')
-- setup webdev icons (general glyphs plugin)
require("plugins/webdevicons").setup()
-- setup mason for LSP management
require("mason").setup()

-- Lang server stuff
local lsp = require "lspconfig"

-- clangd language server
lsp.clangd.setup{}
-- Ensure coq enabled with lsp integration
lsp.clangd.setup(require("coq").lsp_ensure_capabilities())

-- setup ZLS
require("plugins/zls").setup()
-- setup neotree 
require("plugins/neotree").setup()
-- setup rust 
require("plugins/rust").setup()
require("plugins/transparent").setup()
require("plugins/luasnips").config()

-- Snippet keybinds, ENTER will confirm selction of highlighted snippet, 


-- VimTex stuff 
syntax = enable
vim.cmd('let g:vimtex_view_general_viewer = "zathura"')
vim.cmd('let g:tex_flavor = "latex"')
vim.cmd('let g:vimtex_quickfix_mode=0')
vim.cmd('set conceallevel=2')
vim.cmd('let g:tex_conceal="abdmg"')
-- ############ END PLUGINS #################################



-- #########################################################
--                  AUTOCMDs !!!
-- #########################################################
require("autocommands/generic")
require("autocommands/number-toggle")

-- ################## END AUTOCMDs #############################


-- #############################################################
--                  KEY REMAPS !!!
-- #############################################################

local map = require("keys/remap").map 
vim.g.mapleader = " "


-- use ctrl-[hjkl] to select active buffer
vim.keymap.set("n", "<leader>h", ":wincmd h<CR>")
vim.keymap.set("n", "<leader>j", ":wincmd j<CR>")
vim.keymap.set("n", "<leader>k", ":wincmd k<CR>")
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>")


-- press i to enter insert mode, and kj to exit insert mode
vim.keymap.set("i", "kj", "<Esc>");
vim.keymap.set("n", "<leader>f", ":Neotree reveal toggle<CR>")

-- coq repl
vim.g.coq_settings = {
    ["keymap.eval_snips"] = '<leader>r',
    ["keymap.jump_to_mark"] = '<leader>n' 
}

