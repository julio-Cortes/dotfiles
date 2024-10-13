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

vim.keymap.set("n", "<leader>nn", '<cmd>:set relativenumber!<CR>')

vim.keymap.set("n", "<C-a>", "<nop>")

-- hop
vim.keymap.set("n", "f", ":HopChar1<cr>")
vim.keymap.set("x", "f", ":HopChar1<cr>")

------harpoon
local harpoon = require("harpoon")

harpoon:setup()


vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-m>", function() harpoon:list():next() end)



-- fugitive

vim.keymap.set("n", "<leader>gs", vim.cmd.Git, {
    desc = '[G]it status'
});
vim.keymap.set("n", "<leader>gb", '<cmd>:Git blame<cr>', {
    desc = '[G]it blame'
});


--format

vim.keymap.set('n','<C-f>', '<cmd>:LspZeroFormat<cr>',{remap=true})
-- vim.keymap.set('n','<C-f>', function()
--     local filetype = vim.bo.filetype
--     if (filetype == "eruby") then
--         local filepath = vim.fn.setreg('+', vim.fn.expand('%:p:.'))
--         print("erb-format" .. filepath)
--         vim.cmd("erb-format" .. filepath)
--     end

-- end,{remap=true})

require("oil").setup({
    win_options = {
        list = true
    }
})
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

local hipatterns = require('mini.hipatterns')
hipatterns.setup({
  highlighters = {
    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
    todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
    note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },

    -- Highlight hex color strings (`#rrggbb`) using that color
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})
