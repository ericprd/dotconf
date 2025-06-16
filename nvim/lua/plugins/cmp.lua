return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local cmp = require("cmp")
		cmp.setup({
			mapping = {
				['<Tab>'] = cmp.mapping.confirm({ select = true })
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			},
		})
	end,
}

