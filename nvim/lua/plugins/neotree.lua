local M = {}

function M.setup()
    local highlights = require("neo-tree.ui.highlights")
    require("neo-tree").setup({
        source_selector = {
            winbar = true,
            statusline = false
        },

        filesystem = {
            filtered_items = {
                never_show_by_pattern = {
                    "*.o",
                },
            },
            components = {
                icon = function(config, node, state)
                    local icon = config.default or " "
                    local padding = config.padding or " "
                    local highlight = config.highlight or highlights.FILE_ICON

                    if node.type == "directory" then
                        highlight = highlights.DIRECTORY_ICON
                        if node:is_expanded() then
                            icon = config.folder_open or "-"
                        else
                            icon = config.folder_closed or "+"
                        end 
                    elseif node.type == "file" then
                        local success, web_devicons = pcall(require, "nvim-web-devicons")
                        if success then
                            local devicon, hl = web_devicons.get_icon(node.name, node.ext)
                            icon = devicon or icon
                            highlight = hl or highlight
                        end
                    end

                    return {
                        text = icon .. padding,
                        highlight = highlight,
                    }
                end,
            }
        }
    })
end

return M
