return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- calling `setup` is optional for customization
        require("fzf-lua").setup({
            "fzf-native",
        })
    end,
    'nvim-lua/plenary.nvim',
}
-- return {
--     'nvim-telescope/telescope.nvim',
--     dependencies = {
--         'sharkdp/fd',
--         "nvim-telescope/telescope-live-grep-args.nvim",
--         'nvim-lua/plenary.nvim',
--         "nvim-telescope/telescope-fzf-native.nvim",
--         build = "make",
--         config = function()
--             require("telescope").load_extension("fzf").setup {
--                 override_generic_sorter = true,
--                 override_file_sorter = true,
--                 case_mode = "smart_case",
--             }
--         end,
--     },
--     config = function()
--         local actions = require('telescope.actions')
--         require('telescope').load_extension('live_grep_args')
--         require("telescope").setup {
--             defaults = {
--                 initial_mode = "insert",
--                 selection_strategy = "reset",
--                 sorting_strategy = "ascending",
--                 layout_strategy = "horizontal",
--                 layout_config = {
--                     horizontal = {
--                         prompt_position = "top",
--                         preview_width = 0.55,
--                         results_width = 0.8,
--                     },
--                     vertical = {
--                         mirror = false,
--                     },
--                     width = 0.87,
--                     height = 0.80,
--                     preview_cutoff = 120,
--                 },
--                 file_sorter = require("telescope.sorters").get_fuzzy_file,
--                 file_ignore_patterns = { "node_modules" },
--                 generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
--                 path_display = { "truncate" },
--                 winblend = 0,
--                 border = {},
--                 file_previewer = require("telescope.previewers").vim_buffer_cat.new,
--                 grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
--                 qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
--             },
--             mappings = {
--                 i = {
--                     ["<S-j>"] = require('telescope.actions').move_selection_next,
--                     ["<S-k>"] = require('telescope.actions').move_selection_previous,
--                 }
--             }
--         }
--     end
-- }
