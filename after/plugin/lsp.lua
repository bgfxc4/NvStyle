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
	vim.keymap.set("n", "<leader>vce", function() vim.diagnostic.open_float() end, opts)
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
        filetypes = { "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "tex", "pandoc", "quarto", "rmd", "context", "mail", "text" },
        ltex = {
            language = "de-DE"
        }
    }
})

lsp.configure('pylsp', {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          maxLineLength = 200
        }
      }
    }
  }
})

lsp.configure('lemminx', {
  settings = {
    filetypes = { "xml", "xsd", "xsl", "xslt", "svg", "sdf", "urdf" }
  }
})

lsp.setup()
