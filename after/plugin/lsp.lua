local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
	"tsserver",
	"eslint",
	"lua_ls",
})

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    vim.diagnostic.config({
        virtual_text = {
            -- source = "always",  -- Or "if_many"
            prefix = '■', -- Could be '■', '▎', 'x'
        },
        severity_sort = true,
        float = {
            source = "if_many",  -- Or "always"
        },
    })
end)

lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.configure('ltex', {
    settings = {
        ltex = {
            language = "de-DE"
        }
    }
})

lsp.setup()
