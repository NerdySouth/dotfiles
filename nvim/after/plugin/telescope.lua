local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ps', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>gr',function()
    builtin.live_grep({ 
        grep_open_files = true,
    });
end)
vim.keymap.set('n', '<leader>b', function() 
    builtin.buffers({
    sort_mru=true, ignore_current_buffer=true
});
end)

