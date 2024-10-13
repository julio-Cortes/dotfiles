vim.keymap.set('n', '<leader>ff', '<cmd> lua require("fzf-lua").files({previewer=false})<cr>', {
    desc = '[ff] Find files in git repository'
})
vim.keymap.set('n', '<leader>fd', '<cmd> lua require("fzf-lua").resume({formatter="path.filename_first"})<cr>', {
})
vim.keymap.set('n', '<leader>fs', '<cmd> lua require("fzf-lua").grep({formatter="path.filename_first"})<cr>', {
})
vim.keymap.set('n', '<leader>fr', '<cmd> lua require("fzf-lua").live_grep_native({formatter="path.filename_first"})<cr>', {
})
vim.keymap.set('n', '<leader>/', '<cmd> lua require("fzf-lua").blines({fzf_opts = {["--layout"] = "reverse"}})<cr>', {
})
vim.keymap.set('v', '<leader>fs', '<cmd> lua require("fzf-lua").grep_visual()<cr>', {
})
vim.keymap.set('n', '<leader>fg', '<cmd> lua require("fzf-lua").git_bcommits()<cr>', {
})
vim.keymap.set('n', '<leader>fb', '<cmd> lua require("fzf-lua").buffers()<cr>', {})








-- - vim.keymap.set('n', '<leader>fr', fzf.resume(), {
-- })
-- -- telescope-- telescope
-- local telescope_builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>ff', telescope_builtin.git_files, {
--     desc = '[ff] Find files in git repository'

-- })

-- vim.keymap.set('n', '<leader>fr', '<cmd> lua require("telescope").extensions.live_grep_args.live_grep_args() <cr>')
-- vim.keymap.set('n', '<leader>fm',
--     '<cmd> lua require("telescope").extensions.live_grep_args.live_grep_args() <cr>"class " --iglob **/app/models/** <Home><Right><Right><Right><Right><Right><Right><Right>',
--     {})
-- vim.keymap.set('n', '<leader>fg', telescope_builtin.git_bcommits, {})
-- vim.keymap.set('n', '<leader>fo', telescope_builtin.oldfiles, {})
-- vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, {})

-- vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, {})

-- vim.keymap.set('n', '<leader>fs', function()
--     telescope_builtin.grep_string({ search = vim.fn.input("Grep > ") })
-- end)
-- vim.keymap.set('n', '<leader>fd', '<cmd> lua require("telescope.builtin").resume()<cr>')

-- vim.keymap.set('n', '<leader>/', function()
--     -- You can pass additional configuration to telescope to change theme, layout, etc.
--     require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
--         previewer = true

--     })
-- end, {
--     desc = '[/] Fuzzily search in current buffer'
-- })
