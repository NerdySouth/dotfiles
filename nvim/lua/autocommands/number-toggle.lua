-- toggle hybrid line numbers on active buffer, but no numbers on all others
vim.api.nvim_create_autocmd({'BufEnter', 'FocusGained', 'WinEnter'}, {
    pattern = {'*'},
    desc = 'Toggles hybrid numbers on and off based on active buffer and mode',
    callback = function(event)
        local ft = vim.bo.filetype
        if ft ~= "neo-tree" then
            vim.o.nu = true
            vim.o.rnu = true
        end
    end
})

vim.api.nvim_create_autocmd({'BufLeave', 'FocusLost', 'WinLeave'}, {
    pattern = {'*'},
    desc = 'Toggles hybrid numbers off when leaving buf, window, lose focus, or enter insert mode',
    callback = function(event)
        if vim.o.nu == true then
            vim.o.nu = false
        end

        if vim.o.rnu == true then
            vim.o.rnu = false
        end
    end
})
