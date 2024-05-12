require("outline").setup({
    show_relative_numbers = true;
    symbols = {
        filter = { 'String', 'Variable', exclude=true }
    };
    symbol_folding = {
        autofold_depth = false,
    };
})

vim.keymap.set("n", "<leader>o", function() vim.cmd.Outline() end)
