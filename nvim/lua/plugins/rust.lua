local M = {}

function M.setup()
    local nvim_lsp = require('lspconfig')

    nvim_lsp.rust_analyzer.setup {
      settings = {
        ["rust-analyzer"] = {
            settings = {
                check = { allTargets = false }
            }
        },
      }
    }
end 

return M
