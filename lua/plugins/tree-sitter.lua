return {
    'nvim-treesitter/nvim-treesitter',
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = {"c", "lua", "vim", "vimdoc", "query", "ruby", "python"},
            sync_install = false,
            auto_install = true,
            indent = {
                enable = false
            },
            highlight = {
                enable = true
            }
        })
    end
}
