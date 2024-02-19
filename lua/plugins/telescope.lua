return {
    "nvim-telescope/telescope.nvim",

    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    dependencies = {{
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        enabled = vim.fn.executable("make") == 1
    }, 'sharkdp/fd', "nvim-telescope/telescope-live-grep-args.nvim", 'nvim-lua/plenary.nvim'},
    config = function()
        require('telescope').load_extension('live_grep_args')
        require("telescope").load_extension("fzf")
        require("telescope").setup {
            defaults = {
                layout_strategy = 'flex',
                layout_config = {
                    width = 0.9,
                    height = 0.9,
                    prompt_position = "top"
                },
                mappings = {
                    i = {
                        ["<S-j>"] = require('telescope.actions').move_selection_next,
                        ["<S-k>"] = require('telescope.actions').move_selection_previous

                    }
                }
            },

        }
        

    end,

    keys = {{"<leader>,", vim.NIL}, {"<leader>/", vim.NIL}, {"<leader>:", vim.NIL}, {"<leader><space>", vim.NIL},
    -- find
            {"<leader>fb", vim.NIL}, {"<leader>fc", vim.NIL}, {"<leader>ff", vim.NIL}, {"<leader>fF", vim.NIL},
            {"<leader>fg", vim.NIL}, {"<leader>fr", vim.NIL}, {"<leader>fR", vim.NIL}, -- git
    {"<leader>gc", vim.NIL}, {"<leader>gs", vim.NIL}, -- search
    {'<leader>s"', vim.NIL}, {"<leader>sa", vim.NIL}, {"<leader>sb", vim.NIL}, {"<leader>sc", vim.NIL},
            {"<leader>sC", vim.NIL}, {"<leader>sd", vim.NIL}, {"<leader>sD", vim.NIL}, {"<leader>sg", vim.NIL},
            {"<leader>sG", vim.NIL}, {"<leader>sh", vim.NIL}, {"<leader>sH", vim.NIL}, {"<leader>sk", vim.NIL},
            {"<leader>sM", vim.NIL}, {"<leader>sm", vim.NIL}, {"<leader>so", vim.NIL}, {"<leader>sR", vim.NIL},
            {"<leader>sw", vim.NIL}, {"<leader>sW", vim.NIL}, {"<leader>sw", vim.NIL}, {"<leader>sW", vim.NIL},
            {"<leader>uC", vim.NIL}, {"<leader>ss", vim.NIL}, {"<leader>sS", vim.NIL}}

}
