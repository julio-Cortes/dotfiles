local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    local opts = {
        buffer = bufnr,
        remap = false
    }
    vim.keymap.set('n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', opts)
    vim.keymap.set('n', 'gf', function()
        vim.lsp.buf.declaration()
    end, opts)
    vim.keymap.set('n', 'K', function()
        vim.lsp.buf.hover()
    end, opts)
    vim.keymap.set("n", "<leader>ca", function()
        vim.lsp.buf.code_action()
    end, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    handlers = { lsp_zero.default_setup,
        require('lspconfig').ruby_ls.setup {
            root_dir = function()
                return vim.fn.getcwd()
            end
        },
        require 'lspconfig'.pylsp.setup {
            settings = {
                pylsp = {
                    plugins = {
                        pycodestyle = {
                            ignore = { 'W391' },
                            maxLineLength = 100
                        }
                    }
                }
            }
        },
        require 'lspconfig'.csharp_ls.setup {}
    }
})

local cmp = require('cmp')
local cmp_select = {
    behavior = cmp.SelectBehavior.Select
}

-- this is the function that loads the extra snippets to luasnip
-- from rafamadriz/friendly-snippets
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    sources = { {
        name = "copilot"
    }, {
        name = 'path'
    }, {
        name = 'nvim_lsp'
    }, {
        name = 'nvim_lua'
    }, {
        name = 'buffer',
        keyword_length = 3
    } },
    formatting = lsp_zero.cmp_format(),
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-\\>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        },
        ['<C-]>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item({
                    behavior = cmp.SelectBehavior.Insert
                })
            elseif luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-]>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item({
                    behavior = cmp.SelectBehavior.Insert
                })
            elseif luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' })
    })
})
