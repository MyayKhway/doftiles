vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use ({
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  requires = { {'nvim-lua/plenary.nvim'} }
  })
  use ({ "zootedb0t/citruszest.nvim",})
  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = function()
		  local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
		  ts_update()
	  end,
  }
  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  --- Uncomment these if you want to manage the language servers from neovim
		  -- {'williamboman/mason.nvim'},
		  -- {'williamboman/mason-lspconfig.nvim'},

		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  -- Autocompletion
		  {"williamboman/mason.nvim"},
		  {"williamboman/mason-lspconfig.nvim"},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'L3MON4D3/LuaSnip'},
	  }
  }
  use {
	  'hrsh7th/nvim-cmp',
	  config = function ()
		  require'cmp'.setup {
			  snippet = {
				  expand = function(args)
					  require'luasnip'.lsp_expand(args.body)
				  end
			  },

			  sources = {
				  { name = 'luasnip' },
				  { name = 'path' },
				  { name = 'buffer' },
				  { name = 'nvim-lua' },
				  -- more sources
			  },
		  }
	  end
  }
  use { 'saadparwaiz1/cmp_luasnip' }
  use "rafamadriz/friendly-snippets"
end)
