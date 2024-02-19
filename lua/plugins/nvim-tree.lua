return {
    'nvim-tree/nvim-tree.lua',
    config = function()
        require('nvim-tree').setup({
            update_focused_file = {
                enable = true
            },
            view = {
                width = 30,
                side = 'right'
            }
        })
    end

}
