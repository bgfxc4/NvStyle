local ensure_packer = function()
  	local fn = vim.fn
 	 local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  	if fn.empty(fn.glob(install_path)) > 0 then
    		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    		vim.cmd [[packadd packer.nvim]]
    		return true
  	end
  	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({ function(use)
	use 'wbthomason/packer.nvim'
    use {
        'lewis6991/impatient.nvim',
        config = function()
            require('impatient')
        end
    }
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			vim.cmd("colorscheme catppuccin")
		end
	}
	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional
            {'klen/nvim-config-local'}, -- support for local config files 

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	}
    use('lukas-reineke/indent-blankline.nvim')
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end
    }
    use {
        'glepnir/dashboard-nvim',
        event = "VimEnter",
        requires = {'nvim-tree/nvim-web-devicons'}
    }
    use('numToStr/Comment.nvim')
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
    }
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use('tpope/vim-dadbod')
    use('kristijanhusak/vim-dadbod-ui')
    use('NvChad/nvim-colorizer.lua')
    use('hedyhli/outline.nvim')
	use {
		'folke/todo-comments.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
    if packer_bootstrap then
        require('packer').sync()
    end
end,
config = {
    profile = {
        enable = true,
        threshold = 0 -- the amount in ms that a plugin's load time must be over for it to be included in the profile
    }
}})
