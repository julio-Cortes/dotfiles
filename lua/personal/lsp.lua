local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    local opts = {
        buffer = bufnr,
        remap = false
    }
    vim.keymap.set('n', 'gd', '<cmd>lua require("fzf-lua").lsp_definitions()<CR>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua require("fzf-lua").lsp_references()<CR>', opts)
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
-- lsp_zero.extend_lspconfig({
-- })

require('mason').setup({})
require('mason-lspconfig').setup({
    handlers = { lsp_zero.default_setup,
        require('lspconfig').html.setup {
            filetypes = {
                "html", "eruby"
            },
            settings = {
                html = {
                    format = {
                        wrapAttributes = "auto",
                        templating = "true",

                    }
                }
            }
        },
        require('lspconfig').ruby_lsp.setup {
            root_dir = function()
                return vim.fn.getcwd()
            end,
            -- filetypes = {
            --     "ruby", "eruby"
            -- }
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
    }
})

local cmp = require('cmp')

cmp.setup({
    sources = { {
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
    -- mapping = {
    --     ['<C-\\>'] = cmp.mapping.confirm({ select = true }),
    --     ['<C-s>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
    --     ['<C-L>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    -- },
    mapping = cmp.mapping.preset.insert({
        ['<C-\\>'] = cmp.mapping.confirm {

            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        },
        ['<C-]>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item({
                    behavior = cmp.SelectBehavior.Insert
                })
            else
                fallback()
            end
        end, { 'i', 's' }),
    })
})

local isLspDiagnosticsVisible = false
vim.keymap.set("n", "<leader>d", function()
    isLspDiagnosticsVisible = not isLspDiagnosticsVisible
    vim.diagnostic.config({
        virtual_text = isLspDiagnosticsVisible,
        underline = isLspDiagnosticsVisible
    })
end)
