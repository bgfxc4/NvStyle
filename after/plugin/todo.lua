require("todo-comments").setup()

vim.keymap.set("n", "<leader>t", function() vim.cmd.TodoTelescope() end)
