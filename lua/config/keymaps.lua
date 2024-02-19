vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, {
    desc = "[A]dd current file to harpoon"
})
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-n>", function()
    ui.nav_prev()
end)
vim.keymap.set("n", "<C-m>", function()
    ui.nav_next()
end)

-- Personal
vim.api.nvim_create_user_command("Crp", function()
    local path = vim.fn.expand("%")
    vim.fn.setreg("+", path)
    vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("WQ", "wq", {})
vim.api.nvim_create_user_command("W", "w", {})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<C-h>", '<C-w>h')
vim.keymap.set("n", "<C-j>", '<C-w>j')
vim.keymap.set("n", "<C-k>", '<C-w>k')
vim.keymap.set("n", "<C-l>", '<C-w>l')
vim.keymap.set("n", "<C-\\>", '<cmd>:.cc<CR>')

vim.keymap.set("n", "<leader>nn", '<cmd>:set relativenumber!<CR>')

vim.keymap.set("n", "<C-a>", "<nop>")

-- NvimTree

vim.keymap.set('n', '<leader>tt', vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>tf", vim.cmd.NvimTreeFindFile)

-- hop
vim.keymap.set('n', '<leader>z', '<cmd>:HopWord<CR>')
vim.keymap.set('x', '<leader>z', '<cmd>:HopWord<CR>')

-- telescope
local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope_builtin.git_files, {})

vim.keymap.set('n', '<leader>fr', '<cmd> lua require("telescope").extensions.live_grep_args.live_grep_args() <cr>')
vim.keymap.set('n', '<leader>fm',
    '<cmd> lua require("telescope").extensions.live_grep_args.live_grep_args() <cr>"class " --iglob **/app/models/** <Home><Right><Right><Right><Right><Right><Right><Right>')
vim.keymap.set('n', '<leader>fg', telescope_builtin.git_bcommits, {})
vim.keymap.set('n', '<leader>fo', telescope_builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, {})
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, {})

vim.keymap.set('n', '<leader>fd', '<cmd> lua require("telescope.builtin").resume()<cr>')

vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        previewer = true

    })
end, {
    desc = '[/] Fuzzily search in current buffer'
})

-- treesittter
require'nvim-treesitter.configs'.on_config_done = function()
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.ejs = {
        install_info = {
            url = "https://github.com/tree-sitter/tree-sitter-embedded-template",
            files = {"src/parser.c"},
            requires_generate_from_grammar = true
        },
        filetype = "erb"
    }
end

-- fugitive

vim.keymap.set("n", "<leader>gs", vim.cmd.Git, {
    desc = '[G]it status'
});
vim.keymap.set("n", "<leader>gb", '<cmd>:Git blame<cr>', {
    desc = '[G]it blame'
});
vim.keymap.set('n', '<leader>gd', '<cmd>:Gvdiffsplit<cr>', {
    desc = '[G]it diff'
})

-- textDocument/diagnostic support until 0.10.0 is released
_timers = {}
local function setup_diagnostics(client, buffer)
    if require("vim.lsp.diagnostic")._enable then
        return
    end

    local diagnostic_handler = function()
        local params = vim.lsp.util.make_text_document_params(buffer)
        client.request("textDocument/diagnostic", {
            textDocument = params
        }, function(err, result)
            if err then
                local err_msg = string.format("diagnostics error - %s", vim.inspect(err))
                vim.lsp.log.error(err_msg)
            end
            local diagnostic_items = {}
            if result then
                diagnostic_items = result.items
            end
            vim.lsp.diagnostic.on_publish_diagnostics(nil, vim.tbl_extend("keep", params, {
                diagnostics = diagnostic_items
            }), {
                client_id = client.id
            })
        end)
    end

    diagnostic_handler() -- to request diagnostics on buffer when first attaching

    vim.api.nvim_buf_attach(buffer, false, {
        on_lines = function()
            if _timers[buffer] then
                vim.fn.timer_stop(_timers[buffer])
            end
            _timers[buffer] = vim.fn.timer_start(200, diagnostic_handler)
        end,
        on_detach = function()
            if _timers[buffer] then
                vim.fn.timer_stop(_timers[buffer])
            end
        end
    })
end

require("lspconfig").ruby_ls.setup({
    on_attach = function(client, buffer)
        setup_diagnostics(client, buffer)
    end,
    root_dir = function(fname)
        return vim.fn.getcwd()
    end

})
require('lspconfig').rubocop.setup({
    filetypes = {"ruby"},
    root_dir = function(fname)
        return vim.fn.getcwd()
    end,
    on_attach = function(client, bufnr)
        setup_diagnostics(client, bufnr)
    end
})
