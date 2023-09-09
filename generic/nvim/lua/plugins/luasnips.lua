local M = {}

function M.config()
    local ls = require("luasnip")

    ls.add_snippets("Rust", {
        ls.parser.parse_snippet(
        'func',
        'fn ${1}(${2}) {\n\t${3}\n}'),
    })
    

    vim.keymap.set(
        'i',
        '<c-p>',
        function() 
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            end
        end
        )

end

return M
