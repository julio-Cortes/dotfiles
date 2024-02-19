
return {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    opts = function()
        local cmp = require('cmp')
        vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
        return {
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
            end, {'i', 's'}),
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
            end, {'i', 's'})
    
        }),
        sources = cmp.config.sources({{
            name = "copilot"
        }, {
            name = "nvim_lsp"
        }, {
            name = "path"
        }}, {{
            name = "buffer"
        }})
    }
    end,
    config = function(_, opts)
        for _, source in ipairs(opts.sources) do
          source.group_index = source.group_index or 1
        end
        require("cmp").setup(opts)
      end,
 

}
