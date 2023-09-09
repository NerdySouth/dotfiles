-- makes sure COQ completions is on, Tree Sitter for all except latex
vim.api.nvim_create_autocmd('VimEnter', {
    pattern = {'*'},
    desc = 'Open neotree even when we call nvim without any args.',
    callback = function(event)
        vim.cmd("COQnow")
        vim.cmd("hi Visual guibg=#000000 guifg=none")

        if vim.bo.filetype ~= "tex" then 
            vim.cmd("TSEnable highlight")
        end

   end
})


-- Shows diagnostic popup on a cursor hold (hover over diagnostic)
vim.api.nvim_create_autocmd('CursorHold', {
    pattern = {'*'},
    desc = 'Display diagnostic popup when cursor hovers over it.',
    callback = function(event)
        vim.diagnostic.open_float(nil, { focusable = false })
    end
})

-- format rust files on save
vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = {'*.rs'},
    desc = 'Format rust files on save.',
    callback = function(event)
        vim.lsp.buf.format(nil, 200, nil)
    end
})

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = {'*'},
    desc = 'Try to format generic files on save',
    callback = function(event)
        vim.cmd("undojoin | Neoformat")
    end
})
