
return {{
    'williamboman/mason-lspconfig',
    config = function()
        require'luasnip'.filetype_extend("ruby", {"rails"})

        require("lspconfig").ruby_ls.setup({

        })
        require('lspconfig').rubocop.setup({})
                          -- require('lspconfig').rubocop.setup({
                        --         filetypes = { "ruby" },
                        --         root_dir = function(fname)
                        --                 return vim.fn.getcwd()
                        --         end,
                        --         on_attach = function(client, bufnr)
                        --                 setup_diagnostics(client, bufnr)
                        --         end
                        -- })

    end
}}

