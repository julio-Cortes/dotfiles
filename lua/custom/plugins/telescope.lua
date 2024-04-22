return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'sharkdp/fd',
                    "nvim-telescope/telescope-live-grep-args.nvim", 'nvim-lua/plenary.nvim'},
    config = function()
        require('telescope').load_extension('live_grep_args')
        require("telescope").setup {
            defaults = {
                layout_strategy = 'flex',
                layout_config = {
                    width = 0.9,
                    height = 0.9,
                    prompt_position = "top"
                }
            },
            mappings = {
                i ={
                    ["<S-j>"] = require('telescope.actions').move_selection_next,
                    ["<S-k>"] = require('telescope.actions').move_selection_previous
                }
            }
        }
    end
}
