require('personal.autocmd')
require('personal.remap')
require('personal.lsp')
require('personal.telescope')
-- require('personal.nvim-dap')
require('personal.options')

require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "ruby", "javascript", "typescript" },

    sync_install = false,
    auto_install = true,
    rainbow = {
        enable = false,
    },

    highlight = {
        enable = true,
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        additional_vim_regex_highlighting = true,
    },
}

require 'nvim-treesitter.configs'.on_config_done = function()
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.ejs = {
        install_info = {
            url = "https://github.com/tree-sitter/tree-sitter-embedded-template",
            files = { "src/parser.c" },
            requires_generate_from_grammar = true
        },
        filetype = "erb"
    }
end


-- vim.opt.termguicolors = true
vim.cmd('colorscheme tokyonight-storm')
--vim.cmd("colorscheme rose-pine")
--vim.cmd("colorscheme kanagawa")
-- textDocument/diagnostic support until 0.10.0 is released
