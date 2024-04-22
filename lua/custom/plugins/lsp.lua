return {
	'neovim/nvim-lspconfig',
	config = function()
		capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false
	end,
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'hrsh7th/nvim-cmp' ,
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'saadparwaiz1/cmp_luasnip',
	'hrsh7th/cmp-nvim-lua',
	'L3MON4D3/LuaSnip',
	'rafamadriz/friendly-snippets',
	'VonHeikemen/lsp-zero.nvim'

}
