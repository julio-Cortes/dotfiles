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

-- hop
vim.keymap.set('n', '<leader>z', '<cmd>:HopWord<CR>')
vim.keymap.set('x', '<leader>z', '<cmd>:HopWord<CR>')
vim.keymap.set("n", "f", ":HopChar1<cr>")
vim.keymap.set("x", "f", ":HopChar1<cr>")

----harpoon
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
--
-- -- Grapple
-- vim.keymap.set("n", "<leader>a", function()
--     require("grapple").toggle()
-- end)
-- vim.keymap.set("n", "<C-e>", function()
--     require("grapple").toggle_tags()
-- end)
-- vim.keymap.set("n", "<C-n>", function()
--     require("grapple").cycle_forward()
-- end)
-- vim.keymap.set("n", "<C-m>", function()
--     require("grapple").cycle_backward()
-- end)
-- vim.keymap.set("n", "<S-e>", function()
--     require("grapple").toggle_scopes()
-- end)
-- vim.keymap.set("n", "<leader>x", function()
--     require("grapple").use_scope("cwd")
-- end)
-- vim.keymap.set("n", "<leader>b", function()
--     require("grapple").use_scope("git_branch")
-- end)

require('buffalo').setup({
    tab_commands = nil

})
local buffalo = require("buffalo.ui")

vim.keymap.set("n", "<C-space>", buffalo.toggle_buf_menu, { noremap = true })




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

vim.keymap.set('n', '<leader>tt', '<cmd>:Explore<cr>')
