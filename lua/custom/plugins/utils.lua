return {
    'max397574/better-escape.nvim', -- jj
    config = function()
        require('better_escape').setup {
            mapping = {'jk', 'jj'},
            timeout = vim.o.timeoutlen,
            clear_empty_lines = false,
            keys = '<Esc>'
        }
    end,
    'gpanders/editorconfig.nvim',
    {
        "iamcco/markdown-preview.nvim",
        cmd = {"MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop"},
        ft = {"markdown"},
        build = function()
            vim.fn["mkdp#util#install"]()
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            require('ibl').setup({})

        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {'nvim-tree/nvim-web-devicons'},
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'tokyonight'
                }
            })

        end
    },

}
