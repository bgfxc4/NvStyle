vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP") -- override and keep register
vim.keymap.set("n", "<leader>d", "\"_d") -- delete to void register
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "<TAB>", vim.cmd.bnext)
vim.keymap.set("n", "<S-TAB>", vim.cmd.bprev)
